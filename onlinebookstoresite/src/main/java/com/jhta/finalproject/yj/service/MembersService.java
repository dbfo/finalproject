package com.jhta.finalproject.yj.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.finalproject.yj.dao.MembersDao;
import com.jhta.finalproject.yj.vo.MembersListVO;

@Service
public class MembersService {
	@Autowired
	private MembersDao dao;

	public List<MembersListVO> memList(HashMap<String, Object> map) {
		return dao.memList(map);
	}

	public List<MembersListVO> ghostList() {
		return dao.ghostList();
	}
}
