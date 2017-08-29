
-- -- Setup commands from Terminal:
-- -- Once only
-- dropdb money_cashboard
-- createdb money_cashboard
-- -- Reset database:
-- psql -d money_cashboard -f 'db/money_cashboard.sql'
-- ruby db/seeds.rb
-- -- View database directly:
-- psql -d money_cashboard
-- SELECT * FROM transactions;  -- etc

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS months;
DROP TABLE IF EXISTS models;

CREATE TABLE models (
  id SERIAL PRIMARY KEY
);

CREATE TABLE months (
  id SERIAL PRIMARY KEY,
  first_day_of_month DATE UNIQUE
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  description VARCHAR(255) NOT NULL,
  monthly_budget INT2 CHECK (monthly_budget>=0)
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  description VARCHAR(255) NOT NULL,
  value NUMERIC(10,2) CHECK (value>0),
  the_date DATE DEFAULT CURRENT_DATE,
  month_id INT,    -- Populated later from date, no reference
  category_id INT REFERENCES categories(id)
);
