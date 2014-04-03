CREATE DATABASE feedme;

CREATE SCHEMA IF NOT EXISTS feedme;

CREATE ROLE feedme_server PASSWORD 'somelongpass' NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN;

ALTER DEFAULT PRIVILEGES IN SCHEMA feedme GRANT ALL ON TABLES TO feedme_server;

CREATE SEQUENCE feedme.user_id_seq;
CREATE TABLE feedme.site_user (
    id integer NOT NULL DEFAULT nextval('feedme.user_id_seq'),
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (username)
);
ALTER SEQUENCE feedme.user_id_seq OWNED BY feedme.site_user.id;

CREATE SEQUENCE feedme.recipe_id_seq;
CREATE TABLE feedme.recipe (
    id integer NOT NULL DEFAULT nextval('feedme.recipe_id_seq'),
    title varchar(255),
    description text,
    prep_time int,
    cook_time int,
    date_created timestamp,
    user_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES feedme.site_user(id)
);
ALTER SEQUENCE feedme.recipe_id_seq OWNED BY feedme.recipe.id;

CREATE TABLE feedme.measurement (
    id integer NOT NULL,
    name varchar(255) NOT NULL,
    abbr varchar(16),
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE feedme.preparation (
    id integer NOT NULL,
    name varchar(64) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE SEQUENCE feedme.ingredient_id_seq;
CREATE TABLE feedme.ingredient (
    id integer NOT NULL DEFAULT nextval('feedme.ingredient_id_seq'),
    name varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);
ALTER SEQUENCE feedme.ingredient_id_seq OWNED BY feedme.ingredient.id;

CREATE TABLE feedme.user_ingredient (
    user_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    quantity integer NOT NULL DEFAULT 0,
    measurement_id integer,
    PRIMARY KEY (user_id, ingredient_id),
    FOREIGN KEY (user_id) REFERENCES feedme.site_user(id),
    FOREIGN KEY (ingredient_id) REFERENCES feedme.ingredient(id),
    FOREIGN KEY (measurement_id) REFERENCES feedme.measurement(id)
);

CREATE TABLE feedme.recipe_ingredient (
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    quantity integer NOT NULL DEFAULT 0,
    measurement_id integer NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES feedme.recipe(id),
    FOREIGN KEY (ingredient_id) REFERENCES feedme.ingredient(id),
    FOREIGN KEY (measurement_id) REFERENCES feedme.measurement(id)
);
