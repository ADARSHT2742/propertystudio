package com.pennant.propertystudio.models.CRM;


import java.util.Date;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
public class Enquiry {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	// Client Personal Information
	private String clientName;
	private String clientEmail;
	private Long clientMobile;
	private String clientAddress;
	private String clientLocation;
	private Integer clientPincode;
	private String clientCity;
	private String clientProfession;
	private String clientLocality;
	private String clientSource;

	private String projectName; // change this to mapping many to one
	private String projectComponent; // this should be integer
	private String remarks;
	
	private Integer employeeId; // many to one mapping
	
	@Column(name = "enqr_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;

	public Enquiry(Long id, String clientName, String clientEmail, Long clientMobile, String clientAddress,
			String clientLocation, Integer clientPincode, String clientCity, String clientProfession,
			String clientLocality, String clientSource, String projectName, String projectComponent, String remarks,
			Integer employeeId, Date date) {
		this.id = id;
		this.clientName = clientName;
		this.clientEmail = clientEmail;
		this.clientMobile = clientMobile;
		this.clientAddress = clientAddress;
		this.clientLocation = clientLocation;
		this.clientPincode = clientPincode;
		this.clientCity = clientCity;
		this.clientProfession = clientProfession;
		this.clientLocality = clientLocality;
		this.clientSource = clientSource;
		this.projectName = projectName;
		this.projectComponent = projectComponent;
		this.remarks = remarks;
		this.employeeId = employeeId;
		this.date = date;
	}

	public Enquiry() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientEmail() {
		return clientEmail;
	}

	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}

	public Long getClientMobile() {
		return clientMobile;
	}

	public void setClientMobile(Long clientMobile) {
		this.clientMobile = clientMobile;
	}

	public String getClientAddress() {
		return clientAddress;
	}

	public void setClientAddress(String clientAddress) {
		this.clientAddress = clientAddress;
	}

	public String getClientLocation() {
		return clientLocation;
	}

	public void setClientLocation(String clientLocation) {
		this.clientLocation = clientLocation;
	}

	public Integer getClientPincode() {
		return clientPincode;
	}

	public void setClientPincode(Integer clientPincode) {
		this.clientPincode = clientPincode;
	}

	public String getClientCity() {
		return clientCity;
	}

	public void setClientCity(String clientCity) {
		this.clientCity = clientCity;
	}

	public String getClientProfession() {
		return clientProfession;
	}

	public void setClientProfession(String clientProfession) {
		this.clientProfession = clientProfession;
	}

	public String getClientLocality() {
		return clientLocality;
	}

	public void setClientLocality(String clientLocality) {
		this.clientLocality = clientLocality;
	}

	public String getClientSource() {
		return clientSource;
	}

	public void setClientSource(String clientSource) {
		this.clientSource = clientSource;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectComponent() {
		return projectComponent;
	}

	public void setProjectComponent(String projectComponent) {
		this.projectComponent = projectComponent;
	}

	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Enquiry [id=" + id + ", clientName=" + clientName + ", clientEmail=" + clientEmail + ", clientMobile="
				+ clientMobile + ", clientAddress=" + clientAddress + ", clientLocation=" + clientLocation
				+ ", clientPincode=" + clientPincode + ", clientCity=" + clientCity + ", clientProfession="
				+ clientProfession + ", clientLocality=" + clientLocality + ", clientSource=" + clientSource
				+ ", projectName=" + projectName + ", projectComponent=" + projectComponent + ", remarks=" + remarks
				+ ", employeeId=" + employeeId + ", date=" + date + "]";
	}
	
	
}
