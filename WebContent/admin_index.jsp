<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理主页</title>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body>
	<h1>Login Succeed</h1>
	<h3>用户id：<s:property value="#session.exisAdmin.admin_id"/></h3>
	<h3>账号名：<s:property value="#session.exisAdmin.admin_account"/></h3>
	<h3>账号密码：<s:property value="#session.exisAdmin.admin_password"/></h3>
	<h1>添加新用户</h1>
	<form action="${ pageContext.request.contextPath }/user_save.action" method="post" target="_parent" enctype="multipart/form-data">
		<input type="button" value="添加用户" onclick="window.location.href = 'user_regist.jsp'"><br/>
		<input type="button" value="用户管理" onclick="window.location.href = '${ pageContext.request.contextPath }/user_findAll.action'"/><br/>
		<input type="button" value="添加书本" onclick="window.location.href = 'book_add.jsp'"><br/>
		<input type="button" value="书本列表" onclick="window.location.href = '${ pageContext.request.contextPath }/book_findAll.action'"/><br/>
		<input type="button" value="添加类型" onclick="window.location.href = 'category_add.jsp'"><br/>
		<input type="button" value="类型列表" onclick="window.location.href = '${ pageContext.request.contextPath }/category_findAll.action'"/><br/>
	</form>
</body>
</html>