<%@ page language="java" contentType="text/html; charset=UTF-8" import="bean.User"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/Normal.css">
</head>
<body>
<%@include file="taglib.jsp" %>
	<div class="main">
			<div class="menu">
     			<ul>
     			<li>
     				<c:choose>
         				<c:when test="${empty sessionScope.userbean}">
         					<span><a href="${pageContext.request.contextPath}/common/Index.jsp" >Log in</a></span>
         				</c:when>
         
         				<c:otherwise>
         					<span>Welecome, ${sessionScope.userbean.getUsername()}</span>
         					<Span>|</Span>
         					<Span><a href="${pageContext.request.contextPath}/servlet/LogoutService">Log out</a></Span>
         				</c:otherwise>
      				</c:choose>
      			</li>     			

          			<li><a href="${pageContext.request.contextPath}/servlet/ListFileService">File list</a></li>
          			<li><a href="${pageContext.request.contextPath}/servlet/ListExperimentService">Experiment list</a></li>
          			<li><a href="${pageContext.request.contextPath}/common/Profile.jsp">Profile</a></li>
          			 <c:choose>
     					<c:when test="${userbean.getIsAdmin().equals('yes')}">
     						<li><a href="${pageContext.request.contextPath}/servlet/ListUserService">UserList</a><li>
     					</c:when>
     					<c:otherwise>
     						<li></li>
     					</c:otherwise>
     				</c:choose>
     			</ul>
     	 	</div>
		    <div class="list">
		         <form action="${pageContext.request.contextPath}/servlet/EditProfileService"  method="post">
     			<ul>
         			<li>User id:</br><c:out value="${userbean.getUserid()}"></c:out></li>
         			<li>User name:</br><input type="text" name="username" value="${userbean.getUsername()}"></li>
         			<li>Password:</br><input type="text" name="password" value="${userbean.getPassword()}"></li>
         			<li>Email:</br><input type="text" name="email" value="${userbean.getEmail()}"></li>
         			<li>Telephone:</br><input type="text" name="telephone" value="${userbean.getTelephone()}"></li>
         			<li>Address:</br><input type="text" name="address" value="${userbean.getAddress()}"></li>
         			<li><input type="hidden" name="isadmin" value="${userbean.getIsAdmin()}"></li>
         			<li><input type="submit" value="Update"></li>

     			</ul>
     			</form>
			</div>
	</div>

</body>
</html>