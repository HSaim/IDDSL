
package model;

//import java.util.ArrayList;
import java.util.List;

/**
 * LoginUserBean to set and get user details
 * @author Habiba Saim
 */


public class LoginUserBean implements java.io.Serializable {
    private String username;
    private String password;
    private int userId;
    private int userLevelId;                               //User access level id
    private String userLevelName;                          //User access level name

    public String getUserLevelName() {
        return userLevelName;
    }

    public void setUserLevelName(String userLevelName) {
        this.userLevelName = userLevelName;
    }
    private  List<List<String>> accessRights;          //Access rights of the logged in user

    public List<List<String>> getAccessRights() {
        return accessRights;
    }

    public void setAccessRights(List<List<String>> accessRights) {
        this.accessRights = accessRights;
    }

    public int getUserLevelId() {
        return userLevelId;
    }

    public void setUserLevelId(int userLevelId) {
        this.userLevelId = userLevelId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public boolean valid;
    
    public String getPassword() {
       return password;
    }

    public void setPassword(String newPassword) {
       password = newPassword;
    }


    public String getUsername() {
       return username;
    }

    public void setUserName(String newUsername) {
       username = newUsername;
    }

    public boolean isValid() {
       return valid;
    }

    public void setValid(boolean newValid) {
       valid = newValid;
    }	
    
}
