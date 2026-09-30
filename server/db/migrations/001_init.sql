CREATE TABLE users(
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(100) NOT NULL,
	user_hash_password VARCHAR(100) NOT NULL,
	user_email VARCHAR(50) NOT NULL UNIQUE,
	user_role VARCHAR(20) NOT NULL DEFAULT 'customer',
	user_is_active BOOLEAN NOT NULL DEFAULT false,
	user_activated_date TIMESTAMP
);

CREATE TABLE categories(
	category_id SERIAL PRIMARY KEY,
	category_code VARCHAR(20) NOT NULL UNIQUE,
	category_name VARCHAR(100) NOT NULL,
	category_desc TEXT,
	category_is_active BOOLEAN NOT NULL DEFAULT true,
	category_created_user INT REFERENCES users(user_id),
	category_created_at TIMESTAMP NOT NULL DEFAULT now(),
	category_updated_user INT REFERENCES users(user_id),
	category_updated_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE products(
	product_id SERIAL PRIMARY KEY,
	product_category_id INT NOT NULL REFERENCES categories(category_id),
	product_code VARCHAR(50) NOT NULL UNIQUE,
	product_name VARCHAR(100) NOT NULL,
	product_desc TEXT,
	product_price DECIMAL(15,2) NOT NULL DEFAULT 0,
	product_stock INT NOT NULL DEFAULT 0,
	product_is_active BOOLEAN NOT NULL DEFAULT true,
	product_created_user INT REFERENCES users(user_id),
	product_created_at TIMESTAMP NOT NULL DEFAULT now(),
	product_updated_user INT REFERENCES users(user_id),
	product_updated_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE images(
	image_id SERIAL PRIMARY KEY,
	image_product_id INT NOT NULL REFERENCES products(product_id),
	image_name VARCHAR(50),
	image_url VARCHAR(50) NOT NULL
);


CREATE TABLE addresses(
	address_id SERIAL PRIMARY KEY,
	address_user_id INT NOT NULL REFERENCES users(user_id),
	address_label VARCHAR(50),
	address_name TEXT,
	address_city VARCHAR(50),
	address_province VARCHAR(50),
	address_postal_code VARCHAR(20),
	address_is_active BOOLEAN NOT NULL DEFAULT true
);