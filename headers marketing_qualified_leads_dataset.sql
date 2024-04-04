USE mban_a2v2_fall23;

ALTER TABLE ml_marketing_qualified_leads_dataset
RENAME COLUMN C1 TO mql_id;

ALTER TABLE ml_marketing_qualified_leads_dataset
RENAME COLUMN C2 TO first_contact_date;

ALTER TABLE ml_marketing_qualified_leads_dataset
RENAME COLUMN C3 TO landing_page_id;

ALTER TABLE ml_marketing_qualified_leads_dataset
RENAME COLUMN C4 TO origin;

DELETE FROM ml_marketing_qualified_leads_dataset LIMIT 1;

SELECT * FROM ml_marketing_qualified_leads_dataset;