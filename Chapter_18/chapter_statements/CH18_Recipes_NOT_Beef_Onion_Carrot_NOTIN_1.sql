--find recipes that have neither beef nor onions nor carrots with not in using 3 seperate not in clauses
SELECT Recipes.RecipeTitle
FROM Recipes
WHERE Recipes.RecipeID  NOT IN
	(SELECT Recipe_Ingredients.RecipeID
	FROM Recipe_Ingredients
	INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
	WHERE Ingredients.IngredientName = 'Beef')
AND Recipes.RecipeID  NOT IN
	(SELECT Recipe_Ingredients.RecipeID
	FROM Recipe_Ingredients
	INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
	WHERE Ingredients.IngredientName = 'Onion')
AND Recipes.RecipeID  NOT IN
	(SELECT Recipe_Ingredients.RecipeID
	FROM Recipe_Ingredients
	INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
	WHERE Ingredients.IngredientName = 'Carrot')
	