package com.pennant.propertystudio.models.CRM;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
public class SiteVisit {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String status;
	private String remarks;
	
	@Column(name = "site_visit_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
	
	@OneToOne
    @JoinColumn(name = "enquiry_id")
    private Enquiry enquiry;
	
	private Integer employeeId; // many to one mapping here

	public SiteVisit(Long id, String status, String remarks, Date date, Enquiry enquiry, Integer employeeId) {
		this.id = id;
		this.status = status;
		this.remarks = remarks;
		this.date = date;
		this.enquiry = enquiry;
		this.employeeId = employeeId;
	}
	public SiteVisit() {
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Enquiry getEnquiry() {
		return enquiry;
	}
	public void setEnquiry(Enquiry enquiry) {
		this.enquiry = enquiry;
	}
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	@Override
	public String toString() {
		return "SiteVisit [id=" + id + ", status=" + status + ", remarks=" + remarks + ", date=" + date + ", enquiry="
				+ enquiry + ", employeeId=" + employeeId + "]";
	}	
}