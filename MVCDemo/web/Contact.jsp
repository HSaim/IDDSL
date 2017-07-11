<%-- 
    Document   : Contact
    Created on : Oct 26, 2016, 12:11:44 PM
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">        
	<meta http-equiv="X-UA-Compatible" content="IE=edge">	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Knowledge Management for All Tool (KMAT), Contact Us" />
	<meta name="keywords" content="KMAT, team, user, resource, concept, concept map, list, tool, email, phone, address" />
	<meta name="author" content="KMAT Team" />        
        
         <jsp:include page="includes/link.jsp" /> 
        
        <title>Contact Us</title>
    </head>
    <body class="contact">
        <!-- START wrapper -->
        <div id = "wrapper">
            <!-- START page-->
            <div id = "page">
                <!-- START: header -->                
                <jsp:include page="includes/header.jsp" />                      
                <!-- END: header -->
                
                <!-- START: Banner-->
                <aside id="hero" class="js-fullheight">
                    <div class="flexslider js-fullheight">
                        <ul class="slides">
                            <li style="background-image: url(images/Contact-us.jpg);">
                                <div class="overlay-gradient"></div>
                                <div class="container">
                                    <div class="col-md-10 col-md-offset-1 text-center js-fullheight slider-text">
                                        <div class="slider-text-inner desc">
                                            <h2 class="heading-section">Contact KMAT Team</h2>			   					
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
		</aside>                
                <!-- END: Banner-->
                
                <!-- START: Contact Section -->
                <div id="contact-section">
                    <div class="container" id ="contactform">
                        <form name = "contact-us" method="post" action="SendEmailController" >
                            <div class="row">
                                <div class="col-md-6 col-md-push-6">
                                    <h3 class="section-title">Our Address</h3>

                                    <ul class="contact-info">
                                        <li><i class="icon-location-pin"></i>KADE Lab, LUMS, Lahore</li>
                                        <li><i class="icon-phone2"></i>+92 42 3560 8000</li>
                                        <li><i class="icon-mail"></i>kmat.main@gmail.com</li>
                                        <li><i class="icon-globe2"></i><a href="#">www.kmat.com</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-6 col-md-pull-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Name*" name="name" requied>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="email" class="form-control" placeholder="Email" name="email" >
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <textarea name = "message" class="form-control" id="" cols="30" rows="7" placeholder="Message*"  required></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12" >
                                            <div class="form-group">
                                                <input type="submit" value="Send Message" class="btn btn-primary" >
                                                <span style="color: #4CAF50">                                                    
                                                    <c:out value="${sessionScope.msg}" />
                                                    <c:remove var="msg" scope="session" />                                                    
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
		</div>
		
                 <!-- adds js -->                
                <jsp:include page="includes/js.jsp" /> 
                <!-- footer.jspf integrates here -->
                
