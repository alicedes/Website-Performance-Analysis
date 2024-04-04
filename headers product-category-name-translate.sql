USE mban_a2v2_fall23;

ALTER TABLE ml_product_category_name_translation
RENAME COLUMN C1 TO product_category_name;

ALTER TABLE ml_product_category_name_translation
RENAME COLUMN C2 TO product_category_name_english;

DELETE FROM ml_product_category_name_translation LIMIT 1;