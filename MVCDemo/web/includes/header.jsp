<%-- 
    Document   : header
    Created on : Oct 24, 2016, 12:58:47 PM
    Author     : Habiba Saim
--%>

<%@page import="model.LoginUserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<div id = "header">
    <!-- START header-section -->
    <header id="header-section">
        <!-- START container -->
        <div class="container">
            <div class="nav-header">
                <a href="#" class="js-nav-toggle nav-toggle"><i></i></a>
                <div>
                <h1 id="logo"><a href="Home.jsp">KMAT</a></h1>
                </div>
                <%
                    LoginUserBean user = (LoginUserBean) session.getAttribute("CurrentSessionUser");                     
                    if (user != null) {
                %>
                <div>
                    <h3 id="userName">                        
                           <a href="GetUsersController?action=get-current-user" class="button" id="uname" title = "Profile"></a>
                       
                        |
                        <a href = "LoginController">
                            Sign out
                        </a>
                    </h3>
                </div>
                <% }
                %>
                <!-- START #menu-wrap -->
                <nav id="menu-wrap" role="navigation">
                    <ul class="sf-menu" id="primary-menu" >
                        <% 
                            if (user != null){
                        %>
                            
                        <li class = "home"><a  href="home">Home</a></li>   
                        <% }
                           else {
                        %>
                        <li class = "home"><a  href="Home.jsp">Home</a></li>
                        <%}
                        %>
                        <li class = "components">
                            <a href="#" class="fh5co-sub-ddown">KMAT Components</a>
                            <ul class="sub-menu">
                                <li><a href="">Ladders</a>                                
                                    <ul class="sub-menu">
                                        <li><a href="CompositionLadder.jsp" onclick="open">Composition Ladder</a></li>
                                        <li><a href="ProcessLadder.jsp">Process Ladder</a></li>                                        
                                    </ul>
                                </li>
                                <li><a href = "ConceptMap.jsp">Concept Map</a></li>
                                <li><a href = "Resources.jsp">Resources</a></li>
                                <li><a href = "Tools.jsp">Tools</a></li>
                                <li><a href = "Users.jsp">Users</a></li>                               
                            </ul>
                        </li>
                        <li class  = "about"><a href="AboutKMAT.jsp">About KMAT</a></li>
                        <li class = "contact"><a href="Contact.jsp">Contact KMAT</a></li>
                         <%
                            user= (LoginUserBean) session.getAttribute("CurrentSessionUser");                     
                            if (user == null) {
                        %>
                        <li class="cta home"><a href="Home.jsp#get-signin">Login</a></li>                        
                         <% }                                                         
                         %>
                        
                       
                    </ul>
                </nav>
                <!-- END menu-wrap -->
            </div>
        </div>
        <!-- END container -->
    </header> 
    <!-- END header-section -->
</div>

<script>
	function callMatlabScript()
	{
		alert("Opening MATLAB");
		
	}
</script>

<script>
    (function() {      
               <% 
                   user= (LoginUserBean) session.getAttribute("CurrentSessionUser");  
            if (user != null){%>
            var v1 = '<%= user.getUsername() %>';                      
            var label = document.getElementById("uname");

            label.innerHTML = v1;
            
        <%}
        %>
    })();
</script>
