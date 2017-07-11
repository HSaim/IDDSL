<%-- 
    Document   : Home
    Created on : Oct 28, 2016, 11:56:54 AM
    Author     : Habiba Saim
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
    <head>        
        <meta charset="utf-8">
        
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>KMAT-Home</title>
        
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Knowledge Management for All Tool (KMAT)" />
	<meta name="keywords" content="KMAT, resource, concept, concept map, list, tool, resources, composition, ladder, process" />
	<meta name="author" content="KMAT Team" />
        
        <jsp:include page="includes/link.jsp" /> 
        
        
    </head>
    <body class = "home">
        <!-- START wrapper -->
        <div id = "wrapper">
            <!-- START page-->
            <div id = "page">
                <!-- START header -->
                 <jsp:include page="includes/header.jsp" />                 
                <!-- END header -->
                
                <!-- Slider Starts-->                
                <%@ include file="includes/slider.jsp" %>
                <!-- Slider Ends -->
                
                <!-- KMAT Components Starts-->
                <div id="features">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 text-center features-heading animate-box" data-animate-effect="fadeIn">
                                <h2>KMAT Features</h2>
                                <p>KMAT provides following basic components. <br> 
                                 
                                <c:if test="${CurrentSessionUser == null}">
                                    <a href="Home.jsp#get-signin">Sign-up</a> to use them.</p>
                                </c:if>
                                
                            </div>
                           
                            <div class="col-md-4 item-block animate-box" data-animate-effect="fadeIn">
                                <div class="sub-feature">

                                    <figure>
                                        <img src="images/process.jpeg" alt="Process Ladder" class="img-responsive">                                        
                                    </figure>
                                    <div class="sub-feature-innter">
                                        <h3><a href="ProcessLadder.jsp">Process Ladders</a></h3>
                                        <div class="price-status">
                                            <span class="price">Program excitation</span>
                                        </div>
                                        <p>Represent the processes being run in an organization</p>
                                    </div>
                                    <p class="sub-feature-specification">                                            
                                    </p>
                                </div>					
                            </div>
                            
                            <div class="col-md-4 item-block animate-box" data-animate-effect="fadeIn">
                                <div class="sub-feature">

                                    <figure>
                                        <img src="images/CompositionLadder1_1.jpg" alt="Composition Ladder" class="img-responsive">                                        
                                    </figure>
                                    <div class="sub-feature-innter">
                                        <h3><a href="CompositionLadder.jsp">Composition Ladders</a></h3>
                                        <div class="price-status">
                                            <span class="price">Hierarchies</span>
                                        </div>
                                        <p>Parts of knowledge objects and their hierarchy of composition</p>
                                    </div>
                                    <p class="sub-feature-specification">
                                            
                                    </p>
                                </div>					
                            </div>
                           
                            <div class="col-md-4 item-block animate-box" data-animate-effect="fadeIn">
                                <div class="sub-feature">

                                    <figure>
                                        <img src="images/cptmap2.png" alt="Concept Map" class="img-responsive">
                                        <!--<a href="#" class="tag">For Sale</a>-->
                                    </figure>
                                    <div class="sub-feature-innter">
                                        <h3><a href="ConceptMap.jsp">Concept Maps</a></h3>
                                        <div class="price-status">
                                            <span class="price">Relationships</span>
                                        </div>
                                        <p>Represent relationships between ideas, images, or words</p>
                                    </div>
                                    <p class="sub-feature-specification">                                            
                                    </p>
                                </div>					
                            </div>
                        </div>
                        
                        <div class="row">
                            
                            <div class="col-md-4 item-block animate-box" data-animate-effect="fadeIn">
                                <div class="sub-feature">
                                    <figure>
                                        <img src="images/resources_4.jpg" alt="resources" class="img-responsive">                                        
                                    </figure>
                                    <div class="sub-feature-innter">
                                        <h3><a href="Resources.jsp">Resources</a></h3>
                                        <div class="price-status">
                                            <span class="price">System's basic blocks</span>
                                        </div>
                                        <p>Web links, images, videos, and documents</p>
                                    </div>
                                    <p class="sub-feature-specification">                                                                               
                                    </p>
                                </div>					
                            </div>
                            
                            <div class="col-md-4 item-block animate-box" data-animate-effect="fadeIn">
                                <div class="sub-feature">
                                    <figure>
                                        <img src="images/tools_3.jpg" alt="tools" class="img-responsive">                                        
                                    </figure>
                                    <div class="sub-feature-innter">
                                        <h3><a href="Tools.jsp">Tools</a></h3>
                                        <div class="price-status">
                                            <span class="price">Softwares/applications</span>
                                        </div>
                                        <p>Linked to processes to accomplish a task</p>
                                    </div>
                                    <p class="sub-feature-specification">                                       
                                    </p>
                                </div>					
                            </div>
                           
                            <div class="col-md-4 item-block animate-box" data-animate-effect="fadeIn">
                                <div class="sub-feature">
                                    <figure>
                                        <img src="images/users_4.jpg" alt="users" class="img-responsive">                                        
                                    </figure>
                                    <div class="sub-feature-innter">
                                        <h3><a href="Users.jsp">Users</a></h3>
                                        <div class="price-status">
                                            <span class="price">System users</span>
                                        </div>
                                        <p>Knowledge Engineers, project managers, administrators etc. </p>
                                    </div>
                                    <p class="sub-feature-specification">                                        
                                    </p>
                                </div>					
                            </div>

                        </div>
                    </div>
                </div>            
                <!-- END: KMAT Components -->                
                
                
                <!-- START: Sign in -->
                <c:if test="${CurrentSessionUser == null}">
                    <div id="get-signin">
                        <div class="container">
                            <div class="row text-center signin-heading">
                                <div class="col-md-8 col-md-offset-2">                                    
                                    <h2 class="text-styled">Sign in</h2>
                                </div>
                            </div>

                            <div class="get-signin">
                                <form class="form-inline" method="post" action="LoginController?action=login" >
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label for="username" class="sr-only">User Name</label>
                                            <input type="text" class="form-control" name="username" id="name" placeholder="User Name">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="form-group">
                                            <label for="password" class="sr-only">Password</label>
                                            <input type="password" class="form-control" name = "password" id="password" placeholder="Password">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-4">
                                        <button type="submit" class="btn btn-default btn-block">Login</button>
                                    </div>
                                </form>                            
                            </div>
                            <br/><br/>
                            <div class="row text-center">
                                <div class="col-md-3 ">                                    
                                        <p>No account? <a href="SignUp.jsp" class="btn btn-default btn-block">Sign Up</a></p>
                                </div>

                                <div class="col-md-3 ">
                                    <p>Forgotten password? <a href = "RecoverAccount.jsp" class="btn btn-default btn-block">Recover account</a></p>
                                </div>
                                <div class="col-md-6 "> 
                                </div>
                            </div>

                        </div>
                    </div>                
                </c:if>
                <!-- END: Sign in -->
             
                <!-- adds js -->                
                <%@ include file="includes/js.jsp" %>
                
                <!-- footer.jspf integrates here -->
                
                