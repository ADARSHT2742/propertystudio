package com.pennant.propertystudio.models;

import java.util.Date;



import jakarta.persistence.*;

@Entity
@Table(name = "prs_customers")
public class Customer {
	@Id 
	private int custid;
	
}