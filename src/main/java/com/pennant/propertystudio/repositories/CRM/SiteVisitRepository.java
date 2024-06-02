package com.pennant.propertystudio.repositories.CRM;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pennant.propertystudio.models.CRM.Enquiry;
import com.pennant.propertystudio.models.CRM.SiteVisit;

import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;

@Repository
public class SiteVisitRepository implements ISiteVisitRepository {
	@Autowired
	private EntityManager entitymanager;
	
	@Transactional
	public String addSiteVisit(SiteVisit sitevisit) {
		String response = "";
		try {
			entitymanager.persist(sitevisit);
			response = "Site Visit Creation Success !";
			System.out.println("Site Visit creation sucess");
			System.out.println(sitevisit.toString());
		}catch(Exception e) {
			System.out.println("Site Visit creation failed");
			e.printStackTrace();
			response = "Internal Server Error, Try again later";
		}
		return response;
	}
	
	@Transactional
	public List<SiteVisit> allSiteVisits(){
		// here the employee id should be present
		List<SiteVisit> sitevisits = new ArrayList<>();
		try {
			sitevisits = entitymanager.createQuery("select s from SiteVisit s", SiteVisit.class).getResultList();
			System.out.println("Success");
			return sitevisits;
		}catch(Exception e) {
			System.out.println("Failure");
			e.printStackTrace();
		}
		return null;
	}
}
