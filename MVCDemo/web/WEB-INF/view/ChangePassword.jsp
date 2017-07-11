<%-- 
    Document   : ChangePassword
    Created on : Jan 16, 2017, 1:58:01 PM
    Author     : Habiba Saim
--%>

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
        <meta name="description" content="Logged in user password change option">
        <meta name="keywords" content="old, new, current, password">
        <meta name="author" content="KMAT Team">
        
         <!-- css includes here -->
        <jsp:include page="../../includes/link.jsp" />
        
        <title>Change Password</title>
    </head>
    
    <body class = "change-password">
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
                       Reset Password                            
                    </div>                        
                </aside>
                <!-- END: Page heading-->
                
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 col-md-push-2">
                            <form name = "reset-password" method="post" action="GetUsersController?action=resetPassword" >
                                <div class = "row">
                                    <div class="col-md-5 ">
                                        <div class="form-group">
                                            <label for="CurentPassword">Current Password*</label>
                                            <input type="password" class="form-control" id="CurentPassword" name = "oldPassword" placeholder="Enter current password" required>
                                        </div>
                                    </div>
                                </div>
                                <div class = "row">
                                    <div class="col-md-5 ">
                                        <div class="form-group">
                                            <label for="password">New Password*</label>
                                            <input type="password" class="form-control" id="password" name= "newPassword" placeholder="Enter new password" required>
                                        </div>
                                    </div>
                                </div>
                                <div class = "row">
                                    <div class="col-md-5 ">
                                        <div class="form-group">
                                            <label for="re-password">Retype Password*</label>
                                            <input type="password" class="form-control" id="re-password" name = "re-password" placeholder="Retype password" onChange="validatePassword();" required>
                                        </div>
                                        <div class="registrationFormAlert" id="divCheckPasswordMatch">
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class = "row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="submit" value="Reset" class="btn btn-primary">
                                            <span style="color: #4CAF50"> ${resetMessage}</span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                                        
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


        
    
