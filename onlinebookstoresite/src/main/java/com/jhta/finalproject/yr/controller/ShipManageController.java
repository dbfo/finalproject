package com.jhta.finalproject.yr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShipManageController {
	
	@Autowired
	@RequestMapping("/ship")
	public String goShip() {
		
		
		return ".ship";
	}
}
