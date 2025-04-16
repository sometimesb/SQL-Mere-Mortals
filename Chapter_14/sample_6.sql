USE RecipesExample

SELECT Recipes.RecipeTitle
FROM Recipes
INNER JOIN Recipe_Ingredients ON Recipe_Ingredients.RecipeID = Recipes.RecipeID
INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
WHERE Ingredients.IngredientName IN ('Beef', 'Garlic')
GROUP BY Recipes.RecipeTitle
HAVING COUNT(*) >= 2
ORDER BY 1