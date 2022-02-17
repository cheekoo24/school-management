package school.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import school.management.entity.Address;
import school.management.service.AddressService;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	@GetMapping("/list")
	public String addressList(Model model) {
		
		List<Address> address = addressService.getAddresses();
		
		model.addAttribute("address", address);
		
		return "address-list";
	}
	
	@GetMapping("/addAddressForm")
	public String addAddressForm(Model model) {
		
		Address address = new Address();
		
		model.addAttribute("address", address);
		
		return "address-form";
	}
	
	@PostMapping("/saveAddress")
	public String saveAddress(@ModelAttribute("address") Address address) {
		
		addressService.saveAddress(address);
		
		return "redirect:/address/list";
	}
	
	@GetMapping("/updateAddressForm")
	public String updateAddress(@RequestParam("addressId") int id, Model model) {
		
		Address address = addressService.getAddress(id);
		
		model.addAttribute("address", address);
		
		return "address-form";
	}
	
	@GetMapping("/deleteAddress")
	public String deleteAddress(@RequestParam("addressId") int id) {
		
		addressService.deleteAddress(id);
		
		return "redirect:/address/list";
	}
	

}












