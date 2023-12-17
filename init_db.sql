CREATE TABLE manufacturers(
	manufacturer_id SERIAL PRIMARY KEY,
	manufacturer_name VARCHAR(100) NOT NULL
);

CREATE TABLE categories(
	category_id SERIAL PRIMARY KEY,
	category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products(
	category_id BIGINT NOT NULL,
	manufacturer_id BIGINT NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories(category_id),
	FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id),
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(255) NOT NULL
);

CREATE TABLE price_change(
	product_id BIGINT PRIMARY KEY,
	price_change_ts TIMESTAMP NOT NULL,
	new_price NUMERIC(9,2) NOT NULL 
);

CREATE TABLE stores(
	store_id SERIAL PRIMARY KEY,
	store_name VARCHAR(255) NOT NULL
);

CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	customer_fname VARCHAR(100) NOT NULL,
	customer_lname VARCHAR(100) NOT NULL
);

CREATE TABLE deliveries(
	store_id BIGINT NOT NULL,
	product_id BIGINT NOT NULL,
	FOREIGN KEY (store_id) REFERENCES stores(store_id),
	FOREIGN KEY (product_id) REFERENCES price_change(product_id),
	delivery_date DATE NOT NULL,
	product_count INTEGER NOT NULL
);

CREATE TABLE purchases(
	store_id BIGINT NOT NULL,
	customer_id BIGINT NOT NULL,
	FOREIGN KEY (store_id) references stores(store_id),
	FOREIGN KEY (customer_id) references customers(customer_id),
	purchase_id SERIAL PRIMARY KEY,
	purhase_date TIMESTAMP NOT NULL
);

CREATE TABLE purchase_items(
        product_id BIGINT NOT NULL,
        purchase_id BIGINT NOT NULL,
	FOREIGN KEY (product_id) references products(product_id),
	FOREIGN KEY (purchase_id) references purchases(purchase_id),
	product_count BIGINT NOT NULL,
	product_price NUMERIC(9,2) NOT NULL
);

