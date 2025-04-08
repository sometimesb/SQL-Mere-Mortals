USE RecipesExample

SELECT Recipes.RecipeTitle
FROM Recipes
INNER JOIN Recipe_Ingredients
ON Recipe_Ingredients.RecipeID = Recipes.RecipeID
INNER JOIN Ingredients
ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
WHERE Ingredients.IngredientName = 'Beef'

INTERSECT

SELECT Recipes.RecipeTitle
FROM Recipes
INNER JOIN Recipe_Ingredients
ON Recipe_Ingredients.RecipeID = Recipes.RecipeID
INNER JOIN Ingredients
ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
WHERE Ingredients.IngredientName = 'Garlic'