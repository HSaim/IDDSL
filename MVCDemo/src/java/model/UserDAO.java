
package model;

/**
 * Query KMAT DB to get, delete, update and insert user's record
 * Insert new user 
 * 
 * @author Habiba Saim
 */
import java.io.PrintWriter;
import java.text.*;
import java.util.*;
import java.sql.*;
//import java.sql.Connection;

public class UserDAO {
  
    static Connection currentCon = null;
    static ResultSet rs = null;  
    static Statement stmt = null;
    static PreparedStatement pst = null;
		
    //Validate username and password while login
    public static LoginUserBean login(LoginUserBean bean) {
	
        //preparing some objects for connection 
            

        String username = bean.getUsername();    
        String password = bean.getPassword();  
        int userId = 0;
        int userLevelId  = 0;
        String accessRight;
        String status;
        List<List<String>> rights_status = new ArrayList<List<String>>();
        

        ResultSet rs1 = null;     // To retrieve user level
        ResultSet rs2 = null;     // To retrieve user access rights
        
        String searchQuery =
              "select * from user_tbl where username='"
                       + username
                       + "' AND password='"
                       + password
                       + "'";	    
        //Check that user is a registered user only
        String searchQuery1 =
              "select * from user_tbl where username='"
                       + username
                       + "' AND password='"
                       + password
                       + "' AND NOT EXISTS" 
                       + "(SELECT  null FROM    unregistered_user_tbl WHERE   user_tbl.user_id = unregistered_user_tbl.user_idfk)" ;	 
        
        String getUserLevelQuery;// = "select level_idfk from user_details_tbl where user_idfk = " +userId;
        String getAccessRightsQuery; 
        String getAccessLevelNameQuery;
        try{                
           //connect to DB 
           currentCon = ConnectionManager.getConnection();
           stmt=currentCon.createStatement();
           rs = stmt.executeQuery(searchQuery1);	        
           boolean more = rs.next();

           // if user does not exist set the isValid variable to false
           if (!more) {           
              //System.out.println("Sorry, you are not a registered user! Please sign up first");
              bean.setValid(false);
           } 

           //if user exists set the isValid variable to true
           else if (more) {         
              
                //System.out.println("Welcome " + username);
                userId = rs.getInt("user_id");
                bean.setUserId(userId);
                bean.setValid(true);
                getUserLevelQuery = "select level_idfk from user_details_tbl where user_idfk = " +userId;
                
                rs1 = stmt.executeQuery(getUserLevelQuery);
                if (rs1.next()){
                    userLevelId = rs1.getInt("level_idfk");
                    bean.setUserLevelId(userLevelId);
                    
                    
                    //Get the access rights of the user
                    getAccessRightsQuery =  "Select access_rights_tbl.right_name, rel_level_right_tbl.status\n" +
                            "	from access_rights_tbl, rel_level_right_tbl\n" +
                            "    where rel_level_right_tbl.level_idfk = " + userLevelId + " and access_rights_tbl.right_id = rel_level_right_tbl.right_idfk";
                    rs2 = stmt.executeQuery(getAccessRightsQuery);
                    while (rs2.next()){
                        accessRight = rs2.getString("right_name");
                        status = rs2.getString("status");
                        List<String> temp = new ArrayList<String>(); 
                        temp.add(accessRight);
                        temp.add(status);
                        rights_status.add(temp);
                    }
                    bean.setAccessRights(rights_status);
                    
                    //Get name of user level
                    getAccessLevelNameQuery = "Select level_name from user_levels_tbl where level_id = " + userLevelId;
                    rs2 = stmt.executeQuery(getAccessLevelNameQuery);
                    
                    if (rs2.next()){
                        bean.setUserLevelName(rs2.getString("level_name"));
                    }
                }
           }
        } 

        catch (Exception ex) {        
           System.out.println("Log In failed: An Exception has occurred! " + ex);
        } 

        //some exception handling
        finally{
            closeConnection();            
          }

        return bean;
    }	
    
    
    public static UserBean recoverAccount(UserBean bean, String newPassword) {
        
        String userName = bean.getUserName();
        String priEmail = bean.getPriEmail();
        String searchUserName =
              "select user_id from user_tbl where username=?"; 
                     
        String searchPriEmail = "Select first_name, email1 from user_details_tbl where user_idfk = ? and email1 = ?";
        String updatePassword = "Update user_tbl set  password = ?, update_dt = NOW() where username = ?";
        int userId;
        try{ 
            
            currentCon = ConnectionManager.getConnection();
                     
            pst =currentCon.prepareStatement(searchUserName);
            pst.setString(1, userName);
            rs = pst.executeQuery();
            //If user id exists then check his primary email
            if (rs.next()){
                userId = rs.getInt("user_id");
                pst =currentCon.prepareStatement(searchPriEmail);
                pst.setInt(1, userId);
                pst.setString(2, priEmail);
                rs = pst.executeQuery();
                //If primary email and user id belong to one user then reset his password in DB
                if (rs.next()){
                    bean.setFirstName(rs.getString("first_name"));
                    bean.setValidUser(true);
                    //If valid user, then update his password
                    pst =currentCon.prepareStatement(updatePassword);
                    pst.setString(1, newPassword);
                    pst.setString(2, userName);
                    pst.executeUpdate();
                    pst.close();
                }
                else{
                    bean.setValidUser(false);
                }
            }
            else{
                bean.setValidUser(false);
            }
            //return bean;
            
        }
        catch (Exception ex) {
        
           ex.printStackTrace();
        } 

        //some exception handling
        finally{       
            
            closeConnection();
        }
        return bean;
    }
    //Add a new user in KMAT DB
    public static UserBean insertUser(UserBean bean) {
        
        
        //preparing some objects for connection 
        // Connection con = null;
        // ResultSet rs1 = null;  
		
        //Statement stmt = null; 
        int user_tbl_Insertion = 0;
        int user_details_tbl_Insertion = 0;
        int userId  = 0;
        
        String userName = bean.getUserName();
        String priEmail = bean.getPriEmail();
        String secEmail = bean.getSecEmail();
        String firstName = bean.getFirstName();
        String lastName = bean.getLastName();
        String password = bean.getPassword();       
        String postalAddress = bean.getPosAddress();
        String perAddress = bean.getPerAddress();
        String workPhone = bean.getWorkPhone();
        String homePhone = bean.getHomePhone();
        String mobPhone = bean.getMobPhone();
       // String hidden = bean.getHidden();
        
        String searchUserName =
              "select username from user_tbl where username='"
                       + userName+"'";
        
        String insertQuery1 = 
                "insert into user_tbl(username, password, create_dt, update_dt) "
                + "VALUES ( '" + userName +"', '" + password + "' , NOW(), NOW())";
        
        String searchUserId =
                 "select user_id from user_tbl where username='"
                       + userName+"'";
        
        try{ 
            if(userName!="" && password!="" && firstName!="" && lastName!="" && priEmail!="" ) {

                currentCon = ConnectionManager.getConnection();
                stmt=currentCon.createStatement();
                rs = stmt.executeQuery(searchUserName);	        
                boolean more = rs.next();
                
                if(more){ // If username already exists 
                    bean.setDuplicateUser(true);
                }
                else{
                    bean.setDuplicateUser(false);
                    //Insertion in 'user_tbl' table
                    user_tbl_Insertion = stmt.executeUpdate(insertQuery1);
                    rs = stmt.executeQuery(searchUserId);
                    
                    if(rs.next())  {  
                        userId = rs.getInt("user_id");
                   
                        String insertQuery2 = 
                            "INSERT INTO user_details_tbl(user_idfk, first_name, last_name, email1, email2, address1,"
                            + " address2, work_phone, mobile_phone, home_phone, details, create_dt, update_dt) "
                            + "VALUES ( " + userId + ", '" + firstName +"', '" + lastName + "', '" + priEmail + "', '" + secEmail + "', '" + postalAddress
                            + "', '" + perAddress + "', '" + workPhone + "', '" + mobPhone + "', '" + homePhone + "', 'details', NOW(), NOW())";
                        user_details_tbl_Insertion = stmt.executeUpdate(insertQuery2);
                        
                        if (user_tbl_Insertion != 0 && user_details_tbl_Insertion != 0) {
                            bean.setUserId(userId);
                            bean.setAdded(true);                            
                        }
                        else{
                            bean.setAdded(false);
                        }
                    }
                }
            }
        } 

        catch (Exception ex) {
        
           System.out.println("Log In failed: An Exception has occurred! " + ex);
        } 

        //some exception handling
        finally{       
            
            closeConnection();
          }

        
        return bean;
    }
    /*
    On signup request, insert unregistered user in unregistered_user_tbl
    
    */
     public static void insertUnregisteredUser(int userId){
         
        String insertQuery = 
                "insert into unregistered_user_tbl (user_idfk) values (" + userId + ")";
        try{
            currentCon = ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            stmt.executeUpdate(insertQuery);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally{
            closeConnection();
        }
     }
    
    /*
    From KE to updates a user profile
    */
    public static UserBean updateUser(UserBean bean){
       
        int userId = bean.getUserId();
        //String userName = bean.getUserName();
        String priEmail = bean.getPriEmail();
        String secEmail = bean.getSecEmail();
        String firstName = bean.getFirstName();
        String lastName = bean.getLastName();
        String password = bean.getPassword();       
        String postalAddress = bean.getPosAddress();
        String perAddress = bean.getPerAddress();
        String workPhone = bean.getWorkPhone();
        String homePhone = bean.getHomePhone();
        String mobPhone = bean.getMobPhone();
        /*
        String searchUserName =
              "select username from user_tbl where username='"
                       + userName+"'";
        */
        String query1 = "Update user_tbl set  password ='" + password +"' , update_dt = NOW() where user_id = '" + userId +"'";
        String query2 = "Update user_details_tbl set first_name ='" +firstName + "', last_name ='" + lastName +"', email1 ='" + priEmail 
                +"', email2 ='" + secEmail+ "', address1 ='" + postalAddress + "', address2 ='" +perAddress + "', work_phone = '" + workPhone +"', "
                + "mobile_phone ='" +mobPhone +"', home_phone ='" + homePhone + "', update_dt = NOW() where user_idfk = '" + userId +"'";
        //preparing some objects for connection 
        try{
            currentCon = ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            //rs = stmt.executeQuery(query);
           // rs = stmt.executeQuery(searchUserName);	        
            //boolean more = rs.next();

           // if(more){ // If username already exists 
                //bean.setDuplicateUser(true);
            //}
            //else{
             //   bean.setDuplicateUser(false);
                stmt.executeUpdate(query1);
                stmt.executeUpdate(query2);
            //}
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
            closeConnection();
        }
        
        return bean;
    }
    
     /*
    From KE to updates a user profile
    */
    public static UserBean updateProfile(UserBean bean){
       
        int userId = bean.getUserId();
        //String userName = bean.getUserName();
        String priEmail = bean.getPriEmail();
        String secEmail = bean.getSecEmail();
        String firstName = bean.getFirstName();
        String lastName = bean.getLastName();
       // String password = bean.getPassword();       
        String postalAddress = bean.getPosAddress();
        String perAddress = bean.getPerAddress();
        String workPhone = bean.getWorkPhone();
        String homePhone = bean.getHomePhone();
        String mobPhone = bean.getMobPhone();
        /*
        String searchUserName =
              "select username from user_tbl where username='"
                       + userName+"'";
        */
        //String query1 = "Update user_tbl set  password ='" + password +"' , update_dt = NOW() where user_id = '" + userId +"'";
        String query = "Update user_details_tbl set first_name ='" +firstName + "', last_name ='" + lastName +"', email1 ='" + priEmail 
                +"', email2 ='" + secEmail+ "', address1 ='" + postalAddress + "', address2 ='" +perAddress + "', work_phone = '" + workPhone +"', "
                + "mobile_phone ='" +mobPhone +"', home_phone ='" + homePhone + "', update_dt = NOW() where user_idfk = '" + userId +"'";
        //preparing some objects for connection 
        try{
            currentCon = ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            //rs = stmt.executeQuery(query);
           // rs = stmt.executeQuery(searchUserName);	        
            //boolean more = rs.next();

           // if(more){ // If username already exists 
                //bean.setDuplicateUser(true);
            //}
            //else{
             //   bean.setDuplicateUser(false);
                //stmt.executeUpdate(query1);
                stmt.executeUpdate(query);
            //}
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
            closeConnection();
        }
        
        return bean;
    }
    
     public static UserBean registerUser(UserBean bean){
        bean = updateUser(bean);
        PreparedStatement ps1;
        int userId=0;
        int done=0; //deletion done or not flag
        String searchUserId =
                "select user_id from user_tbl where username='"
                       + bean.getUserName()+"'"; 
        String deleteFromUnregisteredUserTable = 
                "delete from unregistered_user_tbl where user_idfk =  ?";
               
        
        try{ 
            currentCon = ConnectionManager.getConnection();  
            stmt=currentCon.createStatement();
            rs = stmt.executeQuery(searchUserId);
            
           if(rs.next())  {  
                userId = rs.getInt("user_id");
                ps1 =currentCon.prepareStatement(deleteFromUnregisteredUserTable);
                ps1.setInt(1, userId);
                done = ps1.executeUpdate();
                /*if (done!=0){
                    done =0;
                    ps2 =currentCon.prepareStatement(deleteFromUserTable);
                    ps2.setInt(1, userId);
                    done = ps2.executeUpdate();
                }*/
                //stmt.executeUpdate(deleteFromUserDetailsTable);
                //stmt.executeUpdate(deleteFromUserTable); 
            
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally{
            closeConnection();
        }
         return bean;
         
     }
    
    /*
    Reurns an arraylist of all registered users
    */
    public static ArrayList<UserBean> getRegisteredUsers(String currentUsername){
        ArrayList<UserBean> list = new ArrayList<UserBean>();
        //LoginUserBean currentUser = (LoginUserBean) session.getAttribute("CurrentSessionUser");
         String query = "Select user_tbl.username, user_tbl.password, user_details_tbl.first_name, user_details_tbl.last_name, "
                 + "user_details_tbl.email1, user_details_tbl.email2, "
                + "user_details_tbl.address1,user_details_tbl.address2, user_details_tbl.work_phone, user_details_tbl.home_phone, user_details_tbl.mobile_phone "
                + "from user_tbl, user_details_tbl  "
                + "where user_tbl.user_id = user_details_tbl.user_idfk "
                 + "AND user_tbl.username<> '" + currentUsername +"'"
                 + "AND NOT EXISTS" 
                       + "(SELECT  null FROM    unregistered_user_tbl WHERE   user_tbl.user_id = unregistered_user_tbl.user_idfk)";
        
        //preparing some objects for connection 
        try{
            currentCon = ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            rs = stmt.executeQuery(query);	        
           // boolean more = rs.next();
            while (rs.next()){
               UserBean user = new UserBean();
               
               user.setUserName(rs.getString("username"));
               user.setPassword(rs.getString("password"));
               user.setFirstName(rs.getString("first_name"));
               user.setLastName (rs.getString("last_name"));
               user.setPriEmail(rs.getString("email1"));
               user.setSecEmail(rs.getString("email2"));
               user.setPosAddress(rs.getString("address1"));
               user.setPerAddress(rs.getString("address2"));
               user.setWorkPhone(rs.getString("work_phone"));
               user.setMobPhone(rs.getString("mobile_phone"));
               user.setHomePhone(rs.getString("home_phone"));

               list.add(user);    
            }
        }
        catch(Exception ex){
            
        }
        finally{
            closeConnection();
        }
        return list;
    }
    
    /*
    Reurns an arraylist of all registered users
    */
    public static ArrayList<UserBean> geUnregisteredUsers(String currentUsername){
        ArrayList<UserBean> list = new ArrayList<UserBean>();
        //LoginUserBean currentUser = (LoginUserBean) session.getAttribute("CurrentSessionUser");
         String query = "Select user_tbl.username, user_tbl.password, user_details_tbl.first_name, user_details_tbl.last_name, "
                 + "user_details_tbl.email1, user_details_tbl.email2, "
                + "user_details_tbl.address1,user_details_tbl.address2, user_details_tbl.work_phone, user_details_tbl.home_phone, user_details_tbl.mobile_phone "
                + "from user_tbl, user_details_tbl  "
                + "where user_tbl.user_id = user_details_tbl.user_idfk "
                 + "AND user_tbl.username<> '" + currentUsername +"'"
                 + "AND  EXISTS" 
                       + "(SELECT  null FROM    unregistered_user_tbl WHERE   user_tbl.user_id = unregistered_user_tbl.user_idfk)";
        
        //preparing some objects for connection 
        try{
            currentCon = ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            rs = stmt.executeQuery(query);	        
           // boolean more = rs.next();
            while (rs.next()){
               UserBean user = new UserBean();
               
               user.setUserName(rs.getString("username"));
               user.setPassword(rs.getString("password"));
               user.setFirstName(rs.getString("first_name"));
               user.setLastName (rs.getString("last_name"));
               user.setPriEmail(rs.getString("email1"));
               user.setSecEmail(rs.getString("email2"));
               user.setPosAddress(rs.getString("address1"));
               user.setPerAddress(rs.getString("address2"));
               user.setWorkPhone(rs.getString("work_phone"));
               user.setMobPhone(rs.getString("mobile_phone"));
               user.setHomePhone(rs.getString("home_phone"));

               list.add(user);    
            }
        }
        catch(Exception ex){
            
        }
        finally{
            closeConnection();
        }
        return list;
    }
    /*
    Returns a user with respect to username
    */
    public static UserBean getUser(String userName){
        UserBean user = new UserBean();
        
         String query = "Select user_tbl.user_id, user_tbl.username, user_tbl.password, user_details_tbl.first_name, user_details_tbl.last_name, "
                 + "user_details_tbl.email1, user_details_tbl.email2, "
                + "user_details_tbl.address1,user_details_tbl.address2, user_details_tbl.work_phone, user_details_tbl.home_phone, user_details_tbl.mobile_phone "
                + "from user_tbl, user_details_tbl  "
                + "where user_tbl.username = '"+ userName+"' AND user_tbl.user_id = user_details_tbl.user_idfk";
                       
        
        //preparing some objects for connection 
        try{
            currentCon = ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            rs = stmt.executeQuery(query);	        
           // boolean more = rs.next();
            //while (rs.next()){
              // UserBean user = new UserBean();
            if (rs.next()){
               user.setUserId(rs.getInt("user_id"));
               user.setUserName(rs.getString("username"));
               user.setPassword(rs.getString("password"));
               user.setFirstName(rs.getString("first_name"));
               user.setLastName (rs.getString("last_name"));
               user.setPriEmail(rs.getString("email1"));
               user.setSecEmail(rs.getString("email2"));
               user.setPosAddress(rs.getString("address1"));
               user.setPerAddress(rs.getString("address2"));
               user.setWorkPhone(rs.getString("work_phone"));
               user.setMobPhone(rs.getString("mobile_phone"));
               user.setHomePhone(rs.getString("home_phone"));
               //list.add(user);    
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
            closeConnection();
        }
        return user;
    }
    
    
    public static int deleteUser(String userName){
        PreparedStatement ps1, ps2;
        int userId=0;
        int done=0; //deletion done or not flag
        String searchUserId =
                "select user_id from user_tbl where username='"
                       + userName+"'"; 
        String deleteFromUserDetailsTable = 
                "delete from user_details_tbl where user_idfk =  ?";
        String deleteFromUserTable = 
                "delete from user_tbl where user_id = ?";        
        
        try{ 
            currentCon = ConnectionManager.getConnection();  
            stmt=currentCon.createStatement();
            rs = stmt.executeQuery(searchUserId);
            
           if(rs.next())  {  
                userId = rs.getInt("user_id");
                ps1 =currentCon.prepareStatement(deleteFromUserDetailsTable);
                ps1.setInt(1, userId);
                done = ps1.executeUpdate();
                if (done!=0){
                    done =0;
                    ps2 =currentCon.prepareStatement(deleteFromUserTable);
                    ps2.setInt(1, userId);
                    done = ps2.executeUpdate();
                }
                //stmt.executeUpdate(deleteFromUserDetailsTable);
                //stmt.executeUpdate(deleteFromUserTable); 
            
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally{
            closeConnection();
        }
        return done;
    }
    
    public static int deleteUnregisteredUser(String userName){
        PreparedStatement ps1, ps2, ps3;
        int userId=0;
        int done=0; //deletion done or not flag
        String searchUserId =
                "select user_id from user_tbl where username='"
                       + userName+"'"; 
        String deleteFromUserDetailsTable = 
                "delete from user_details_tbl where user_idfk =  ?";
        String deleteFromUnregUserTable =
                "delete from unregistered_user_tbl where user_idfk = ?";
        String deleteFromUserTable = 
                "delete from user_tbl where user_id = ?";        
        
        try{ 
            currentCon = ConnectionManager.getConnection();  
            stmt=currentCon.createStatement();
            rs = stmt.executeQuery(searchUserId);
            
           if(rs.next())  {  
                userId = rs.getInt("user_id");
                ps1 =currentCon.prepareStatement(deleteFromUserDetailsTable);
                ps1.setInt(1, userId);
                done = ps1.executeUpdate();
                if (done != 0){
                    done =0;
                    ps2 =currentCon.prepareStatement(deleteFromUnregUserTable);
                    ps2.setInt(1, userId);
                    done = ps2.executeUpdate();
                }
                if (done!=0){
                    done =0;
                    ps3 =currentCon.prepareStatement(deleteFromUserTable);
                    ps3.setInt(1, userId);
                    done = ps3.executeUpdate();
                }
                
                //stmt.executeUpdate(deleteFromUserDetailsTable);
                //stmt.executeUpdate(deleteFromUserTable); 
            
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally{
            closeConnection();
        }
        return done;
    }
    
    public static int resetPassword(int userId, String newPassword){
        int done =0;
        String updatePassword = "Update user_tbl set  password = ?, update_dt = NOW() where user_Id = ?";
        
        try{ 
            
            currentCon = ConnectionManager.getConnection();
            pst =currentCon.prepareStatement(updatePassword);
            pst.setString(1, newPassword);
            pst.setInt(2, userId);
            pst.executeUpdate();
            pst.close();
            done = 1;
        }
        catch (Exception ex) {
        
           ex.printStackTrace();
        } 

        //some exception handling
        finally{       
            
            closeConnection();
        }   
        /*
        String userName = bean.getUserName();
        String priEmail = bean.getPriEmail();
        String searchUserName =
              "select user_id from user_tbl where username=?"; 
                     
        String searchPriEmail = "Select first_name, email1 from user_details_tbl where user_idfk = ? and email1 = ?";
        String updatePassword = "Update user_tbl set  password = ?, update_dt = NOW() where username = ?";
        int userId;
        try{ 
            
            currentCon = ConnectionManager.getConnection();
                     
            pst =currentCon.prepareStatement(searchUserName);
            pst.setString(1, userName);
            rs = pst.executeQuery();
            //If user id exists then check his primary email
            if (rs.next()){
                userId = rs.getInt("user_id");
                pst =currentCon.prepareStatement(searchPriEmail);
                pst.setInt(1, userId);
                pst.setString(2, priEmail);
                rs = pst.executeQuery();
                //If primary email and user id belong to one user then reset his password in DB
                if (rs.next()){
                    bean.setFirstName(rs.getString("first_name"));
                    bean.setValidUser(true);
                    //If valid user, then update his password
                    pst =currentCon.prepareStatement(updatePassword);
                    pst.setString(1, newPassword);
                    pst.setString(2, userName);
                    pst.executeUpdate();
                    pst.close();
                }
                else{
                    bean.setValidUser(false);
                }
            }
            else{
                bean.setValidUser(false);
            }
            //return bean;
            
        }
        catch (Exception ex) {
        
           ex.printStackTrace();
        } 

        //some exception handling
        finally{       
            
            closeConnection();
        }
        return bean;
        */
        
        return done;
        
    }
    
    public static ArrayList getUserLevels(){
        ArrayList userLevelsList   = new ArrayList(); 
        // int done =0;
        String getLevels = "Select level_name from user_levels_tbl";
        ResultSet rs;
        try{ 
            
            currentCon = ConnectionManager.getConnection();
            pst =currentCon.prepareStatement(getLevels);
            rs = pst.executeQuery();
            
            
            while (rs.next ()){
                //Add records into data list

                userLevelsList.add(rs.getString("level_name"));               

            }
            pst.close();
            
        }
        catch (Exception ex) {
        
           ex.printStackTrace();
        } 

        //some exception handling
        finally{       
            
            closeConnection();
        }   
        return userLevelsList;
    }
    private static void closeConnection(){
        if (rs != null){
            try {
                rs.close();
            } 
            catch (Exception e) {
            rs = null;
            }
        }
        if (stmt != null) {
            try {
               stmt.close();
            } 
            catch (Exception e) {
               stmt = null;
            } 
        }
       ConnectionManager.putConnection(currentCon);
    }
    
}

    