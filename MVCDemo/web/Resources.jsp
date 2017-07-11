<%-- 
    Document   : Resource
    Created on : Mar 30, 2017, 9:37:00 AM
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
	<meta name="description" content="KMAT Resources Introduction" />
	<meta name="keywords" content="KMAT, Web links, images, videos, and documents, knowledge, linked, users, roles, processes, tools, composition, concept, ladder, hierarchy" />
	<meta name="author" content="KMAT Team" />
        
        
        <jsp:include page="includes/link.jsp" />    
        <link rel="stylesheet" href="css/banner.css">
        <title>Resources</title>   
    </head>
    
    <body class = "components">
        <div id = "wrapper">
            <!-- START page-->
            <div id = "page">
                <!-- START: header -->                
                <jsp:include page="includes/header.jsp" />                      
                <!-- END: header -->
                
                <!-- START: Banner -->
                
                <div class="page-title" style="background-image: url(images/resources_14.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 animate-box">
                                <h1><span class="colored">Resources</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END: Banner-->
                
                <!-- START: Resources Contents-->
                <div id="contact-section">
                    <div class="container">
                        <div class="row text-center">                            
                            <h1 class = "subTitle">What does KMAT mean by resources?</h1>
                        </div>
                        
                        <table style="width: 100%" cellPadding=5 align=left>
                            <tbody>
                                <tr>
                                   Resources are the basic blocks of the system. 
                                   They incorporate knowledge at all levels for each entity in an organization. 
                                   Resources can be linked to users, roles, <a href = 'Tools.jsp'>tools</a>, 
                                   <a href="ProcessLadder.jsp#contact-section">processes</a>, departments, projects or divisions and even to other resources.  
                                </tr>
                                <tr>
                                    
                                    <td style="width:80%; vertical-align: top; text-align: left">
                                       Resources include web links, images(pngs, jpegs etc.), videos (gif, mkv, avi etc.) 
                                            and documents including excel sheets, Power Point slides and simple documents(pdf, docx, txt etc.). 
                                        Each of these can contain different aspects of an entity and hold different information accordingly. 
                                        For example, a simple and much needed resource for a tool can be its user guide which will either be in 
                                            pdf form or some editable form. It can also be a web link. 
                                        Whereas, a simple diagram (in the form of an image perhaps) can be used to highlight different steps in a process.

                                        Since different forms of resources require different  <a href = 'Tools.jsp'>tools</a>, 
                                            which are already out there, KMAT  handles linking of resources, uploading and downloading them 
                                            and opening them in their default application on the end user’s system.

                                        Four types of data resources are being catered in the system, namely: documents, audio/videos, 
                                            images and web-links. 
                                        The KMAT user is able to open, edit/save and share each type of resource according to
                                            his/her access privileges. The figure here shows each type of resource, with the available file extensions 
                                            with which the resource can be stored in the KMAT data store.
                                    </td>
                                    
                                    <td style="vertical-align:top; text-align:center">
                                            <img id="component_img_large" src="images/resources_ext.png">
                                    </td>
                                </tr>
                                </tbody>
                        </table>
                        <table style="width: 100%" cellPadding=5 align=left>
                            <tbody>
                                <tr>
                                    <td style="width: 100%;">
                                    This module is responsible for all resources to be added to the system so that they can be linked with 
                                        roles, <a href = "ProcessLadder.jsp#contact-section">processes</a>, <a href = "CompositionLadder.jsp#contact-section">compositions</a>,
                                        <a href = "ConceptMap.jsp#contact-section">concept maps</a> and  <a href = 'Tools.jsp'>tools</a> when required. 
                                    When a resource is added, it is uploaded onto the server. 
                                    A copy of the resource is also placed on the user’s system where it is accessible to KMAT 
                                        so that it does not have to be located every time. 
                                    Deleting the resource removes only this copy. 
                                    </td>
                                </tr>                                    
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END: Resources Contents -->
                
                 <%-- adds js --%>
                <jsp:include page="includes/js.jsp" /> 
                
                
                <%-- footer.jspf integrates here --%>

