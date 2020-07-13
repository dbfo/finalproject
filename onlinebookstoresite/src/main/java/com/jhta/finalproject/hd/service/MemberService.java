package com.jhta.finalproject.hd.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.hd.dao.MemberDao;
import com.jhta.finalproject.hd.vo.LoginCheckVo;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public LoginCheckVo membercheck(HashMap<String, Object>map) {
		return dao.membercheck(map);
	}
}
