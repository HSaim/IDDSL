<%-- 
    Document   : AboutKMAT
    Created on : Feb 28, 2017, 10:29:09 AM
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
	<meta name="description" content="Knowledge Management for All Tool (KMAT), Contact Us" />
	<meta name="keywords" content="KMAT, team, user, resource, concept, concept map, list, tool, components, composition, ladder" />
	<meta name="author" content="KMAT Team" />        
        
         <jsp:include page="includes/link.jsp" /> 
        
        <title>About KMAT</title>
    </head>
    
    <body class="about">
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
                            <li style="background-image: url(images/About_us2.jpg);">
                                <div class="overlay-gradient"></div>
                                
                            </li>
                        </ul>
                    </div>
		</aside>                
                <!-- END: Banner-->
                
                <!-- START: KMAT Intro Contents-->
                <div id="contact-section">
                    <div class="container">
                        <div class="row text-center">                            
                            <h1 class = "subTitle">Knowledge Management for All Tool (KMAT)</h1>
                        </div>
                        
                        <table style="width: 100%" cellPadding=5 align=left>
                            <tbody>
                                
                                <tr>
                                    <td style="width: 60%; vertical-align: top; text-align: left">
                                        <b>An organizational knowledge management system</b>
                                        <br/>
                                        KM in an organization is employed to identify, capture, and analyze the knowledge to 
                                        help the organization work more effectively and efficiently through better communication, 
                                        sharing best practices, avoiding repetition of mistakes and better decision making. 
                                        
                                        This is necessary as most companies suffer when key staff members leave the company, 
                                        and as a result best practices are lost.
                                        
                                        Most of the organizations practicing KM believe that it leads to enhanced productivity, 
                                        in creating new opportunities, sharing best practices, reducing costs, and staff attraction and retention.
                                    </td>
                                    <td style="vertical-align: top; text-align:  center">
                                            <img id="component_img" src="images/km-2.jpg">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <br/><br/>
                                    <td style="width: 100%; vertical-align: top; text-align:  center">
                                            <img  src="images/km-1.jpg">
                                    </td>
                                </tr>
                                
                                <tr>                                    
                                    <td style="width: 100%; vertical-align: top; text-align: left">
                                        <br/><br/>
                                        <b>KMAT</b> provides a global knowledge gathering, storing, analyzing, distributing, and sharing system. 
                                        <b>KMAT</b> is different from the data management and information management systems in the sense 
                                        that it deals with knowledge, not the raw data or labeled data (information). 
                                        
                                        Knowledge is described as interpretable information; it means some actionable information.

                                    </td>                                    
                                </tr>
                                
                                <tr>                                   
                                    <td>
                                        <br/>
                                        <h3>Our Mission: </h3>
                                        The main aim of our product is to cater the needs of SME sector, 
                                        and thus drive businesses towards a knowledge driven environment. 
                                        
                                        Our intention is to provide the world, a knowledge management system, 
                                        which is affordable and at the same time global in nature 
                                        i.e. target multiple knowledge sources rather than a few.  
                                        
                                        We tend to facilitate multi-dimensional knowledge flows and empower all stake holders.
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                        <br/>
                                        <h3>Our Methodology:</h3>
                                        The objectives for the development of such a system are achieved by 
                                        incorporating different knowledge representation models: 
                                        composition ladders, process ladders and concept maps 
                                        along with enabling linking of users, resources and tools with each of these. 
                                        
                                        It focuses on integrating and linking different users, departments and processes 
                                        together along with the resources required by each and the tools used in certain processes.
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END: KMAT Intro Contents--> 
                
                <!-- START: KMAT Team Intro Contents-->                
                <div id="about-section" class="colored-bg">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3 text-center heading">
                                <i class="sl-icon-people"></i>
                                <h2>Our Staff</h2>
                                <p>Meat the KMAT Team</p><br><br>
                            </div>
                        </div>                        
                        
                        <div class="row">
                            <!-- START: Employee 1-->
                            <div class="col-md-4 text-center">
                                <div class="about-wrap">
                                    <div class="about">
                                            <img src="images/author.jpg" alt="">
                                    </div>
                                    <div class="desc">
                                        <h3>Name 1</h3>
                                        <p class="pos">CEO, Developer</p>
                                        <p>Place the Job Description here</p>
                                        
                                    </div>
                                </div>
                            </div>
                            <!-- END: Employee 1-->   
                             
                            <!-- START: Employee 2--> 
                            <div class="col-md-4 text-center">
                                <div class="about-wrap">
                                    <div class="about">
                                            <img src="images/author.jpg" alt="">
                                    </div>
                                    <div class="desc">
                                        <h3>Name 2</h3>
                                        <p class="pos">Web Designer</p>
                                        <p>Place the Job Description here</p>
                                            
                                    </div>
                                </div>
                            </div>
                            <!-- END: Employee 2--> 
                            
                            <!-- START: Employee 3-->
                            <div class="col-md-4 text-center">
                                <div class="about-wrap">
                                    <div class="about">
                                        <img src="images/author.jpg" alt="">
                                    </div>
                                    <div class="desc">
                                        <h3>Name 3</h3>
                                        <p class="pos">Web Developer</p>
                                        <p>Place the Job Description here</p>                                            
                                    </div>
                                </div>
                            </div>
                            <!-- END: Employee 3-->
                        </div>
                    </div>
		</div>
                <!-- END: KMAT Team Intro Contents--> 
                
                <!-- adds js -->                
                <jsp:include page="includes/js.jsp" /> 
                <!-- footer.jspf integrates here -->