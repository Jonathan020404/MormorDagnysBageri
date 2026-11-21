CREATE TABLE suppliers(
    id INTEGER PRIMARY KEY,
    suppliername VARCHAR(50) NOT NULL,
    address VARCHAR(80) NOT NULL,
    contactperson VARCHAR(80) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(128) NOT NULL
);

CREATE TABLE ingredients(
    id INTEGER PRIMARY KEY,
    itemnumber VARCHAR(15) NOT NULL UNIQUE,
    ingredientname VARCHAR(50) NOT NULL,
    minstock FLOAT NOT NULL DEFAULT 0,
    CONSTRAINT ck_minstock CHECK(minstock >= 0)
);

CREATE TABLE supplieringredients(
    supplier_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    price FLOAT NOT NULL,
    CONSTRAINT pk_supplieringredients PRIMARY KEY(supplier_id,ingredient_id),
    CONSTRAINT fk_supplier FOREIGN KEY(supplier_id) REFERENCES suppliers(id),
    CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES ingredients(id),
    CONSTRAINT ck_price CHECK(price >= 0)
);

CREATE TABLE products(
    id INTEGER PRIMARY KEY,
    productname VARCHAR(80) NOT NULL
);

CREATE TABLE recipes(
    id INTEGER PRIMARY KEY,
    product_id INTEGER NOT NULL UNIQUE,
    quantity INTEGER NOT NULL,
    CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES products(id),
    CONSTRAINT ck_quantity CHECK(quantity > 0)
);

CREATE TABLE recipeingredients(
    recipe_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    quantity FLOAT NOT NULL,
    CONSTRAINT pk_recipeingredients PRIMARY KEY(recipe_id,ingredient_id),
    CONSTRAINT fk_recipe FOREIGN KEY(recipe_id) REFERENCES recipes(id),
    CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES ingredients(id),
    CONSTRAINT ck_quantity CHECK(quantity > 0)
);

CREATE TABLE purchases(
    id INTEGER PRIMARY KEY,
    supplier_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    quantity FLOAT NOT NULL,
    price FLOAT NOT NULL,
    purchasedate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_supplieringredient FOREIGN KEY(supplier_id,ingredient_id) REFERENCES supplieringredients(supplier_id,ingredient_id),
    CONSTRAINT ck_quantity CHECK(quantity > 0),
    CONSTRAINT ck_price CHECK(price >= 0)
);

CREATE TABLE stockwithdrawals(
    id INTEGER PRIMARY KEY,
    ingredient_id INTEGER NOT NULL,
    quantity FLOAT NOT NULL,
    withdrawaldate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES ingredients(id),
    CONSTRAINT ck_quantity CHECK(quantity > 0)
);
