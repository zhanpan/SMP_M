package com.pms.code.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pms.code.dao.BaseDao;
import com.pms.code.entity.base.AuthorizationRecord;
import com.pms.code.entity.base.UseWaterElectricity;
import com.pms.code.exception.DAOException;
import com.pms.code.service.UseWaterElectricityService;
import com.pms.code.util.MapperConst;

@Transactional
@Service("useWaterElectricityServiceImpl")
public class UseWaterElectricityServiceImpl implements UseWaterElectricityService {

	private Logger logger = LoggerFactory.getLogger(UseWaterElectricityServiceImpl.class);

	@Autowired
	private BaseDao<UseWaterElectricity, Serializable> useWaterElectricityBaseDaoImpl;

	@Override
	public List<UseWaterElectricity> findUseWaterElectricityByUserIdAndMounth(int userId, int type, String mounth) {
		// TODO Auto-generated method stub
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("type", type);
			map.put("readtime", mounth);
			return (List<UseWaterElectricity>) useWaterElectricityBaseDaoImpl.selectListPoJo(map, MapperConst.UseWaterElectricity_Mapper + ".findUseWaterElectricityInfoByUserId_mounth");
		} catch (DAOException e) {
			logger.error("发生异常:具体信息:{}", e.fillInStackTrace());
			return null;
		}
	}

}
