USE mban_a2v2_fall23;

ALTER TABLE ml_orders_dataset
RENAME COLUMN C1 TO order_id;

ALTER TABLE ml_orders_dataset
RENAME COLUMN C2 TO customer_id;

ALTER TABLE ml_orders_dataset
RENAME COLUMN C3 TO order_status;

ALTER TABLE ml_orders_dataset
RENAME COLUMN C4 TO order_purchase_timestamp;

ALTER TABLE ml_orders_dataset
RENAME COLUMN C5 TO order_approved_at;

ALTER TABLE ml_orders_dataset
RENAME COLUMN C6 TO order_delivered_carrier_date;

ALTER TABLE ml_orders_dataset
RENAME COLUMN C7 TO order_delivered_customer_date;

ALTER TABLE ml_orders_dataset
RENAME COLUMN C8 TO order_estimated_delivery_date;

DELETE FROM ml_orders_dataset LIMIT 1;
