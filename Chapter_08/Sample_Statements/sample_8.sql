USE RecipesExample

SELECT Recipes.RecipeTitle, Ingredients.IngredientName, MeasurementConvert.MeasurementDescription, Recipe_Ingredients.Amount, Recipe_Classes.RecipeClassDescription

FROM Recipes

INNER JOIN Recipe_Ingredients
ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
INNER JOIN Ingredients
ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
INNER JOIN Measurements AS MeasurementConvert
ON Recipe_Ingredients.MeasureAmountID = MeasurementConvert.MeasureAmountID
INNER JOIN Recipe_Classes
ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID

WHERE RecipeClassDescription = 'Main Course'