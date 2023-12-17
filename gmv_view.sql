CREATE VIEW gmv AS (
	SELECT
	  d.store_id,
	  prod.category_id,
	  SUM(p_items.product_count * p_items.product_price) AS gmv
	FROM 
	  purchase_items p_items JOIN deliveries d on p_items.product_id=d.product_id
          JOIN products prod on p_items.product_id=prod.product_id
	GROUP BY 
	  d.store_id,
          prod.category_id	
);
