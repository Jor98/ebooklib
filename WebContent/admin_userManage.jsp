<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>用户管理</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="assets/css/ready.css">
	<link rel="stylesheet" href="assets/css/demo.css">
</head>
<body>
	<div class="wrapper">
		<!--
			描述：页面头部
		-->
		<div class="main-header">
			<div class="logo-header">
				<a href="${pageContext.request.contextPath }/user_findAll.action" class="logo">
					图书馆后台管理
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg">
				<div class="container-fluid">
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
						<li class="nav-item dropdown">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false"> 
							<img src="/images/admin/<s:property value="#session.exisAdmin.admin_image"/>" alt="<s:property value="#session.exisAdmin.admin_account"/>" width="36" class="img-circle">
							<span ><s:property value="#session.exisAdmin.admin_account"/></span>
							</a>
							<ul class="dropdown-menu dropdown-user">
								<li>
									<div class="user-box">
										<div class="u-img"><img src="/images/admin/<s:property value="#session.exisAdmin.admin_image"/>" alt="<s:property value="#session.exisAdmin.admin_account"/>"></div>
										<div class="u-text">
											<h4><s:property value="#session.exisAdmin.admin_name"/></h4>
											<p class="text-muted">普通管理员</p><a href="${pageContext.request.contextPath }/admin_logout.action" class="btn btn-rounded btn-danger btn-sm">退出账号</a></div>
										</div>
									</li>
								</ul>
								<!-- /.dropdown-user -->
							</li>
						</ul>
					</div>
				</nav>
			</div>
		<!--
			左侧导航条 
		-->
		<div class="sidebar">
			<div class="scrollbar-inner sidebar-wrapper">
				<ul class="nav">
					<!-- 
					<li class="nav-item">
						<a href="index.html">
							<i class="la la-dashboard"></i>
							<p>后台首页</p>
							<span class="badge badge-count">5</span>
						</a>
					</li>
					 -->
					<li class="nav-item active">
						<a href="${pageContext.request.contextPath }/user_findAll.action">
							<i class="la la-user"></i>
							<p>用户管理</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="${pageContext.request.contextPath }/book_findAll.action">
							<i class="la la-book"></i>
							<p>图书管理</p>
						</a>
					</li>
					<li class="nav-item">
						<a href="#">
							<i class="la la-bank"></i>
							<p>新闻管理</p>
						</a>
					</li>
				</ul>
			</div>
		</div>
		<!--
			主页面  
		-->
		<div class="main-panel">
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title float-left">用户列表</div>
									<div class="float-right"><button data-toggle="modal" data-target="#adduser" class="btn btn-success">添加用户</button></div>
								</div>
								<div class="card-body">
									<table class="table table table-head-bg-primary table-bordered mt-0">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">学号</th>
												<th scope="col">账号</th>
												<th scope="col">姓名</th>
												<th scope="col">邮箱</th>
												<th scope="col">操作</th>
											</tr>
										</thead>
										<tbody>
										
										<s:iterator value="list" var="list" status="status">
										<tr>
											<td><s:property value="user_id"/></td>
											<td><s:property value="user_number"/></td>
											<td><s:property value="user_account"/></td>
											<td><s:property value="user_name"/></td>
											<td><s:property value="user_email"/></td>
											<td style="width:180px">
												<button class="btn btn-primary" data-toggle="modal" data-target="#userdetails" onclick="transmit_userditails(<s:property value="user_id"/>)">详情</button>
												<s:if test='user_state=="1"'>
													<button class="btn btn-danger" data-toggle="modal" data-target="#deleteuser" onclick="transmit(<s:property value="user_id"/>)">停用</button>
												</s:if>
												<s:else>
													<button class="btn btn-success" onclick="transmit_restart(<s:property value="user_id"/>)">启用</button>
												</s:else>
												<!-- data-toggle="modal" data-target="#deleteuser" -->
											</td>
										</tr>
										</s:iterator>
											<form action="${ pageContext.request.contextPath }/user_restart.action" id="restartform">
												<input type="hidden" id="restart_id" name="user_id"/>
											</form>
										</tbody>
									</table>
								</div>
								<form id="userForm" name="userForm">
								<div class="card-footer text-right">
									共[<B><s:property value="totalCount"/></B>]条记录,[<B><s:property value="totalPage"/></B>]页
									,每页显示
									<select name="pageSize" onchange="to_page()">
										<option value="5" <s:if test="pageSize == 5">selected</s:if>>5</option>
										<option value="10" <s:if test="pageSize == 10">selected</s:if>>10</option>
									</select>条
									<s:if test="currPage != 1">
									[<A href="javascript:to_page(1)">首页</A>]
									[<A href="javascript:to_page(<s:property value="currPage-1"/>)">前一页</A>]
									</s:if>&nbsp;&nbsp;
									<B>
									
									<s:iterator var="i" begin="1" end="totalPage">
										<s:if test="#i == currPage">
											<s:property value="#i"/>
										</s:if>
										<s:else>
											<a href="javascript:to_page(<s:property value="#i"/>)"><s:property value="#i"/></a>
										</s:else>
									</s:iterator>
									
									</B>&nbsp;&nbsp;
									<s:if test="currPage != totalPage">
									[<A href="javascript:to_page(<s:property value="currPage+1"/>)">后一页</A>] 
									[<A href="javascript:to_page(<s:property value="totalPage"/>)">尾页</A>]
									</s:if>
									到
									<input type="text" size="3" id="page" name="currPage" />
									页
									<input type="button" value="Go" onclick="to_page()"/>
								</div>
								</form>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
