CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	order_code VARCHAR(15) NOT NULL UNIQUE,
	order_status VARCHAR(50) NOT NULL DEFAULT 'diproses',
	order_created_at TIMESTAMP NOT NULL DEFAULT now(),
	order_user_id INT NOT NULL REFERENCES users(user_id),
	order_address_id INT NOT NULL REFERENCES addresses(address_id),
	order_total_amount DECIMAL(15,2) NOT NULL
);

CREATE TABLE order_items(
	order_item_id SERIAL PRIMARY KEY,
	order_product_id INT NOT NULL REFERENCES products(product_id),
	order_item_price DECIMAL(15,2) NOT NULL,
	order_item_qty INT NOT NULL,
	order_item_order_id INT NOT NULL REFERENCES orders(order_id)
);

CREATE TABLE shipments(
	shipment_id SERIAL PRIMARY KEY,
	shipment_code VARCHAR(50) NOT NULL UNIQUE,
	shipment_name VARCHAR(50) NOT NULL,
	shipment_type VARCHAR(50) NOT NULL,
	shipment_tracking_number VARCHAR(50),
	shipment_status VARCHAR(50) NOT NULL,
	shipment_created_at TIMESTAMP NOT NULL DEFAULT now(),
	shipment_order_id INT NOT NULL REFERENCES orders(order_id)
);

CREATE TABLE payments(
	payment_id SERIAL PRIMARY KEY,
	payment_code VARCHAR(50) NOT NULL UNIQUE,
	payment_name VARCHAR(50) NOT NULL,
	payment_status VARCHAR(50) NOT NULL,
	payment_amount DECIMAL(15,2) NOT NULL,
	payment_created_at TIMESTAMP NOT NULL DEFAULT now(),
	payment_order_id INT NOT NULL REFERENCES orders(order_id)
);
