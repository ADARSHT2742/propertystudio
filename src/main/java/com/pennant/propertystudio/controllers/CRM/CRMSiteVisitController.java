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
@RequestMapping("/sitevisits")
public class CRMSiteVisitController {
	private static final Logger logger = LoggerFactory.getLogger(CRMSiteVisitController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getSiteVisitsPage() {
		logger.info("CRM : Site Visits Page requested");
		return "CRM/SiteVisit";
	}

}
