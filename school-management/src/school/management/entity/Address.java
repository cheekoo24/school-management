package school.management.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="address")
public class Address {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="address")
	@Size(min=1, message="This field is required")
	@NotNull
	private String address;
	
	@Column(name="city")
	@Size(min=1, message="This field is required")
	@NotNull
	private String city;
	
	@Column(name="province")
	@Size(min=1, message="This field is required")
	@NotNull
	private String province;
	
	@Column(name="postal_code")
	@Size(max=6, message="Please input 7 characters only included space")
	@NotNull(message="This field is required")
	private String postalCode;
	
	@OneToOne(mappedBy="address", cascade={CascadeType.DETACH, 
			CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	private Student student;
	
	public Address() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	
}
