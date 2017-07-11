<%-- 
    Document   : MyProfile
    Created on : Jan 16, 2017, 1:02:03 PM
    Author     : Habiba Saim
--%>
<%@page import="model.UserBean"%>
<%@page import="model.LoginUserBean"%>
<!-- Code to prevent user from accessing any user specific page after logout/session-end -->
<%
    response.setHeader("Cache-Control","no-cache");  //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store");  //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires",-1);            //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache");         //HTTP 1.0 backward compatibility
    
    if(session.getAttribute("CurrentSessionUser")==null){
    
        response.sendRedirect("Home.jsp");
    }
%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Logged in user profile">
        <meta name="keywords" content="name, email, address, phone">
        <meta name="author" content="KMAT Team">
        
         <!-- css includes here -->
        <jsp:include page="../../includes/link.jsp" />
        
        <title>My Profile</title>
        
    </head>
    
    <body class = "edit-profile">
        <!-- START wrapper -->
        <div id = "wrapper">
            <!-- START page-->
            <div id = "page">
                <!-- START header -->                
                <jsp:include page="../../includes/user-profile-header.jsp" />       
                <!-- END header -->
                
                <!-- START: Page heading-->
                <aside class="heading-bg" > <!--style="background: url(images/heading-bg1.jpg) repeat;">-->
                    <div class="container">                        
                       My Account                            
                    </div>                        
                </aside>
                <!-- END: Page heading-->
                <%
                    UserBean user = new UserBean();                    
                    user = (UserBean) session.getAttribute("current-user");
                %>
                <div class="container">
                    <div class="row">
                        <!-- START: Page contents -->
                        <div class="col-md-10 col-md-push-2">
                           
                            <form name = "updateProfile" method="post" action="GetUsersController?action=update-profile&&userId=<%=user.getUserId()%>" onSubmit="return verifyEmail()">                               
                                <div class="row">
                                     
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="firstname">First Name*</label>
                                            <input type="text" class="form-control" id = "firstname" name="firstname" placeholder ="null" value = "<%=user.getFirstName() %>" onkeyup="nospaces(this);"  required>                                            
                                        </div>                                        
                                    </div>
                                            
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="lastname">Last Name*</label>
                                            <input type="text" class="form-control" id="lastname" name="lastname" placeholder ="null" value = "<%=user.getLastName() %>"  onkeyup="nospaces(this);" required>                                          
                                        </div>                                        
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <div class="form-group"> 
                                            <label for="user_name">User Name/User Id*</label>
                                            <input type="text" class="form-control" id = "user_name" name="user_name" placeholder ="null"  readonly value = "<%=user.getUserName() %>"  required>                                    
                                        </div>
                                    </div>
                                          
                                    
                                    <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="p_email">Primary Email*</label>
                                                <input type="email" class="form-control" id = "p_email" name="p_email" placeholder ="null" value = "<%=user.getPriEmail()%>" required>
                                            </div>
                                    </div>
                                    <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="s_email">Secondary Email</label>
                                                <input type="email" class="form-control" id = "s_email" name="s_email" placeholder ="null"  value = "<%=user.getSecEmail()%>">
                                            </div>
                                    </div>                                            
                                    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for ="postal_address">Postal Address</label>
                                            <input type="text" class="form-control" id="postal_address" name="postal_address" placeholder ="null"  value = "<%=user.getPosAddress()%>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for ="per_address">Permanent Address</label>
                                            <input type="text" class="form-control" id ="per_address" name="per_address" placeholder ="null" value = "<%=user.getPerAddress()%>">
                                        </div>
                                    </div>                                    
                                    
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for ="w_phone">Work Phone</label>
                                            <input type="text" class="form-control" id= "w_phone" name="w_phone"   placeholder ="null" value = "<%=user.getWorkPhone()%>">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for ="m_phone">Mobile Phone</label>
                                            <input type="text" class="form-control" id="m_phone" name="m_phone" placeholder ="null" value = "<%=user.getMobPhone()%>">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for ="h_phone">Home Phone</label>
                                            <input type="text" class="form-control" id = "h_phone" name="h_phone"  placeholder ="null" value = "<%=user.getHomePhone()%>">
                                        </div>
                                    </div>
                                        
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="submit" value="Save" class="btn btn-primary">
                                            <span style="color: #4CAF50"> ${updateData}</span>
                                        </div>                                        
                                    </div>
                                    
                                </div>
                            </form>
                        </div>
                        <!-- END Page contents -->
                        
                        <!-- START: Left side bar -->
                        <div class="col-md-2 col-md-pull-10 back-color" >
                            <jsp:include page="../../includes/left-sidebar-profile.jsp" />                     
                        </div>         
                        <!-- END: Left side bar -->
                    </div>
                </div>
                          
                <!-- adds js -->                
                <jsp:include page="../../includes/js.jsp" /> 
                <script src="../../js/signup-verifications.js"></script> 
                
                <!-- footer.jspf integrates here -->


        
    
