package com.myproject.my;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.my.recipe.service.RecipeService;
import com.myproject.my.recipe.vo.RecipeVO;
import com.myproject.my.search.vo.SearchVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	RecipeService recipeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model, @ModelAttribute("searchVO") SearchVO searchVO) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate );
//		// 카테고리 이름 조회
//		ArrayList<RecipeVO> catList = recipeService.getCatList();
//		model.addAttribute("catList", catList);
//		// 레시피 리스트 조회
////		ArrayList<RecipeVO> recipeList = recipeService.getRecipeList();
//		ArrayList<RecipeVO> recipeList = recipeService.getRecipeList(searchVO);
//		model.addAttribute("recipeList", recipeList);
//		return "home";
//	}

	  @RequestMapping("/")
	  public String recipeList(Model model, 
	                           @RequestParam(value = "page", defaultValue = "1") int pageNum, 
	                           @RequestParam(value = "cat", required = false) String cat,
	                           @RequestParam(value = "words", required = false) List<String> words,
	                           @RequestParam(value = "type", defaultValue = "1") String type,
	                           @ModelAttribute("searchVO") SearchVO searchVO) {
		  
		  searchVO.setCurPage(pageNum);
		  searchVO.setSearchCategory(cat);
		  searchVO.setSearchType(type);
		  searchVO.setSearchWord(words);
		  if (words != null) {
			  String wordstr = String.join(",", words);
			  searchVO.setSearchWordString(wordstr);
		  }
		  model.addAttribute("searchVO", searchVO);
          
		  ArrayList<RecipeVO> catList = recipeService.getCatList();
	      model.addAttribute("catList", catList);
	      
	      ArrayList<RecipeVO> recipeList = recipeService.getRecipeList(searchVO);
	      model.addAttribute("recipeList", recipeList);
	      System.out.println(searchVO.getTotalRowCount());
	      System.out.println(searchVO);
	      
	      return "home";
	  }
	  
	
	
}
