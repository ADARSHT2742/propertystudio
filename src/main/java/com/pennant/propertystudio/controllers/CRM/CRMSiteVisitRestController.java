package com.pennant.propertystudio.controllers.CRM;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.pennant.propertystudio.models.CRM.Enquiry;
import com.pennant.propertystudio.models.CRM.SiteVisit;
import com.pennant.propertystudio.repositories.CRM.ISiteVisitRepository;


@RestController
public class CRMSiteVisitRestController {
	
	@Autowired
	private ISiteVisitRepository siteVisitRepo;
	
	@RequestMapping(value = "/addSiteVisit", method = RequestMethod.POST)
	public Map<String, String> addSiteVisit(@RequestBody SiteVisit sitevisit) {
		System.out.println("Remarks are : "+sitevisit.getRemarks());
		System.out.println(sitevisit.toString());
		String dataBaseResponse = siteVisitRepo.addSiteVisit(sitevisit);
		Map<String, String> userResponse = new HashMap<>();
		userResponse.put("usermessage", dataBaseResponse);
		return userResponse;
	}
	
	@RequestMapping(value = "/allSiteVisits", method = RequestMethod.GET)
	public List<SiteVisit> getAllSiteVisits() {
		List<SiteVisit> availableSiteVisits = siteVisitRepo.allSiteVisits();
		return availableSiteVisits;
	}
}
