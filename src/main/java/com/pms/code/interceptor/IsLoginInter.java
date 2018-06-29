package com.pms.code.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ToDoWhat
 * @author xmm
 */
public class IsLoginInter implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(IsLoginInter.class);

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		Exception e = (Exception) arg0.getAttribute("exception");
		if (e != null) {
			logger.error("出错啦！", e);
		}
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		String servletPath = arg0.getServletPath();
		System.out.println("--------------" + servletPath);
		// 客户端请求过滤         	                               
		if ("/login".equals(servletPath) || "/doLogin".equals(servletPath) || "/querySysNotice".equals(servletPath)
				|| "/editSysNotice".equals(servletPath) || "/deleteSysNotice".equals(servletPath)
				|| "/saveEditConvenienceInfo".equals(servletPath)|| "/editPayCatInfo".equals(servletPath)
				|| "/editConvenienceInfo".equals(servletPath)|| "/saveEditUnOwnerPayCat".equals(servletPath)
				|| "/deleteConvenienceInfo".equals(servletPath)  || "/deleteUnPayCatInfo".equals(servletPath)
				|| "/insertSysNotice".equals(servletPath) || "/queryOwnerAccount".equals(servletPath) 
				|| "/queryOwnerPayCatInfo".equals(servletPath) || "/ownerPayCatEnter".equals(servletPath)
				|| "/qureyMonthCost".equals(servletPath) || "/queryOwnerUnPayCatInfo".equals(servletPath)
				|| "/ownerPayCatEnter".equals(servletPath) || "/editMaintenance".equals(servletPath)
				|| "/queryMaintanance".equals(servletPath) || "/ownerAccountManager".equals(servletPath)
				|| "/queryFeedBackInfo".equals(servletPath) || "/queryConvenienceInfo".equals(servletPath)
				|| "/insertConvenienceInfo".equals(servletPath) || "/index".equals(servletPath)
				|| "/sysnoticeManager".equals(servletPath) || "/saveEditSysNotice".equals(servletPath)
				|| "/queryOwnerUnPayCatInfo".equals(servletPath) || "/convenienceInfo".equals(servletPath)
				|| " /queryOpenDoorRecord".equals(servletPath)|| "/queryOpenDoorRecord".equals(servletPath)
				|| "/deleteOwnerAccount".equals(servletPath)|| "/saveEditMaintenance".equals(servletPath)
				|| "/addOwnerAccount".equals(servletPath)|| "/saveEditOwnerAccountInfo".equals(servletPath)
				|| "/deleteOwnerAccountInfo".equals(servletPath)|| "/deleteMaintenanceInfo".equals(servletPath)
				|| "/sel_FeedbackInfo".equals(servletPath)|| "/querySysNoticeByPmid".equals(servletPath)
				|| "/deleteFeedBackInfo".equals(servletPath)|| "/login_forgetb_fls".equals(servletPath)
				|| "/queryPMDlist".equals(servletPath)|| "/editPMDInfo".equals(servletPath)
				|| "/saveEditPMDInfo".equals(servletPath) ||"/deletePMD".equals(servletPath)
				|| "/addPMD".equals(servletPath)|| "/insertMaintenance".equals(servletPath)
				|| "/login_forget".equals(servletPath)|| "/login_forgetb".equals(servletPath)
				|| "/outLogin".equals(servletPath)|| "/modifyPassWord".equals(servletPath)
				|| "/queryEquipmentSysProviderInfo".equals(servletPath)|| "/sendMailCode".equals(servletPath)
				|| "/deleteEquipmentSysProviderInfo".equals(servletPath)|| "/updatePassWord".equals(servletPath)
				|| "/editEquipmentSysProviderInfo".equals(servletPath)
				|| "/saveEditEquipmentSysProvider".equals(servletPath)
				|| "/insertEquipmentSysProvider".equals(servletPath)
				|| "/saveEditOwnerInfo".equals(servletPath)
				|| "/queryPropertyInfo".equals(servletPath)
				|| "/sendMailCode".equals(servletPath)
				|| "/payCatManager".equals(servletPath)|| "/editOwnerAccountInfo".equals(servletPath)) { 
			System.out.println("------放行--------" + servletPath);
			return true; 
			// 后台请求过滤
		} else if ("/login".equals(servletPath)) {
			System.out.println("------放行--------" + servletPath);
			return true;
		} else {
			System.out.println("------重定向--------" + servletPath);
			arg1.sendRedirect(arg0.getContextPath() + "/login");
			return false;
		}
	}

}
