<%-- 
    Document   : ProcessLadder
    Created on : Feb 15, 2017, 4:30:44 PM
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
	<meta name="description" content="KMAT Process Ladder Introduction" />
	<meta name="keywords" content="KMAT, process, ladder, function" />
	<meta name="author" content="KMAT Team" />
        
        
        <jsp:include page="includes/link.jsp" />    
        <link rel="stylesheet" href="css/banner.css">
        <title>Process Ladder</title>       
    </head>
    
    <body class = "components">
        <div id = "wrapper">
            <!-- START page-->
            <div id = "page">
                <!-- START: header -->                
                <jsp:include page="includes/header.jsp" />                      
                <!-- END: header -->
                
                <!-- START: Banner -->
                <div class="page-title" style="background-image: url(images/DESIGN-PROCESS.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 animate-box">
                                <h1><span class="colored">Process Ladders</h1>
                            </div>
                        </div>
                    </div>
                </div>                
                <!-- END: Banner-->
                
                <!-- START: Process Ladder Contents -->
                <div id="contact-section">
                    <div class="container">
                        <div class="row text-center">                            
                            <h1 class = "subTitle">What is a Process Ladder?</h1>
                        </div>
                        
                        <table style="width: 100%" cellPadding=5 align=left>
                            <tbody>
                                <tr>
                                    A Process is a set of interrelated activities that interact to achieve a result, and is simply known as "program in excitation".
                            
                                    It is a data structure that can be used to model a complete process such as student’s course enrollment, Point-of-Sale transaction, forest preservation/management etc.
                                </tr>
                                <br/><br/>
                                <tr>
                                    <td style="width: 40%; vertical-align: top; text-align:  center">
                                            <img id="component_img" src="images/process-ladder-example.png">
                                    </td>
                                    <td style="vertical-align: top; text-align: left">
                                        The process ladder is composed of pre-existing or already defined functions that let users complete a job. 
                                        An example of a process ladder is shown in the figure, where the process for monitoring crops health is given.

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END: Process Ladder Contents -->
                
                 <%-- adds js --%>
                <jsp:include page="includes/js.jsp" /> 
                
                
                <%-- footer.jspf integrates here --%>

