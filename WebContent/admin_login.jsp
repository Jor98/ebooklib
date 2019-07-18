<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员登陆</title>
<link rel="stylesheet" type="text/css" href="css/login_style.css" />
<link rel="stylesheet" type="text/css" href="css/login_body.css"/> 
</head>
<body>
<div class="container">
	<section id="content">
		<form action="${ pageContext.request.contextPath }/admin_login.action" method="post" target="_parent">
			<h1>管理员登陆</h1>
			<div>
				<input type="text" placeholder="账号" required="" id="username" name="admin_account"/>
			</div>
			<div>
				<input type="password" placeholder="密码" required="" id="password" name="admin_password"/>
			</div>
			<div>
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
			</div>
			<div><span style="color:red">${ error }</span></div>
			<div>
				<!-- <input type="submit" value="Log in" /> -->
				<input type="submit" value="登陆" class="btn btn-primary" id="js-btn-login"/>
			</div>
		</form><!-- form -->
	</section><!-- content -->
</div>
<!-- container -->
</body>
</html>