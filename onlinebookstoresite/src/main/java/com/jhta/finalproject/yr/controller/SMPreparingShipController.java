package com.jhta.finalproject.yr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.finalproject.yr.service.PaymentService;
import com.jhta.finalproject.yr.service.ShipManageService;

public class SMPreparingShipController {
	@Autowired
	private ShipManageService service;
	@Autowired
	private PaymentService payService;
	
//	@RequestMapping("/ship/preparing")
	
}
