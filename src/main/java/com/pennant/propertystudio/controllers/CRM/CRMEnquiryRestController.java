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
import com.pennant.propertystudio.repositories.CRM.IEnquiryRepository;


@RestController
public class CRMEnquiryRestController {
	
	@Autowired
	private IEnquiryRepository enquiryRepo;
	
	@RequestMapping(value = "/addEnquiry", method = RequestMethod.POST)
	public Map<String, String> addEnquiry(@RequestBody Enquiry enquiry) {
		System.out.println(enquiry.toString());
		String dataBaseResponse = enquiryRepo.addEnquiry(enquiry);
		Map<String, String> userResponse = new HashMap<>();
		userResponse.put("usermessage", dataBaseResponse);
		return userResponse;
	}
	
	@RequestMapping(value = "/allEnquiries", method = RequestMethod.GET)
	public List<Enquiry> getAllEnquiries() {
		List<Enquiry> availableEnquiries = enquiryRepo.allEnquiries();
		return availableEnquiries;
	}
}
