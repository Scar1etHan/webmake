package mvc.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "Main/index";
	}
	
	@RequestMapping(value = "/Main/Map", method = RequestMethod.GET)
	public String map() {
		
		return "Main/Map";
	}
	
	@RequestMapping(value = "/Test/Vote", method = RequestMethod.GET)
	public String test() {
		
		return "Test/Vote";
	}
	
}
