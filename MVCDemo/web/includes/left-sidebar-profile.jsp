<%-- 
    Document   : left-sidebar-profile
    Created on : Feb 8, 2017, 10:27:29 AM
    Author     : Habiba Saim
--%>

<!-- The left side-bar to appear when user is viewing and updating his profile -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sidebox" id = "navbar">
    <h3 class="sidebox-lead">My Profile</h3>	
    <ul class="sidebox-menu">
        <li class = "edit-profile selected" >
            <a href="GetUsersController?action=get-current-user">
                <div class="sidebox-menu-blurb-sub">
                    Edit Profile
                </div>
            </a>
        </li>

        <li class = "change-password">
            <a href = "change-password">
                <div class="sidebox-menu-blurb-sub">
                    Reset Password
                </div>
            </a>
        </li>

        <li>
            <div class="extend-sidebar"> <!-- Spaces are added here to stretch the side-bar -->
                <p></p>
            </div>
        </li>
        
    </ul>
</div>       