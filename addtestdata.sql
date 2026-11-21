INSERT INTO suppliers(
    id, 
    suppliername, 
    address, 
    contactperson, 
    phone, 
    email)
VALUES
    (1,
    'Mjölbolaget', 
    'Mjölvägen 1', 
    'Anna Annasson', 
    '0701111111', 
    'anna@mail.se'),
    (2, 
    'Sockerbolaget', 
    'Sockervägen 2', 
    'Erik Eriksson', 
    '0702222222', 
    'erik@mail.se');

INSERT INTO ingredients(
    id, 
    itemnumber, 
    ingredientname, 
    minstock)
VALUES
    (1, 
    'i001', 
    'Mjöl', 
    10),
    (2, 
    'i002', 
    'Socker', 
    5);

INSERT INTO supplieringredients(
    supplier_id, 
    ingredient_id, 
    price)
VALUES
    (1, 1, 12),
    (2, 2, 15);

INSERT INTO products(
    id, 
    productname)
VALUES
    (1, 'Bröd'),
    (2, 'Kakor');

INSERT INTO recipes(
    id, 
    product_id, 
    quantity)
VALUES
    (1, 1, 10),
    (2, 2, 20);

INSERT INTO recipeingredients(
    recipe_id, 
    ingredient_id, 
    quantity)
VALUES
    (1, 1, 2),
    (2, 2, 1);

INSERT INTO purchases(
    id, 
    supplier_id, 
    ingredient_id, 
    quantity, 
    price)
VALUES
    (1, 1, 1, 50, 12),
    (2, 2, 2, 20, 15);

INSERT INTO stockwithdrawals(
    id, 
    ingredient_id, 
    quantity)
VALUES
    (1, 1, 15),
    (2, 2, 16);