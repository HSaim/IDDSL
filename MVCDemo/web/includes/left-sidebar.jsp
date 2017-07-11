<%-- 
    Document   : left-sidebar
    Created on : Oct 31, 2016, 12:32:36 PM
    Author     : Habiba Saim
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.LoginUserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
    

<div class="sidebox" id = "navbar">
  
    <%--
        LoginUserBean user = (LoginUserBean) session.getAttribute("CurrentSessionUser");                     
        String userLevel = user.getUserLevelName();
        
        if (userLevel.equalsIgnoreCase("L0")){ 
    %>
    <c:if test="${CurrentSessionUser.userLevelName == 'L0'}"> 
--%>
    <c:choose>
         <c:when test="${CurrentSessionUser.userLevelName == 'L0'}">
    
  
    <!--<h3 class="sidebox-lead">KMAT Components</h3>	-->
    
        <jsp:include page="left-sidebar-L0.jsp" />  
    </c:when>
    <c:when test="${CurrentSessionUser.userLevelName == 'L1'}">
    <%--}
    else if(userLevel.equalsIgnoreCase("L1")){
    --%>
    <jsp:include page="left-sidebar-L1.jsp" />  
    
    </c:when>
    </c:choose>
    <%--}
    --%>
</div>

                     