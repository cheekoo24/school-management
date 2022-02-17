package school.management.service;

import java.util.List;

import school.management.entity.Address;

public interface AddressService {
	
	public List<Address> getAddresses();

	public void saveAddress(Address address);

	public Address getAddress(int id);

	public void deleteAddress(int id);

}
