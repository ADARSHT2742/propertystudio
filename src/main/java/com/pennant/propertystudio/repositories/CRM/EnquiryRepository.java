package com.pennant.propertystudio.repositories.CRM;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pennant.propertystudio.models.CRM.Enquiry;

import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;

@Repository
public class EnquiryRepository implements IEnquiryRepository{
	
	@Autowired
	private EntityManager entitymanager;
	
	@Transactional
	public String addEnquiry(Enquiry enquiry) {
		String response = "";
		try {
			entitymanager.persist(enquiry);
			response = "Enquiry Creation Success !";
			System.out.println("Enquiry creation sucess");
			System.out.println(enquiry.toString());
		}catch(Exception e) {
			System.out.println("Enquiry creation failed");
			e.printStackTrace();
			response = "Internal Server Error, Try again later";
		}
		return response;
	}
	
	@Transactional
	public List<Enquiry> allEnquiries(){
		// here the employee id should be present
		List<Enquiry> enquiries = new ArrayList<>();
		try {
			enquiries = entitymanager.createQuery("select e from Enquiry e", Enquiry.class).getResultList();
			System.out.println("Success");
			return enquiries;
		}catch(Exception e) {
			System.out.println("Failure");
			e.printStackTrace();
		}
		return null;
	}
}
