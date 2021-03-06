DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS person_assessments CASCADE;
DROP TABLE IF EXISTS virtue_buckets CASCADE;
DROP TABLE IF EXISTS virtues CASCADE;

CREATE TABLE employees (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL,
  avatar VARCHAR(255) NOT NULL,
  job_title VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  isAdmin BOOLEAN
);

CREATE TABLE person_assessments (
  id SERIAL PRIMARY KEY NOT NULL,
  employee_id INTEGER REFERENCES employees(id) NOT NULL,
  survey_id INTEGER NOT NULL UNIQUE,
  target_employee_id INTEGER REFERENCES employees(id) NOT NULL
);

CREATE TABLE virtue_buckets (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL,
  img VARCHAR(255) NOT NULL
);

CREATE TABLE virtues (
  id SERIAL PRIMARY KEY NOT NULL,
  virtue_bucket_id INTEGER REFERENCES virtue_buckets(id) NOT NULL,
  name VARCHAR(50) NOT NULL UNIQUE,
  description VARCHAR(255)
);

ALTER SEQUENCE employees_id_seq RESTART WITH 1;
ALTER SEQUENCE person_assessments_id_seq RESTART WITH 1;
ALTER SEQUENCE virtue_buckets_id_seq RESTART WITH 1;
ALTER SEQUENCE virtues_id_seq RESTART WITH 1;