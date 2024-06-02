package com.pennant.propertystudio.repositories.CRM;

import java.util.List;

import com.pennant.propertystudio.models.CRM.SiteVisit;

public interface ISiteVisitRepository {
	public String addSiteVisit(SiteVisit sitevisit);
	public List<SiteVisit> allSiteVisits();
}
