package com.jor.ebooklib.web.action;

import org.apache.struts2.ServletActionContext;

import com.jor.ebooklib.domain.Admin;
import com.jor.ebooklib.service.AdminService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminAction extends ActionSupport implements ModelDriven<Admin>{
	//模型驱动使用的对象
	private Admin admin = new Admin();
	
	public Admin getModel() {
		// TODO Auto-generated method stub
		return admin;
	}
	
	//注入Service
	private AdminService adminService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	/**
	 * //管理员登陆方法
	 * @return
	 */
	public String login() {
		Admin exisAdmin = adminService.login(admin);
		if(exisAdmin == null) {
			ActionContext.getContext().put(ERROR, "账号或密码错误");
			return LOGIN;
		}else {
			ActionContext.getContext().getSession().put("exisAdmin", exisAdmin);
			return "loginSuccess";
		}
	}
	
	/**
	 * 管理员退出
	 * @return
	 */
	public String logout() {
		ActionContext.getContext().getSession().remove("exisAdmin");
		return LOGIN;
	}

}
