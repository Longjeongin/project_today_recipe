package com.myproject.my.recipe.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.my.recipe.dao.IRecipeDAO;
import com.myproject.my.recipe.vo.RecipeDetailVO;
import com.myproject.my.recipe.vo.RecipeStepVO;
import com.myproject.my.recipe.vo.RecipeVO;
import com.myproject.my.search.vo.SearchVO;

@Service
public class RecipeService {
	@Autowired
	IRecipeDAO dao;
	
	public ArrayList<RecipeVO> getCatList(){
		return dao.getCatList();
	}
	
//	public ArrayList<RecipeVO> getRecipeList() {
//		return dao.getRecipeList();
//	}
	public ArrayList<RecipeVO> getRecipeList(SearchVO searchVO) {
		int totalRowCount = dao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return dao.getRecipeList(searchVO);
	}
	public RecipeVO getRecipeByToken(String token){
		return dao.getRecipeByToken(token);
	}
	public ArrayList<RecipeDetailVO> getIngrType(int id){
		return dao.getIngrType(id);
	}
	public ArrayList<RecipeDetailVO> getRecipeDetail(int id){
		return dao.getRecipeDetail(id);
	}
	public ArrayList<RecipeStepVO> getRecipeStep(int id){
		return dao.getRecipeStep(id);
	}

	
}
