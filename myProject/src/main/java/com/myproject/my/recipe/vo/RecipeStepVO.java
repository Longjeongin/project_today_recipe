package com.myproject.my.recipe.vo;

public class RecipeStepVO {
	
	private int recipeId;
	private int recipeStepNo;
	private String recipeStep;
	
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	public int getRecipeStepNo() {
		return recipeStepNo;
	}
	public void setRecipeStepNo(int recipeStepNo) {
		this.recipeStepNo = recipeStepNo;
	}
	public String getRecipeStep() {
		return recipeStep;
	}
	public void setRecipeStep(String recipeStep) {
		this.recipeStep = recipeStep;
	}
	@Override
	public String toString() {
		return "RecipeStepVO [recipeId=" + recipeId + ", recipeStepNo=" + recipeStepNo + ", recipeStep=" + recipeStep
				+ "]";
	}
	
	
	
	
}
