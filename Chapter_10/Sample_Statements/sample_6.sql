USE RecipesExample

SELECT Recipe_Classes.RecipeClassDescription AS IndexName, 'Recipe Class' AS Type
FROM Recipe_Classes

UNION

SELECT Recipes.RecipeTitle, 'Recipe' AS TYPE
FROM Recipes

UNION

SELECT Ingredients.IngredientName, 'Ingredient' AS TYPE
FROM Ingredients