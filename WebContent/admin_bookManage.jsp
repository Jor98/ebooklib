<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>图书管理</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ready.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/demo.css">
</head>
<body>
	<div class="wrapper">
		<!--
			描述：页面头部
		-->
		<div class="main-header">
			<div class="logo-header">
				<a href="${pageContext.request.contextPath }/book_findAll.action" class="logo">
					图书馆后台管理
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg">
				<div class="container-fluid">
					<!-- 
					<form class="navbar-left navbar-form nav-search mr-md-3" action="">
						<div class="input-group">
							<input type="text" placeholder="Search ..." class="form-control">
							<div class="input-group-append">
								<span class="input-group-text">
									<i class="la la-search search-icon"></i>
								</span>
							</div>
						</div>
					</form>
					 -->
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
					<li class="nav-item">
						<a href="${pageContext.request.contextPath }/user_findAll.action">
							<i class="la la-user"></i>
							<p>用户管理</p>
						</a>
					</li>
					<li class="nav-item active">
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
									<div class="card-title float-left">图书列表</div>
									<div class="float-right" style="margin: 0 10px"><button data-toggle="modal" data-target="#registbook" class="btn btn-success">添加书本</button></div>
									<div class="float-right"><button data-toggle="modal" data-target="#add_category" class="btn btn-success">添加类型</button></div>
								</div>
								<div class="card-body">
									<table class="table table table-head-bg-primary table-bordered mt-0">
										<thead>
											<tr>
												<th scope="col">#</th>	
												<th scope="col">书名</th>
												<th scope="col">作者</th>
												<th scope="col">ISBN编号</th>
												<th scope="col">出版社</th>
												<th scope="col">总库存</th>
												<th scope="col">剩余库存</th>
												<th scope="col">操作</th>
											</tr>
										</thead>
										<tbody>
										
										<s:iterator value="list" var="list" status="status">
										<tr>
											<td><s:property value="book_id"/></td>
											<td><s:property value="book_name"/></td>
											<td><s:property value="book_author"/></td>
											<td><s:property value="book_isbn"/></td>
											<td><s:property value="book_publishing"/></td>
											<td><s:property value="book_total"/></td>
											<td><s:property value="book_residue"/></td>
											<td style="width:180px">
												<button class="btn btn-primary" data-toggle="modal" data-target="#bookdetails" onclick="transmit_bookditails(<s:property value="book_id"/>)">详情</button>
												<s:if test='book_state=="1"'>
													<button class="btn btn-danger" data-toggle="modal" data-target="#deletebook" onclick="transmit(<s:property value="book_id"/>)">下架</button>
												</s:if>
												<s:else>
													<button class="btn btn-success" onclick="transmit_restartbook(<s:property value="book_id"/>)">上架</button>
												</s:else>
											</td>
										</tr>
										</s:iterator>
											<form action="${ pageContext.request.contextPath }/book_restart.action" id="restartform">
												<input type="hidden" id="restart_id" name="book_id"/>
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
	描述：添加书本的模态表单
-->
<div class="modal fade" id="registbook" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-plus-circle"></i> 添加书本</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="card">
					<form action="${ pageContext.request.contextPath }/book_regist.action" method="post" target="_parent" enctype="multipart/form-data">
					<div class="card-body">
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">书名</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full mustinput" name="book_name" placeholder="输入书名">
							</div>
						</div>
						
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">作者</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full mustinput" name="book_author" placeholder="输入作者">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">索引号</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full mustinput" name="book_sortnumber" placeholder="输入索引号">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">ISBN编号</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full" name="book_isbn" placeholder="输入ISBN编号">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">出版社</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full" name="book_publishing" placeholder="输入出版社">
							</div>
						</div>
						<div class="form-group form-inline">
							<label class="col-md-3 col-form-label">选择封面</label>
							<div class="col-md-9 p-0">
								<input type="file" name="upload" />
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">书本简介</label>
							<div class="col-md-9 p-0">
								<textarea  rows="3" class="form-control input-full" name="book_synopsis" style="font-size:12px"></textarea>
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
<div class="modal fade" id="deletebook" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-times-circle"></i> 下架图书</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">									
				<p style="color: red;"><b>确认下架？</b></p>
			</div>
			<form action="${pageContext.request.contextPath }/book_delete.action" method="post" target="_parent" enctype="multipart/form-data">
			<input type="hidden" name="book_id" id="delete_id">
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
	描述：书本详情模态框
