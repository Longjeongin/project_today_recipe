package com.myproject.my.recipe.web;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myproject.my.recipe.service.RecipeService;
import com.myproject.my.recipe.vo.RecipeDetailVO;
import com.myproject.my.recipe.vo.RecipeStepVO;
import com.myproject.my.recipe.vo.RecipeVO;

@Controller
public class RecipeController {
	
	@Autowired
	RecipeService recipeService;
	
	@RequestMapping("/recipeView/{token}")
	public String recipeView(Model model,
							 @PathVariable(value = "token") String recipeToken) {
		RecipeVO recipeVO = recipeService.getRecipeByToken(recipeToken);
		model.addAttribute("recipeVO", recipeVO);
		
		int recipeId = recipeVO.getRecipeId();
		ArrayList<RecipeDetailVO> ingrType = recipeService.getIngrType(recipeId);
		model.addAttribute("ingrType", ingrType);
		
		ArrayList<RecipeDetailVO> recipeDetailVO = recipeService.getRecipeDetail(recipeId);
		model.addAttribute("recipeDetailVO", recipeDetailVO);
		
		ArrayList<RecipeStepVO> recipeStepVO = recipeService.getRecipeStep(recipeId);
		model.addAttribute("recipeStepVO",recipeStepVO);
		
		return "recipe/recipeView";
	}
	
		
	
}
