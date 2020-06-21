
-- CREATE  PERSON TABLE


CREATE TABLE public.person
(
    id_person integer NOT NULL,
    name varchar,
    surname varchar,
    zip integer,
    city character varying COLLATE pg_catalog."default",
    country character varying COLLATE pg_catalog."default",
    email character varying COLLATE pg_catalog."default",
    phone_number integer,
    birth_date date,
    CONSTRAINT person_pkey PRIMARY KEY (id_person)

)


-- create account table


CREATE TABLE public.account
(
    id_account integer NOT NULL,
    id_person integer,
    account_type varchar,
    CONSTRAINT account_pkey PRIMARY KEY (id_account),
    CONSTRAINT FK_account FOREIGN KEY (id_person) 
	     REFERENCES Person(id_person)
	
)


--SELECT * FROM account



-- create transaction table




CREATE TABLE public.transaction
(
    id_transaction integer NOT NULL,
    id_account integer,
    transaction_type varchar,
	transaction_date date ,
    transaction_amount float ,
   
    CONSTRAINT transaction_pkey PRIMARY KEY (id_transaction),
    CONSTRAINT FK_transaction FOREIGN KEY (id_account) 
	     REFERENCES account (id_account)
	
)


-- import csv data from given datasets 

SELECT * FROM PERSON
--COPY Public.data FROM '/home/arooba/Documents/master/BI_assignment_csvs (1)/BI_assignment_person.csv' DELIMITER ',' CSV HEADER;

COPY person(id_person,name,surname,zip,city,country,email,phone_number,birth_date) 
FROM '/home/arooba/Documents/master/BI_assignment_csvs (1)/BI_assignment_person.csv' CSV HEADER 
WHERE id_person is not NULL;  



-- account csv


COPY account(id_account,id_person,account_type) 
FROM '/home/arooba/Documents/master/BI_assignment_csvs (1)/BI_assignment_account.csv' CSV HEADER 
WHERE id_account is not NULL;


-- transaction csv



SELECT * FROM transaction
--transaction_type

COPY transaction (id_transaction,id_account,transaction_type,transaction_date,transaction_amount) 
FROM '/home/arooba/Documents/master/BI_assignment_csvs (1)/BI_assignment_transaction.csv' CSV HEADER 
WHERE id_transaction is not NULL; 



