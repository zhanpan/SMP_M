package com.pms.code.util;

/**
 * 房源信息编码
 * @author dengfei E-mail:dengfei200857@163.com
 * @time 2018年3月23日 下午1:22:44
 */
public class BuildingUtil {

	/**
	 * 获得小区物业编码（ID）
	 * @author dengfei E-mail:dengfei200857@163.com
	 * @time 2018年3月23日 下午2:02:41
	 * @param p_m_id
	 * @return
	 */
	public static String getBuildingID(int p_m_id){
		if(p_m_id < 10){
			return "CS0000000"+p_m_id;
		}else if(p_m_id < 10){
			return "CS000000"+p_m_id;
		}else if(p_m_id > 10 && p_m_id < 100){
			return "CS00000"+p_m_id;
		}else if(p_m_id > 100 && p_m_id < 1000){
			return "CS0000"+p_m_id;
		}else if(p_m_id > 1000 && p_m_id < 10000){
			return "CS000"+p_m_id;
		}else if(p_m_id > 10000 && p_m_id < 100000){
			return "CS00"+p_m_id;
		}else if(p_m_id > 100000 && p_m_id < 1000000){
			return "CS0"+p_m_id;
		}else if(p_m_id > 1000000 && p_m_id < 10000000){
			return "CS"+p_m_id;
		}else{
			return "CSFXWX00"+p_m_id;
		}
	}
}
