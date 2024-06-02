package com.pennant.propertystudio.controllers.CRM;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * @author SivaAdarshT : Controller that handles all the CRM Module Flow
 *
 */
@Controller
@RequestMapping("/dashboard")
public class CRMDashBoardController {
	private static final Logger logger = LoggerFactory.getLogger(CRMDashBoardController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getDashboardPage() {
		logger.info("CRM : Enquiry Page requested");
		return "CRM/Dashboard";
	}
}