<!-- Modal -->
<!--
	作者：Jor
	时间：2018-11-27
	描述：添加用户的模态表单
-->
<div class="modal fade" id="adduser" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-user-plus"></i> 添加用户</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="card">
					<form action="${ pageContext.request.contextPath }/user_regist.action" method="post" target="_parent" enctype="multipart/form-data">
					<div class="card-body">
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">学号</label>
							<div class="col-md-10 p-0">
								<input type="text" class="form-control input-full mustinput" name="user_number" placeholder="输入学号">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">账号</label>
							<div class="col-md-10 p-0">
								<input type="text" class="form-control input-full mustinput" name="user_account" placeholder="输入账号">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">密码</label>
							<div class="col-md-10 p-0">
								<input type="password" class="form-control input-full mustinput" name="user_password" placeholder="输入密码">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">姓名</label>
							<div class="col-md-10 p-0">
								<input type="text" class="form-control input-full mustinput" name="user_name" placeholder="输入姓名">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">邮箱</label>
							<div class="col-md-10 p-0">
								<input type="text" class="form-control input-full" name="user_email" placeholder="输入邮箱">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">性别</label>
							<div class="col-md-10 p-0">
								<label class="form-radio-label" style="display:inline">
									<input class="form-radio-input" type="radio" name="user_gender" value="0" checked="checked">
									<span class="form-radio-sign" >男</span>
								</label>
								<label class="form-radio-label" style="display:inline">
									<input class="form-radio-input" type="radio" name="user_gender" value="1">
									<span class="form-radio-sign" >女</span>
								</label>
							</div>
						</div>
						<div class="form-group form-inline">
							<label class="col-md-3 col-form-label">选择头像</label>
							<div class="col-md-9 p-0">
								<input type="file" name="upload" />
							</div>
						</div>										
					</div>
					<div class="card-action">
						<div class="text-center">
							<button class="btn btn-success" type="submit" id="add_submit" disabled="disabled" style="margin-right: 8px;">确认</button>
							<button class="btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 8px;">取消</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!--
	作者：Jor
	时间：2018-11-27
	描述：确认注销的模态表单
-->
<div class="modal fade" id="deleteuser" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-user-times"></i> 注销用户</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">									
				<p style="color: red;"><b>确认注销？</b></p>
			</div>
			<form action="${pageContext.request.contextPath }/user_delete.action" method="post" target="_parent" enctype="multipart/form-data">
			<input type="hidden" name="user_id" id="delete_id">
			<div class="modal-footer">
				<div class="text-center">
					<button class="btn btn-success" style="margin-right: 8px;" >确认</button>
					<button class="btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 8px;">取消</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
<!--
	作者：Jor
	时间：2018-11-27
	描述：用户详情模态框
