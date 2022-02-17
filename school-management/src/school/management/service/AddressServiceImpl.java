package school.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import school.management.dao.AddressDAO;
import school.management.entity.Address;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressDAO addressDAO;

	@Override
	@Transactional
	public List<Address> getAddresses() {
		return addressDAO.getAddresses();
	}

	@Override
	@Transactional
	public void saveAddress(Address address) {
		addressDAO.saveAddress(address);
	}

	@Override
	@Transactional
	public Address getAddress(int id) {
		return addressDAO.getAddress(id);
	}

	@Override
	@Transactional
	public void deleteAddress(int id) {
		addressDAO.deleteAddress(id);
	}

}
