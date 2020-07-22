package com.jhta.finalproject.jh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jhta.finalproject.jh.service.SellerMainBoardService;

@Controller
public class SellerEmailController {
	@Autowired
	private SellerMainBoardService service;
}
