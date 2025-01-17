package com.myproject.my.recipe.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.myproject.my.recipe.vo.RecipeDetailVO;
import com.myproject.my.recipe.vo.RecipeStepVO;
import com.myproject.my.recipe.vo.RecipeVO;
import com.myproject.my.search.vo.SearchVO;

@Mapper
public interface IRecipeDAO {
	// 카테고리 리스트 조회
	public ArrayList<RecipeVO> getCatList();
	// 레시피 리스트 조회
//	public ArrayList<RecipeVO> getRecipeList();
	public ArrayList<RecipeVO> getRecipeList(SearchVO searchVO);
	// 전체 건수
	public int getTotalRowCount(SearchVO searchVO);
	// 토큰으로 레시피 가져오기
	public RecipeVO getRecipeByToken(String token);
	// id로 재료 가져오기
	public ArrayList<RecipeDetailVO> getIngrType(int id);
	public ArrayList<RecipeDetailVO> getRecipeDetail(int id);
	// id로 조리과정 가져오기
	public ArrayList<RecipeStepVO> getRecipeStep(int id);
}
