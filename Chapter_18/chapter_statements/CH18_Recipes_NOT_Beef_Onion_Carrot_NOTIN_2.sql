--find recipes that have neither beef nor onions nor carrots with not in using 1 NOT IN Clause
SELECT Recipes.RecipeTitle
FROM Recipes
WHERE Recipes.RecipeID  NOT IN
	(SELECT Recipe_Ingredients.RecipeID
	FROM Recipe_Ingredients
	INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
	WHERE Ingredients.IngredientName IN ('Beef','Onion','Carrot'))
	