package com.greatlearning.crm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.greatlearning.crm.dao.CustomerDao;
import com.greatlearning.crm.entity.Customer;

@Controller
public class CustomerController {

	@Autowired
	private CustomerDao customerDao;

	@RequestMapping(path = "/home")
	public String home(Model m) {

		List<Customer> list = customerDao.getAllCustomer();
		m.addAttribute("cusList", list);
		return "home";
	}

	@RequestMapping(path = "/addCus")
	public String addCustomer() {
		return "add_cus";

	}

	@RequestMapping(path = "/createCus", method = RequestMethod.POST)
	public String createCus(@ModelAttribute Customer customer, HttpSession session) {
		System.out.println(customer);

		int i = customerDao.saveCustomer(customer);
		session.setAttribute("msg", "Registered Sucessfully");
		return "redirect:/addCus";

	}

	@RequestMapping(path = "/editCus/{id}")
	public String editCustomer(@PathVariable int id, Model m) {

		Customer customer = customerDao.getCustomerById(id);
		m.addAttribute("cus", customer);
		return "edit_cus";

	}

	@RequestMapping(path = "/updateCus", method = RequestMethod.POST)
	public String updateCustomer(@ModelAttribute Customer customer, HttpSession session) {

		customerDao.update(customer);
		session.setAttribute("msg", "Successfully updated");
		return "redirect:/home";

	}
	
	@RequestMapping("/deleteCus/{id}")
	public String deleteCustomer(@PathVariable int id, HttpSession session) {

		customerDao.deleteCustomer(id);
		session.setAttribute("msg", "Customer deleted Successfully");
		return "redirect:/home";
	}

}
