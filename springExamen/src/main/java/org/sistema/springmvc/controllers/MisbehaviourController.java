package org.sistema.springmvc.controllers;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.sistema.springmvc.dao.MisbehaviourDAO;
import org.sistema.springmvc.dao.UserDAO;
import org.sistema.springmvc.models.Misbehaviour;
import org.sistema.springmvc.models.Turn;
import org.sistema.springmvc.models.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MisbehaviourController {

	private static final Logger logger = LoggerFactory
			.getLogger(TurnController.class);

	@Autowired
	private MisbehaviourDAO misbehaviourDAO;
	@Autowired
	private UserDAO userDAO;
	
	
	@RequestMapping(method = RequestMethod.GET, value = {"/misbehaviours" })
	public String showMisbehaviours(Map<String, Object> model) {
		logger.info("Product showMisbehaviours. ");

		List<Misbehaviour> misbehaviours = misbehaviourDAO.selectAll();
		model.put("misbehaviours", misbehaviours);
		// For the form
		model.put("misbehaviour", new Misbehaviour());

		return "misbehaviour/misbehaviours";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = { "/misbehaviours/{id}" })
	public String misbehaviourDetail(@PathVariable(value = "id") Long id,
			Map<String, Object> model) {
		logger.info("Misbehaviour detail");

		Misbehaviour misbehaviour = misbehaviourDAO.selectById(id);
		model.put("misbehaviour", misbehaviour);

		return "misbehaviour/misbehaviourDetail";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = { "/misbehaviours/new" })
	public String newMisbehaviour(Map<String, Object> model) {
		logger.info("Showing custom view GET ");

		List<User> users = userDAO.selectAll();
		model.put("user", users);
		model.put("misbehaviour", new Misbehaviour());

		return "misbehaviour/newMisbehaviour";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = { "/misbehaviours/new" })
	public ModelAndView createMisbehaviour(@Valid Misbehaviour misbehaviour, BindingResult bindingResult) {

		ModelAndView modelAndView = new ModelAndView();

		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("misbehaviour/newMisbehaviour");
			List<User> users = userDAO.selectAll();
			modelAndView.addObject("user", users);
			modelAndView.addObject("misbehaviour", misbehaviour);
			return modelAndView;
		}

		if (misbehaviourDAO.insert(misbehaviour) > 0) {
			logger.info("Saveview POST " + misbehaviour.getId());
			// We return view name
			modelAndView.setViewName("misbehaviour/created");
			modelAndView.addObject("misbehaviour", misbehaviour);
		} else {
			modelAndView.setViewName("error");
			modelAndView
					.addObject("error",
							"An error ocurred while trying to create a new misbehaviour. Please, try again");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/misbehaviours/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable(value = "id") Long misbehaviourId, Model model) {
		logger.info("Showing update view GET ");

		// We find the product through DAO and load into model
		List<User> users = userDAO.selectAll();
		model.addAttribute("user", users);
		model.addAttribute("misbehaviour", misbehaviourDAO.selectById(misbehaviourId));

		return "misbehaviour/update";
	}
	
	@RequestMapping(value = "/misbehaviours/saveupdate", method = RequestMethod.POST)
	public ModelAndView saveUpdate(@Valid Misbehaviour misbehaviour, BindingResult bindingResult) {
		logger.info("Save update " + misbehaviour.getId());

		ModelAndView modelAndView = new ModelAndView();
		
		if (bindingResult.hasErrors()){
			modelAndView.setViewName("misbehaviour/update");
			List<User> users = userDAO.selectAll();
			modelAndView.addObject("user", users);
			modelAndView.addObject("misbehaviour", misbehaviour);
			return modelAndView;
		}

		misbehaviourDAO.update(misbehaviour);

		// We pass the turn received through this object
		modelAndView.addObject("misbehaviour", misbehaviour);

		// The same as return "turn/saveUpdate"
		modelAndView.setViewName("misbehaviour/saveUpdated");
		return modelAndView;
	}
	
	@RequestMapping(value = "/misbehaviours/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "id") Long misbehaviourId, Model model) {
		logger.info("Product detail /delete");

		misbehaviourDAO.delete(misbehaviourId);
		model.addAttribute("misbehaviourId", misbehaviourId);

		return "misbehaviour/deleted";
	}
	
}
