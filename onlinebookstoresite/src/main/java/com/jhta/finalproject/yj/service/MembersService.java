package com.jhta.finalproject.yj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yj.dao.MembersDao;
import com.jhta.finalproject.yj.vo.MembersListVO;

@Service
public class MembersService {
	@Autowired
	private MembersDao dao;
	
	public List<MembersListVO> memList() {
		return dao.memList();
	}

	public List<MembersListVO> ghostList() {
		return dao.ghostList();
	}
}
