SELECT Recipe_Classes.RecipeClassDescription, Recipes.RecipeTitle,
		ROW_NUMBER() OVER(
		ORDER BY Recipe_Classes.RecipeClassDescription, Recipes.RecipeTitle) As OverAllNumber,
		ROW_NUMBER() OVER(
		PARTITION BY Recipe_Classes.RecipeClassDescription
		ORDER BY Recipes.RecipeTitle) As NumberInClass
FROM Recipe_Classes
LEFT JOIN Recipes ON Recipes.RecipeClassID = Recipe_Classes.RecipeClassID