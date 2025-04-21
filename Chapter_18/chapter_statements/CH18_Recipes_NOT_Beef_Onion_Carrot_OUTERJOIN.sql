--find recipes that have neigher beef, nor onions, nor carrots with an outer join and a sq
SELECT Recipes.RecipeID, Recipes.RecipeTitle, sq.RecipeID
FROM Recipes
LEFT JOIN 
--find these ingredients
(SELECT Recipe_Ingredients.RecipeID
FROM Recipe_Ingredients
INNER JOIN Ingredients ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
WHERE Ingredients.IngredientName IN ('Beef','Onion','Carrot')) as sq
ON Recipes.RecipeID =sq.RecipeID
WHERE sq.RecipeID is null