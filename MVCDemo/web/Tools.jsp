<%-- 
    Document   : Tools
    Created on : Apr 20, 2017, 11:15:44 AM
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
	<meta name="description" content="KMAT Composition Ladder Introduction" />
	<meta name="keywords" content="KMAT, composition, ladder, hierarchy" />
	<meta name="author" content="KMAT Team" />
        
        
        <jsp:include page="includes/link.jsp" />    
        <link rel="stylesheet" href="css/banner.css">
        <title>Tools</title>   
    </head>
    
    <body class = "components">
        <div id = "wrapper">
            <!-- START page-->
            <div id = "page">
                <!-- START: header -->                
                <jsp:include page="includes/header.jsp" />                      
                <!-- END: header -->
                
                <!-- START: Banner -->
                
                <div class="page-title" style="background-image: url(images/tools_2.jpg);">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 animate-box">
                                <h1><span class="colored">Tools</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END: Banner-->
                
                <!-- START: Tools Contents-->
                <div id="contact-section">
                    <div class="container">
                        <div class="row text-center">                            
                            <h1 class = "subTitle">KMAT Tools</h1>
                        </div>
                        
                        <table style="width: 100%" cellPadding=5 align=left>
                            <tbody>
                                <tr>
                                    Tools are any application or software that are used to assist in or accomplish some tasks. 
                                    They mainly relate to <a href='ProcessLadder.jsp'>processes</a>. The system allows to establish a link between the process node and the tool(s)
                                        that are associated with it, if any. 
                                    <br/>
                                    Since  tools are already stand-alone applications, 
                                        the system needs to ensure that they can at least be linked to a node 
                                        and can be opened through that node when needed. 
                                        Inputs to the tools can be done while remaining insdie the system 
                                            and output can also be shown within the system. 
                                        This is particularly useful where inputs and results to the tools are in the form of 
                                            images, videos or large data files.
                                </tr>
                                <br/><br/>
                                <tr>
                                    
                                    
                                        This module is responsible for all tools to be added in the system to link with
                                            nodes of roles, <a href='ProcessLadder.jsp'>processes</a>, 
                                            <a href = "CompositionLadder.jsp">compositions</a> and <a href = "ConceptMap.jsp">concept maps</a>. 
                                        Tools are typically used for different components in a process to carry out a process. 
                                        A tool can have resources attached to it that explain how the tool works, 
                                            how to set it up etc.                                       

                                        

                                   
                                </tr>
                            </tbody>
                        </table>
                        
                        <br/><br/>
                        
                        <table style="width: 100%" cellPadding=5 align=left>
                            <tbody>
                                <tr>
                                    <td style="width:80%; vertical-align: top; text-align: left">
                                        On adding a tool, the system first checks if the tool is available in the default application location, 
                                            depending on the operating system. 
                                        If the tool cannot be found, the user is prompted to specify the tool’s location 
                                            which is then stored along with the user id. 
                                        After that, every time the user clicks a particular tool, 
                                            the system opens that tool from the same location. 
                                        If a different user tries to open the tool for the first time, 
                                            again the system checks if the tool is available in the default location. 
                                        If it is not, the user is prompted to locate the tool or install it. 
                                        Using this feature, a KMAT user can work on software applications 
                                            like MSWORD, MSEXCEL etc., within the KMAT environment
                                    </td>
                                     
                                    
                                    <td style="vertical-align:top; text-align:center">
                                            <img id="component_img" src="images/tools_4.jpg">
                                    </td>
                                </tr>                                    
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- END: Tools Contents -->
                
                 <%-- adds js --%>
                <jsp:include page="includes/js.jsp" /> 
                
                
                <%-- footer.jspf integrates here --%>

