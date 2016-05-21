package com.nago.controller;

import com.nago.model.User;
import com.nago.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
	private List<User> searchResult = new ArrayList<>();

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addUserPage(User user) {
		return "add-user";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ModelAndView addingUser(@ModelAttribute User user) {

		ModelAndView modelAndView = new ModelAndView("info");
		userService.addUser(user);
		
		String message = "User\"" + user.getName() + "\"  added successfully.";
		modelAndView.addObject("message", message);
		
		return modelAndView;
	}
	
	@RequestMapping(value={"/list","/","/index"})
	public ModelAndView listOfUsers(@RequestParam(required = false) Integer page) {
		ModelAndView modelAndView = new ModelAndView("users-list");
		
		List<User> users = userService.getUsers();
		PagedListHolder<User> pagedListHolder = new PagedListHolder<>(users);
		pagedListHolder.setPageSize(5);
		modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        paginationHelper(modelAndView, pagedListHolder, page);

		return modelAndView;
	}
	@RequestMapping(value="result")
	public ModelAndView resultOfSearch(@RequestParam(required = false) Integer page) {
		ModelAndView modelAndView;
		if(!searchResult.isEmpty()){
			modelAndView = new ModelAndView("search-result");
			PagedListHolder<User> pagedListHolder = new PagedListHolder<>(searchResult);
			pagedListHolder.setPageSize(5);
			modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
			modelAndView.addObject("sizeresult", pagedListHolder.getNrOfElements());

            paginationHelper(modelAndView, pagedListHolder, page);
		}
		else {
			modelAndView = new ModelAndView("search-users");
			modelAndView.addObject("searchUser", new User());
			modelAndView.addObject("isSearch", "No matching, please try again");
		}
        return modelAndView;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editUserPage(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView("edit-user");
		User user = userService.getUser(id);
		modelAndView.addObject("user", user);

        return modelAndView;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.POST)
	public ModelAndView editingUser(@ModelAttribute User user) {
        ModelAndView modelAndView = new ModelAndView("info");
        userService.updateUser(user);
        String message = "User \"" + user.getName() + "\"  edited successfully.";
		modelAndView.addObject("message", message);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable Integer id) {
		if(!searchResult.isEmpty()){
			for(User us : searchResult)
			{
				if(us.getId().equals(id)){
					searchResult.remove(us);
					break;
				}
			}
		}
		ModelAndView modelAndView = new ModelAndView("info");
		String deletedName = userService.getUser(id).getName();
		userService.deleteUser(id);
		String message = "User \"" + deletedName + "\" deleted successfully.";
		modelAndView.addObject("message", message);

        return modelAndView;
	}

	@RequestMapping(value="/search-init", method=RequestMethod.GET)
	public ModelAndView searchUser() {
		ModelAndView modelAndView = new ModelAndView("search-users");

		modelAndView.addObject("searchUser", new User());
		return modelAndView;
	}
	@RequestMapping(value="/search-init", method = RequestMethod.POST)
	public ModelAndView searchUser(@ModelAttribute User user, @RequestParam(required = false) Integer page) {
		ModelAndView modelAndView = new ModelAndView("search-result");
		searchResult = userService.searchUsers(user);

		PagedListHolder<User> pagedListHolder = new PagedListHolder<>(searchResult);
		pagedListHolder.setPageSize(5);
		modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
		modelAndView.addObject("sizeresult", pagedListHolder.getNrOfElements());

		paginationHelper(modelAndView, pagedListHolder, page);

		return modelAndView;
	}

	private void paginationHelper(ModelAndView modelAndView, PagedListHolder pagedListHolder, Integer page){
        if(page==null || page < 1 || page > pagedListHolder.getPageCount())page=1;

        modelAndView.addObject("page", page);
        if(page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }
    }


}
