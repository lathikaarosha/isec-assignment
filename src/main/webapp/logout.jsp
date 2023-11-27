<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>

<%
    // Retrieve the current session
    HttpSession sessions = request.getSession();

    // Invalidate the session to clear all attributes
    sessions.invalidate();

    // Redirect to the login page
    response.sendRedirect(request.getContextPath() + "/login.jsp");
%>