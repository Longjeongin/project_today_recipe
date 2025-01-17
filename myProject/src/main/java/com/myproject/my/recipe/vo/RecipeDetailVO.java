package com.myproject.my.recipe.vo;

public class RecipeDetailVO {
	
	private int recipeId;
	private String ingrType;
	private String ingrName;
	private String ingrEa;
	
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	public String getIngrType() {
		return ingrType;
	}
	public void setIngrType(String ingrType) {
		this.ingrType = ingrType;
	}
	public String getIngrName() {
		return ingrName;
	}
	public void setIngrName(String ingrName) {
		this.ingrName = ingrName;
	}
	public String getIngrEa() {
		return ingrEa;
	}
	public void setIngrEa(String ingrEa) {
		this.ingrEa = ingrEa;
	}
	@Override
	public String toString() {
		return "RecipeDetailVO [recipeId=" + recipeId + ", ingrType=" + ingrType + ", ingrName=" + ingrName
				+ ", ingrEa=" + ingrEa + "]";
	}
	
}
