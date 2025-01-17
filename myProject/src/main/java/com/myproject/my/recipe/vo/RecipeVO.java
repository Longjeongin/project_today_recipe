package com.myproject.my.recipe.vo;

public class RecipeVO {
	private int recipeId;
	private String recipeName;      /* 레시피 이름 */
	private String recipeImg;       /* 레시피 사진 */
	private String recipeLevel;       /* 레시피 난이도 */
	private String recipeCat;
	private String recipeToken;
	private String catName;         /* 카테고리 이름 */
	private String recipeDes;       /* 인원수 */
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	public String getRecipeName() {
		return recipeName;
	}
	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}
	public String getRecipeImg() {
		return recipeImg;
	}
	public void setRecipeImg(String recipeImg) {
		this.recipeImg = recipeImg;
	}
	public String getRecipeLevel() {
		return recipeLevel;
	}
	public void setRecipeLevel(String recipeLevel) {
		this.recipeLevel = recipeLevel;
	}
	public String getRecipeCat() {
		return recipeCat;
	}
	public void setRecipeCat(String recipeCat) {
		this.recipeCat = recipeCat;
	}
	public String getRecipeToken() {
		return recipeToken;
	}
	public void setRecipeToken(String recipeToken) {
		this.recipeToken = recipeToken;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getRecipeDes() {
		return recipeDes;
	}
	public void setRecipeDes(String recipeDes) {
		this.recipeDes = recipeDes;
	}
	@Override
	public String toString() {
		return "RecipeVO [recipeId=" + recipeId + ", recipeName=" + recipeName + ", recipeImg=" + recipeImg
				+ ", recipeLevel=" + recipeLevel + ", recipeCat=" + recipeCat + ", recipeToken=" + recipeToken
				+ ", catName=" + catName + ", recipeDes=" + recipeDes + "]";
	}
	
	
	
	
	

}
