package com.pms.code.service.impl;

import java.io.Serializable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pms.code.dao.BaseDao;
import com.pms.code.entity.base.UnlockingKey;
import com.pms.code.exception.DAOException;
import com.pms.code.service.UnlockingKeyService;
import com.pms.code.util.MapperConst;

import java.util.HashMap;
import java.util.Map;

@Transactional
@Service("unlockingKeyServiceImpl")
public class UnlockingKeyServiceImpl implements UnlockingKeyService{
	
	private Logger logger = LoggerFactory.getLogger(UnlockingKeyServiceImpl.class);
	
	@Autowired
	private BaseDao<UnlockingKey, Serializable> unlockingKeyBaseDaoImpl;
	

	@Override
	public UnlockingKey findUnlockingKeyByID(int id) {
		// TODO Auto-generated method stub
		try {
			Map<String,Object> map= new HashMap<String,Object>();
			map.put("id", id);
			return (UnlockingKey) unlockingKeyBaseDaoImpl.selectOne(MapperConst.UnlockingKey_Mapper+".findKeyInfoByID", map);
			} catch (DAOException e) {
				logger.error("发生异常:具体信息:{}", e.fillInStackTrace());
				return null;
			}
	}
	 
}