-->
<div class="modal fade" id="userdetails" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:600px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-user"></i> 用户详情</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="user-box" style="width:350px; margin: 0 auto; border-bottom:1px solid #ebedf2 !important; padding:0px 16px 10px 16px;">
					<div style="width: 140px; margin: 0 10px;"><img id="details_image" style="width:100%;border-radius: 5px;" alt="user"></div>
					<div class="u-text">
						<h4 id="details_name"></h4>
						<p id="details_account" class="text-muted"></p>
						<p id="details_number" class="text-muted"></p>
						<p id="details_phone" class="text-muted"></p>
						<input type="hidden" id="details_id" />
						<a href="#" data-toggle="modal" data-target="#user_edit" class="btn btn-rounded btn-success btn-sm" onclick="transmit_useredit()">修改资料</a>
					</div>
				</div>
				<div class="float-left" style="margin: 10px 0; margin-top:5px">所借图书</div>
				<div class="float-right" style="margin: 10px 0; margin-top:5px">共<b id="item_counts"></b>条记录</div>
				<table class="table table-head-bg-info table-bordered mt-0">
					<thead>
						<tr>
							<th scope="col">书本编号</th>
							<th scope="col">书名</th>
							<th scope="col">应还日期</th>
							<th scope="col">是否超时</th>
							<th scope="col">操作</th>
						</tr>
					</thead>
					<tbody id="borrow_books">
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--
	作者：Jor
	时间：2018-11-27
	描述：修改用户的模态表单
-->
<div class="modal fade" id="user_edit" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-user-plus"></i> 添加用户</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="card">
					<form action="${ pageContext.request.contextPath }/user_update.action" method="post" target="_parent" enctype="multipart/form-data">
					<div class="card-body">
						<input type="hidden" id="edit_id" name="user_id">
						<input type="hidden" id="edit_image" name="user_image">
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">学号</label>
							<div class="col-md-10 p-0">
								<input type="text" class="form-control input-full mustinput_edit" id="edit_number" name="user_number" placeholder="输入学号">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">账号</label>
							<div class="col-md-10 p-0">
								<input type="text" class="form-control input-full mustinput_edit" id="edit_account" name="user_account" placeholder="输入账号">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">密码</label>
							<div class="col-md-10 p-0">
								<input type="password" class="form-control input-full mustinput_edit" id="edit_password" name="user_password" placeholder="输入密码">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">姓名</label>
							<div class="col-md-10 p-0">
								<input type="text" class="form-control input-full mustinput_edit" id="edit_name" name="user_name" placeholder="输入姓名">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-2 col-form-label">邮箱</label>
							<div class="col-md-10 p-0">
								<input type="text" class="form-control input-full" id="edit_phone" name="user_email" placeholder="输入邮箱">
							</div>
						</div>
						<div class="form-group form-inline">
							<label class="col-md-3 col-form-label">选择头像</label>
							<div class="col-md-9 p-0">
								<input type="file" name="upload" />
							</div>
						</div>										
					</div>
					<div class="card-action">
						<div class="text-center">
							<button class="btn btn-success" type="submit" id="edit_submit" disabled="disabled" style="margin-right: 8px;">确认</button>
							<button class="btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 8px;">取消</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!--
	作者：Jor
	时间：2018-11-27
	描述：确认归还的模态表单
-->
<div class="modal fade" id="returnbook" tabindex="0" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-user-times"></i> 归还图书</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">									
				<p style="color: red;"><b>确认归还？</b></p>
			</div>
			<form action="${pageContext.request.contextPath }/borrow_returnbook.action" method="post" target="_parent" enctype="multipart/form-data">
			<input type="hidden" name="borrow_id" id="borrow_id">
			<div class="modal-footer">
				<div class="text-center">
					<button class="btn btn-success" style="margin-right: 8px;" >确认</button>
					<button class="btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 8px;">取消</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
<script src="assets/js/core/jquery.3.2.1.min.js"></script>
<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="assets/js/core/popper.min.js"></script>
<script src="assets/js/core/bootstrap.min.js"></script>
<script src="assets/js/plugin/chartist/chartist.min.js"></script>
<script src="assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
<script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>
<script src="assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="assets/js/ready.min.js"></script>
<script src="js/userManage.js"></script>
<script type="text/javascript">
	$('#displayNotif').on('click', function(){
		var placementFrom = $('#notify_placement_from option:selected').val();
		var placementAlign = $('#notify_placement_align option:selected').val();
		var state = $('#notify_state option:selected').val();
		var style = $('#notify_style option:selected').val();
		var content = {};

		content.message = 'Turning standard Bootstrap alerts into "notify" like notifications';
		content.title = 'Bootstrap notify';
		if (style == "withicon") {
			content.icon = 'la la-bell';
		} else {
			content.icon = 'none';
		}
		content.url = 'index.html';
		content.target = '_blank';

		$.notify(content,{
			type: state,
			placement: {
				from: placementFrom,
				align: placementAlign
			},
			time: 1000,
		});
	});
</script>
</html>