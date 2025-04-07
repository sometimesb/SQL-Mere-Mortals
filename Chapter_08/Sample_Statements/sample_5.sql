USE RecipesExample

SELECT DISTINCT Recipes.RecipeTitle, Recipe_Ingredients.RecipeID
FROM Recipes
INNER JOIN Recipe_Ingredients
ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
WHERE Recipe_Ingredients.IngredientID IN (1, 9);
