package com.jhta.finalproject.hd.service;

import java.util.HashMap;
import java.util.List;

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
	
	//탈퇴시 체크 service
	
	public int ordercheck(int mnum) {
		return dao.ordercheck(mnum);
	}
	public int depositapplycheck(int mnum) {
		return dao.depositapplycheck(mnum);
	}
	public List<Integer> depositcheck(int mnum){
		return dao.depositcheck(mnum);
	}
	public int obsellercheck(int mnum) {
		return dao.obsellercheck(mnum);
	}
	public int obcheck(int snum) {
		return dao.obcheck(snum);
	}
	public int leavemember(int mnum) {
		return dao.leavemember(mnum);
	}
}
