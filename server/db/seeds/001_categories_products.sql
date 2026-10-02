INSERT INTO categories (category_code, category_name)
VALUES ('CAT001', 'Shirt');

INSERT INTO categories (category_code, category_name)
VALUES ('CAT002', 'Pants');

INSERT INTO categories (category_code, category_name)
VALUES ('CAT003', 'Jacket');

INSERT INTO categories (category_code, category_name)
VALUES ('CAT004', 'Shoes');

INSERT INTO categories (category_code, category_name)
VALUES ('CAT005', 'Accessories');


-- CAT001 - Shirt
INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0001', 'Basic Shirt', 95000, (SELECT category_id FROM categories WHERE category_code = 'CAT001'));

INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0002', 'Oxford Long Sleeve Shirt', 185000, (SELECT category_id FROM categories WHERE category_code = 'CAT001'));

-- CAT002 - Pants
INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0003', 'Slim Fit Chino Pants', 225000, (SELECT category_id FROM categories WHERE category_code = 'CAT002'));

INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0004', 'Denim Jeans', 275000, (SELECT category_id FROM categories WHERE category_code = 'CAT002'));

-- CAT003 - Jacket
INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0005', 'Bomber Jacket', 350000, (SELECT category_id FROM categories WHERE category_code = 'CAT003'));

INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0006', 'Hoodie Zipper', 250000, (SELECT category_id FROM categories WHERE category_code = 'CAT003'));

-- CAT004 - Shoes
INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0007', 'Canvas Sneakers', 299000, (SELECT category_id FROM categories WHERE category_code = 'CAT004'));

INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0008', 'Leather Loafers', 450000, (SELECT category_id FROM categories WHERE category_code = 'CAT004'));

-- CAT005 - Accessories
INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0009', 'Leather Belt', 120000, (SELECT category_id FROM categories WHERE category_code = 'CAT005'));

INSERT INTO products (product_code, product_name, product_price, product_category_id)
VALUES ('PR0010', 'Baseball Cap', 85000, (SELECT category_id FROM categories WHERE category_code = 'CAT005'));