-->
<div class="modal fade" id="bookdetails" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:600px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-book"></i> 书本详情</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="user-box" style="width:540px; margin: 0 auto; border-bottom:1px solid #ebedf2 !important; padding:0px 16px 10px 16px;">
					<div style="width: 140px;height:184px; margin: 0 10px;"><img id="details_image" style="width:100%;border-radius: 5px;" alt="book"></div>
					<div class="u-text" style="width:400px">
						<h4 id="details_name"></h4>
						<p id="details_synopsis" class="text-muted"></p>
						<h4 id="details_category" class="text-muted"></h4>
						<input type="hidden" id="details_id" />
						<a href="#" data-toggle="modal" data-target="#book_edit" class="btn btn-rounded btn-info btn-sm" onclick="transmit_bookedit()">修改资料</a>
						<a href="#" data-toggle="modal" data-target="#add_books" class="btn btn-rounded btn-default btn-sm" onclick="transmit_addbooks()">增加库存</a>
						<a href="#" data-toggle="modal" data-target="#add_bookcategory" class="btn btn-rounded btn-info btn-sm" onclick="transmit_addcategory()" id="addcategorybtn">添加类型</a>
						<a href="#" data-toggle="modal" data-target="#del_bookcategory" class="btn btn-rounded btn-default btn-sm" onclick="transmit_delcategory()" id="delcategorybtn">删去类型</a>
					</div>
				</div>
				<div class="float-left" style="margin: 10px 0; margin-top:5px">拥有库存</div>
				<div class="float-right" style="margin: 10px 0; margin-top:5px">共<b id="item_counts"></b>条记录</div>
				<table class="table table-head-bg-info table-bordered mt-0">
					<thead>
						<tr>
							<th scope="col">书本编号</th>
							<th scope="col">借书人</th>
							<th scope="col">借书日期</th>
							<th scope="col">应还日期</th>
							<th scope="col">操作</th>
						</tr>
					</thead>
					<tbody id="books_list">
						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--
	作者：Jor
	时间：2018-11-27
	描述：修改书本的模态表单
-->
<div class="modal fade" id="book_edit" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-plus-circle"></i> 修改资料</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="card">
					<form action="${ pageContext.request.contextPath }/book_update.action" method="post" target="_parent" enctype="multipart/form-data">
					<div class="card-body">
						<input type="hidden" id="edit_id" name="book_id">
						<input type="hidden" id="edit_image" name="book_image">
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">书名</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full mustinput_edit" id="edit_name" name="book_name" placeholder="输入书名">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">作者</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full mustinput_edit" id="edit_author" name="book_author" placeholder="输入作者">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">索引号</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full mustinput_edit" name="book_sortnumber" id="edit_sortnumber" placeholder="输入索引号">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">ISBN编号</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full" name="book_isbn" id="edit_isbn" placeholder="输入ISBN编号">
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">出版社</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full" name="book_publishing" id="edit_publishing" placeholder="输入出版社">
							</div>
						</div>
						<div class="form-group form-inline">
							<label class="col-md-3 col-form-label">选择封面</label>
							<div class="col-md-9 p-0">
								<input type="file" name="upload" />
							</div>
						</div>
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">书本简介</label>
							<div class="col-md-9 p-0">
								<textarea  rows="3" class="form-control input-full" id="edit_synopsis" name="book_synopsis" style="font-size:12px"></textarea>
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
<!--
	作者：Jor
	时间：2018-11-27
	描述：添加库存的模态表单
-->
<div class="modal fade" id="add_books" tabindex="-1" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-plus-circle"></i> 增加库存</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="card">
					<form action="${ pageContext.request.contextPath }/book_addBooks.action" method="post" target="_parent" enctype="multipart/form-data">
					<div class="card-body">
						<input type="hidden" id="add_id" name="book_id">
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">书本编号</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full mustinput-addbooks" id="addbooks_id" name="books_id" placeholder="输入编号">
							</div>
						</div>
					</div>
					<div class="card-action">
						<div class="text-center">
							<button class="btn btn-success" type="submit" id="addbooks_submit" style="margin-right: 8px;">确认</button>
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
	描述：图书借出的模态表单
