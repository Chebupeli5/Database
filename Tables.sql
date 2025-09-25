-- "Huyatina"."Users" определение

-- Drop table

-- DROP TABLE "Huyatina"."Users";

CREATE TABLE "Huyatina"."Users" (
	user_id int4 NOT NULL,
	login varchar NOT NULL,
	"password" varchar NOT NULL,
	visualname varchar NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (user_id),
	CONSTRAINT users_unique_login UNIQUE (login),
	CONSTRAINT users_unique_visualname UNIQUE (visualname)
);


-- "Huyatina"."Financial Goals" определение

-- Drop table

-- DROP TABLE "Huyatina"."Financial Goals";

CREATE TABLE "Huyatina"."Financial Goals" (
	user_id int4 NOT NULL,
	goal_name text NOT NULL,
	goal int4 NOT NULL,
	CONSTRAINT financial_goals_users_fk FOREIGN KEY (user_id) REFERENCES "Huyatina"."Users"(user_id)
);


-- "Huyatina"."Loans" определение

-- Drop table

-- DROP TABLE "Huyatina"."Loans";

CREATE TABLE "Huyatina"."Loans" (
	user_id int4 NOT NULL,
	credit_name text NOT NULL,
	loan_balance money NULL,
	loan_payment money NOT NULL,
	payment_date date NOT NULL,
	CONSTRAINT loans_users_fk FOREIGN KEY (user_id) REFERENCES "Huyatina"."Users"(user_id)
);


-- "Huyatina"."Notifications" определение

-- Drop table

-- DROP TABLE "Huyatina"."Notifications";

CREATE TABLE "Huyatina"."Notifications" (
	user_id int4 NOT NULL,
	message text NOT NULL,
	CONSTRAINT notifications_users_fk FOREIGN KEY (user_id) REFERENCES "Huyatina"."Users"(user_id)
);


-- "Huyatina"."Savings Accounts" определение

-- Drop table

-- DROP TABLE "Huyatina"."Savings Accounts";

CREATE TABLE "Huyatina"."Savings Accounts" (
	user_id int4 NOT NULL,
	saving_name text NOT NULL,
	balance money NOT NULL,
	interest_rate int2 NOT NULL,
	CONSTRAINT savings_accounts_users_fk FOREIGN KEY (user_id) REFERENCES "Huyatina"."Users"(user_id)
);


-- "Huyatina".categories определение

-- Drop table

-- DROP TABLE "Huyatina".categories;

CREATE TABLE "Huyatina".categories (
	category_id int4 NOT NULL,
	user_id int4 NOT NULL,
	"name" text NOT NULL,
	balance money NOT NULL,
	CONSTRAINT categories_pk PRIMARY KEY (category_id),
	CONSTRAINT categories_users_fk FOREIGN KEY (user_id) REFERENCES "Huyatina"."Users"(user_id)
);


-- "Huyatina".categorylimit определение

-- Drop table

-- DROP TABLE "Huyatina".categorylimit;

CREATE TABLE "Huyatina".categorylimit (
	user_id int4 NOT NULL,
	category_id int4 NOT NULL,
	"limit" money NOT NULL,
	CONSTRAINT categorylimit_categories_fk FOREIGN KEY (category_id) REFERENCES "Huyatina".categories(category_id),
	CONSTRAINT categorylimit_users_fk FOREIGN KEY (user_id) REFERENCES "Huyatina"."Users"(user_id)
);


-- "Huyatina".assets определение

-- Drop table

-- DROP TABLE "Huyatina".assets;

CREATE TABLE "Huyatina".assets (
	user_id int4 NOT NULL,
	"name" text NOT NULL,
	balance int4 NOT NULL,
	CONSTRAINT assets_users_fk FOREIGN KEY (user_id) REFERENCES "Huyatina"."Users"(user_id)
);


-- "Huyatina".operations определение

-- Drop table

-- DROP TABLE "Huyatina".operations;

CREATE TABLE "Huyatina".operations (
	operation_id int4 NOT NULL,
	user_id int4 NOT NULL,
	category_id int4 NOT NULL,
	"type" varchar NOT NULL,
	"transaction" int4 NOT NULL,
	"date" date NOT NULL,
	CONSTRAINT operations_categories_fk FOREIGN KEY (category_id) REFERENCES "Huyatina".categories(category_id),
	CONSTRAINT operations_users_fk FOREIGN KEY (user_id) REFERENCES "Huyatina"."Users"(user_id)
);


-- "Huyatina".reports определение

-- Drop table

-- DROP TABLE "Huyatina".reports;

CREATE TABLE "Huyatina".reports (
	user_id int4 NOT NULL,
	file json NOT NULL,
	CONSTRAINT reports_users_fk FOREIGN KEY (user_id) REFERENCES "Huyatina"."Users"(user_id)
);
