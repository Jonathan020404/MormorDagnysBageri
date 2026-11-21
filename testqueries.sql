SELECT * FROM suppliers;

SELECT * FROM ingredients;

SELECT products.productname,
       ingredients.ingredientname,
       suppliers.suppliername
FROM products INNER JOIN recipes 
    ON products.id = recipes.product_id INNER JOIN recipeingredients 
    ON recipes.id = recipeingredients.recipe_id INNER JOIN ingredients 
    ON recipeingredients.ingredient_id = ingredients.id INNER JOIN supplieringredients 
    ON ingredients.id = supplieringredients.ingredient_id INNER JOIN suppliers 
    ON supplieringredients.supplier_id = suppliers.id;