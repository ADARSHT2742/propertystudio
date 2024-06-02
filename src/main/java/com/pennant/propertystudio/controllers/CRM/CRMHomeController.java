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
@RequestMapping("/CRM")
public class CRMHomeController {
	private static final Logger logger = LoggerFactory.getLogger(CRMHomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getHomePage() {
		logger.info("CRM : Home page requested");
		return "CRM/Home";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String getDashboardPage() {
		logger.info("CRM : Enquiry Page requested");
		return "CRM/Dashboard";
	}

	@RequestMapping(value = "/salesfunnel", method = RequestMethod.GET)
	public String getSalesFunnelPage() {
		logger.info("CRM : Sales Funnel Page requested");
		return "CRM/SalesFunnel";
	}

	@RequestMapping(value = "/enquires", method = RequestMethod.GET)
	public String getEnquiryPage() {
		logger.info("CRM : Enquiry Page requested");
		return "CRM/Enquiry";
	}

	@RequestMapping(value = "/sitevisits", method = RequestMethod.GET)
	public String getSiteVisitsPage() {
		logger.info("CRM : Site Visits Page requested");
		return "CRM/SiteVisit";
	}

	@RequestMapping(value = "/customers", method = RequestMethod.GET)
	public String getCustomersPage() {
		logger.info("CRM : Customer Page requested");
		return "CRM/Customers";
	}

	@RequestMapping(value = "/team", method = RequestMethod.GET)
	public String getTeamPage() {
		logger.info("CRM : Team Page requested");
		return "CRM/Team";
	}

}
