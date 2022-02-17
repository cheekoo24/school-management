package school.management.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import school.management.entity.Address;

@Repository
public class AddressDAOImpl implements AddressDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Address> getAddresses() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Address> query = currentSession.createQuery("from Address", Address.class);
		
		List<Address> address = query.getResultList();
		
		return address;
	}

	@Override
	public void saveAddress(Address address) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(address);
	}

	@Override
	public Address getAddress(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Address address = currentSession.get(Address.class, id);
		
		return address;
	}

	@Override
	public void deleteAddress(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Address> query = currentSession.createQuery("delete from Address where id=:addressId");
		
		query.setParameter("addressId", id);
		
		query.executeUpdate();
	}

}












