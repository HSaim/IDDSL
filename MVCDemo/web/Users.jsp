<%-- 
    Document   : Users
    Created on : Jun 2, 2017, 12:34:06 PM
    Author     : Habiba Saim
--%>

<!-- Code to prevent user from accessing any user specific page after logout/session-end -->
<%
    response.setHeader("Cache-Control","no-cache");  //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store");  //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires",-1);            //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache");         //HTTP 1.0 backward compatibility
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">        
	<meta http-equiv="X-UA-Compatible" content="IE=edge">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="KMAT Organizations stakeholders Introduction" />
	<meta name="keywords" content="KMAT, organization, stakeholder, manager, knowledge engineer" />
	<meta name="author" content="KMAT Team" />
        
        
        <jsp:include page="includes/link.jsp" />    
        <link rel="stylesheet" href="css/banner.css">
        <title>Users</title>      
    </head>
    
    <body class = "components">
        <div id = "wrapper">
            <!-- START page-->
            <div id = "page">
                <!-- START: header -->                
                <jsp:include page="includes/header.jsp" />                      
                <!-- END: header -->
                
                <!-- START: Banner -->
                <div class="page-title" style="background-image: url(images/users_banner_2.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 animate-box">
                                <h1><span class="colored">Users</h1>
                            </div>
                        </div>
                    </div>
                </div>                
                <!-- END: Banner-->
                
                <!-- START: Users Contents -->
                <div id="contact-section">
                    <div class="container">
                        <div class="row text-center">                            
                            <h1 class = "subTitle">Users of KMAT System</h1>
                        </div>
                        
                        <table style="width: 100%" cellPadding=5 align=left>
                            <tbody>
                                <tr>
                                    <td style="width: 100%; vertical-align: top; text-align: left">
                                        Due to the nature of the application, users would need to be registered to the system. 
                                        Each user will have varying access rights according to the type of organization, 
                                            their role in the organization (specifically the department that they are working in) and 
                                            the duties that they have to perform or processes or projects that they are part of.
                                            <br/>
                                        We focus on two types of users

                                    </td>
                                   
                                </tr>
                                  
                                <tr>                                   
                                    <td>
                                        <br/>
                                        <h3>Knowledge Engineer:</h3>
                                        Knowledge engineer has access to all functions and features available within KMAT.
                                        He can configure user access level, edit and maintain knowledge databases etc. 
                                        He can add, edit and delete ladders, maps and their nodes and links. 
                                        He also has complete access to the tools and resources and 
                                            is responsible for setting up the environment for normal users by 
                                            formulating the knowledge of the organization within the composition ladders, 
                                            process ladders and concept maps and configuring their settings.
                                    </td>
                                </tr>
                                
                                <tr>                                   
                                    <td>
                                        <br/>
                                        <h3>Organization Stakeholders:</h3>
                                        A user can perform tasks based on access granted to different features of the product. 
                                        Typically, any user can view nodes or ladders and concept maps that are shared with him. 
                                         
                                        <br/>
                                        A user can be given ownership of a node or ladder or concept map. 
                                        This allows the user to share the structure with other people, add details and 
                                            attach more tools and resources, that are in the system, to the structure. 
                                        <br/>
                                        There is the provision of addition of external users. 
                                        These are typically people collaborating on projects or services 
                                            but are not employees of the organization. 
                                       Upon request, they can be given access to view particular structures and not the complete system.                                   

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END: Users Contents -->
                
                 <%-- adds js --%>
                <jsp:include page="includes/js.jsp" /> 
                
                
                <%-- footer.jspf integrates here --%>

