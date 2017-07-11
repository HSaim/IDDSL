<%-- 
    Document   : signup-form
    Created on : Nov 14, 2016, 10:11:17 AM
    Author     : Habiba Saim
--%>

<%@page import="model.LoginUserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <input type="text" class="form-control" name="firstname" placeholder="First Name*" onkeyup="nospaces(this);" required>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <input type="text" class="form-control" name="lastname" placeholder="Last Name*" onkeyup="nospaces(this);" required>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">                                            
                <input type="text" class="form-control" id ="user_name" name="user_name" placeholder="User Name*" onkeyup="nospaces(this);" required>                                    
            </div>
        </div>
        <%
            LoginUserBean user = (LoginUserBean) session.getAttribute("CurrentSessionUser");                     
            if (user != null) {
        %>
        <div class="col-md-12">
            <div class="form-group">
                <!--<textarea name="" class="form-control" id="" cols="30" rows="7" placeholder="Message"></textarea>-->
                <input type="text" class="form-control" name="password"  id = "password" placeholder="Password*" required> 
            </div>
        </div>
        <% 
            }
            else {
        %>
        <div class="col-md-12">
            <div class="form-group">                   
                <input type="password" class="form-control" name="password"  id = "password" placeholder="Password*" required> 
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">                    
                <input type="password" class="form-control" id = "re-password" placeholder="Re-enter Password*" onChange="validatePassword();" required>
            </div>
            <div class="registrationFormAlert" id="divCheckPasswordMatch">
            </div>
        </div>
        <% 
            }
        %>
        <div class="col-md-6">
            <div class="form-group">
                <input type="email" class="form-control" name="p_email" placeholder="Primary Email*" required>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <input type="email" class="form-control" name="s_email"  placeholder="Secondary Email">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <input type="text" class="form-control" name="postal_address" placeholder="Postal Address">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <input type="text" class="form-control" name="per_address" placeholder="Permanent Address">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <input type="text" class="form-control" name="w_phone"  placeholder="Work Phone">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <input type="text" class="form-control" name="m_phone" placeholder="Mobile Phone">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <input type="text" class="form-control" name="h_phone" placeholder="Home Phone">
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <input type="submit" value="Creat Account" class="btn btn-primary">
            </div>
        </div>
        
    </div>