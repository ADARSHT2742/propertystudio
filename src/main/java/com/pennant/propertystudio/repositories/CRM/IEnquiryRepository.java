package com.pennant.propertystudio.repositories.CRM;

import java.util.List;

import com.pennant.propertystudio.models.CRM.Enquiry;

public interface IEnquiryRepository {
	public String addEnquiry(Enquiry enquiry);
	public List<Enquiry> allEnquiries();
}
