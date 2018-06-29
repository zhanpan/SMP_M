package com.pms.code.service;

import java.util.HashMap;

import com.pms.code.entity.base.User;

/**
 * 管理员接口
 * @author Dell
 *
 */
public interface UserService {
	 
	/**
	 * 修改密码
	 * @param map
	 * @return
	 */
	boolean updatePassWord(HashMap<String,Object> map);
	
	/**
	 * 根据用户名查找用户信息
	 * @author dengfei E-mail:dengfei200857@163.com
	 * @time 2018年3月29日 下午5:26:12
	 * @param userName
	 * @return
	 */
	User queryUserInfo(String userName);
}