-->
<div class="modal fade" id="borrowbooks" tabindex="0" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-plus-circle"></i> 图书借出</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="card">
					<form action="${ pageContext.request.contextPath }/user_borrowBooks.action" method="post" target="_parent" enctype="multipart/form-data">
					<div class="card-body">
						<input type="hidden" id="borrowbooks_id" name="books_id">
						
						<div class="form-group form-inline">
							<label for="exampleFormControlSelect1" class="col-md-4 col-form-label">借书人：</label>
							<select class="form-control col-md-8 p-0" name="user_id" id="borrow_userid">
								
							</select>
						</div>
						<div class="form-group form-inline">
							<label for="exampleFormControlSelect1" class="col-md-4 col-form-label">期限(天)：</label>
							<select class="form-control col-md-8 p-0" name="days" id="borrow_days">
								<option selected="selected" value=30>30</option>
								<option value=60>60</option>
								<option value=90>90</option>
								<option value=120>120</option>
							</select>
						</div>
						
					</div>
					<div class="card-action">
						<div class="text-center">
							<button class="btn btn-success" type="submit" id="edit_submit" style="margin-right: 8px;">确认</button>
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
	描述：书本添加类型模态框
-->
<div class="modal fade" id="add_bookcategory" tabindex="0" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-plus-circle"></i> 添加类型</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="card">
					<form action="${ pageContext.request.contextPath }/book_addcategory.action" method="post" target="_parent" enctype="multipart/form-data">
					<div class="card-body">
						<input type="hidden" id="addcategory_bookid" name="book_id"/>
						<div class="form-group form-inline">
							<label for="exampleFormControlSelect1" class="col-md-4 col-form-label">选择类型：</label>
							<select class="form-control col-md-8 p-0" name="category_id" id="book_addcategory">
								
							</select>
						</div>
					</div>
					<div class="card-action">
						<div class="text-center">
							<button class="btn btn-success" type="submit" id="edit_submit" style="margin-right: 8px;">确认</button>
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
	描述：书本删除类型模态框
-->
<div class="modal fade" id="del_bookcategory" tabindex="0" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-times-circle"></i> 删除类型</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="card">
					<form action="${ pageContext.request.contextPath }/book_delcategory.action" method="post" target="_parent" enctype="multipart/form-data">
					<div class="card-body">
						<input type="hidden" id="delcategory_bookid" name="book_id"/>
						<div class="form-group form-inline">
							<label for="exampleFormControlSelect1" class="col-md-4 col-form-label">选择类型：</label>
							<select class="form-control col-md-8 p-0" name="category_id" id="book_delcategory">
								
							</select>
						</div>
					</div>
					<div class="card-action">
						<div class="text-center">
							<button class="btn btn-success" type="submit" id="delbookcategory_submit" style="margin-right: 8px;">确认</button>
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
	描述：添加类型的模态表单
-->
<div class="modal fade" id="add_category" tabindex="0" role="dialog" aria-labelledby="modalUpdatePro" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document" style="width:500px">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<h6 class="modal-title"><i class="la la-plus-circle"></i> 增加类型</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body col-md-12">
				<div class="card">
					<form action="${ pageContext.request.contextPath }/category_add.action" method="post" target="_parent" enctype="multipart/form-data">
					<div class="card-body">
						
						<div class="form-group form-inline">
							<label for="inlineinput" class="col-md-3 col-form-label">类型名</label>
							<div class="col-md-9 p-0">
								<input type="text" class="form-control input-full mustinput-addbooks" id="category_name" name="category_name" placeholder="输入类型名">
							</div>
						</div>
					</div>
					<div class="card-action">
						<div class="text-center">
							<button class="btn btn-success" type="submit" id="addcategory_submit" style="margin-right: 8px;">确认</button>
							<button class="btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 8px;">取消</button>
						</div>
					</div>
					</form>
				</div>
			</div>
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
<script src="js/bookManage.js"></script>
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
	
	function transmit_restartbook(book_id){
		$('#restart_id').val(book_id);
		$('#restartform').submit();
	}
</script>
</html>