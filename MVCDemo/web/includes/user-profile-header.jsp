<%-- 
    Document   : user-profile-header
    Created on : Feb 8, 2017, 10:13:54 AM
    Author     : Habiba Saim
--%>

<!-- This header displays on logged-in user's profile page and change password page -->
<%@page import="model.LoginUserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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
                
                
                <div>
                    <h3 id="userName">
                        <a href="home">Home</a>
                        |
                        <%--
                        <a href = "GetUsersController?action=get-current-user">
                            <button type = "button " title = "Profile" id="uname"  ></button>
                        </a>--%>
                        <a href="GetUsersController?action=get-current-user" class="button" id="uname" title = "Profile"></a>
                       
                        |
                        <a href = "LoginController">
                            Sign out
                        </a>
                    </h3>
                </div>
                <%--
                <nav id="menu-wrap" role="navigation">
                    <ul class="sf-menu" id="primary-menu" >
                        
                        <li class ="home"><a href="home">Home</a></li>
                    </ul>
                </nav>
                --%>
            </div>
        </div>
        <!-- END container -->
    </header>
    <!-- END header-section -->
</div>


<script>
    (function() {
        <% LoginUserBean currentUser = ((LoginUserBean) (session.getAttribute("CurrentSessionUser"))); %>
         var v1 = '<%= currentUser.getUsername() %>';                      
         var label = document.getElementById("uname");

         label.innerHTML = v1;
         //label.style.display = "block";
     })();
</script>

