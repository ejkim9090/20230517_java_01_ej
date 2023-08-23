package kh.lclass.spring1;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.trace("trace");
		logger.debug("debug");
		logger.info("Welcome home! The client locale is {}sdfsdfsd{}.", locale,2312);
		// 앞으로 sysout은 정말정말 급하고 임의의 로그 볼때.. 곧바로 지워질 메시지 찍을때
		logger.warn("warn");
		logger.error("error");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "aaa/a1";
	}
	
	@GetMapping("/aaa/a2")
	//@RequestMapping(value = "/aaa/a2", method = RequestMethod.GET)
	public void a2() {
	}
	
	@RequestMapping(value = "/aaa/a1", method = RequestMethod.GET)
	public String a1() {
		return "aaa/a1";
	}
	
}
