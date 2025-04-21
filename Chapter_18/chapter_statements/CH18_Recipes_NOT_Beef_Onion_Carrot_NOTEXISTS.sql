--find recipes that have neither beef nor onions nor carrots with not in using NOT EXISTS
SELECT Recipes.RecipeID, Recipes.RecipeTitle
FROM Recipes
WHERE NOT EXISTS
(SELECT Recipe_Ingredients.RecipeID, Ingredients.IngredientName
FROM Recipe_Ingredients
INNER JOIN Ingredients ON Recipe_Ingredients.IngredientID = Ingredients.IngredientID
WHERE Ingredients.IngredientName IN ('Beef','Onion','Carrot')
AND Recipe_Ingredients.RecipeID = Recipes.RecipeID)