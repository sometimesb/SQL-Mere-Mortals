--List ingredients not used in any recipe yet
SELECT Ingredients.IngredientName
--	   ,Recipe_Ingredients.RecipeID
FROM Ingredients
LEFT JOIN Recipe_Ingredients ON Recipe_Ingredients.IngredientID = Ingredients.IngredientID
WHERE Recipe_Ingredients.RecipeID is Null
