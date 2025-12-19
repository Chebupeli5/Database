-- "Financik"."Users" определение

-- Drop table

-- DROP TABLE "Financik"."Users";

CREATE TABLE "Financik"."Users" (
	user_id int4 NOT NULL,
	login varchar NOT NULL,
	"password" varchar NOT NULL,
	visualname varchar NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (user_id),
	CONSTRAINT users_unique_login UNIQUE (login),
	CONSTRAINT users_unique_visualname UNIQUE (visualname)
);


-- "Financik"."Financial Goals" определение

-- Drop table

-- DROP TABLE "Financik"."Financial Goals";

CREATE TABLE "Financik"."Financial Goals" (
	user_id int4 NOT NULL,
	goal_name text NOT NULL,
	goal int4 NOT NULL,
	CONSTRAINT financial_goals_users_fk FOREIGN KEY (user_id) REFERENCES "Financik"."Users"(user_id)
);


-- "Financik"."Loans" определение

-- Drop table

-- DROP TABLE "Financik"."Loans";

CREATE TABLE "Financik"."Loans" (
	user_id int4 NOT NULL,
	credit_name text NOT NULL,
	loan_balance money NULL,
	loan_payment money NOT NULL,
	payment_date date NOT NULL,
	CONSTRAINT loans_users_fk FOREIGN KEY (user_id) REFERENCES "Financik"."Users"(user_id)
);


-- "Financik"."Notifications" определение

-- Drop table

-- DROP TABLE "Financik"."Notifications";

CREATE TABLE "Financik"."Notifications" (
	user_id int4 NOT NULL,
	message text NOT NULL,
	CONSTRAINT notifications_users_fk FOREIGN KEY (user_id) REFERENCES "Financik"."Users"(user_id)
);


-- "Financik"."Savings Accounts" определение

-- Drop table

-- DROP TABLE "Financik"."Savings Accounts";

CREATE TABLE "Financik"."Savings Accounts" (
	user_id int4 NOT NULL,
	saving_name text NOT NULL,
	balance money NOT NULL,
	interest_rate int2 NOT NULL,
	CONSTRAINT savings_accounts_users_fk FOREIGN KEY (user_id) REFERENCES "Financik"."Users"(user_id)
);


-- "Financik".categories определение

-- Drop table

-- DROP TABLE "Financik".categories;

CREATE TABLE "Financik".categories (
	category_id int4 NOT NULL,
	user_id int4 NOT NULL,
	"name" text NOT NULL,
	balance money NOT NULL,
	CONSTRAINT categories_pk PRIMARY KEY (category_id),
	CONSTRAINT categories_users_fk FOREIGN KEY (user_id) REFERENCES "Financik"."Users"(user_id)
);


-- "Financik".categorylimit определение

-- Drop table

-- DROP TABLE "Financik".categorylimit;

CREATE TABLE "Financik".categorylimit (
	user_id int4 NOT NULL,
	category_id int4 NOT NULL,
	"limit" money NOT NULL,
	CONSTRAINT categorylimit_categories_fk FOREIGN KEY (category_id) REFERENCES "Financik".categories(category_id),
	CONSTRAINT categorylimit_users_fk FOREIGN KEY (user_id) REFERENCES "Financik"."Users"(user_id)
);


-- "Financik".assets определение

-- Drop table

-- DROP TABLE "Financik".assets;

CREATE TABLE "Financik".assets (
	user_id int4 NOT NULL,
	"name" text NOT NULL,
	balance int4 NOT NULL,
	CONSTRAINT assets_users_fk FOREIGN KEY (user_id) REFERENCES "Financik"."Users"(user_id)
);


-- "Financik".operations определение

-- Drop table

-- DROP TABLE "Financik".operations;

CREATE TABLE "Financik".operations (
	operation_id int4 NOT NULL,
	user_id int4 NOT NULL,
	category_id int4 NOT NULL,
	"type" varchar NOT NULL,
	"transaction" int4 NOT NULL,
	"date" date NOT NULL,
	CONSTRAINT operations_categories_fk FOREIGN KEY (category_id) REFERENCES "Financik".categories(category_id),
	CONSTRAINT operations_users_fk FOREIGN KEY (user_id) REFERENCES "Financik"."Users"(user_id)
);


-- "Financik".reports определение

-- Drop table

-- DROP TABLE "Financik".reports;

CREATE TABLE "Financik".reports (
	user_id int4 NOT NULL,
	file json NOT NULL,
	CONSTRAINT reports_users_fk FOREIGN KEY (user_id) REFERENCES "Financik"."Users"(user_id)
);
