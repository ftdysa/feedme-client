CREATE SEQUENCE user_id_seq;
CREATE TABLE site_user (
    id integer NOT NULL DEFAULT nextval('user_id_seq'),
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE SEQUENCE recipe_id_seq;
CREATE TABLE recipe (
    id integer NOT NULL DEFAULT nextval('recipe_id_seq'),
    title varchar(255),
    description text,
    prep_time int,
    cook_time int,
    date_created timestamp,
    user_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES site_user(id)
);
ALTER SEQUENCE recipe_id_seq OWNED BY recipe.id;

CREATE TABLE measurement (
    id integer NOT NULL,
    name varchar(255) NOT NULL,
    abbr varchar(16),
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE SEQUENCE ingredient_id_seq;
CREATE TABLE ingredient (
    id integer NOT NULL DEFAULT nextval('ingredient_id_seq'),
    name varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (id)
);
ALTER SEQUENCE ingredient_id_seq OWNED BY ingredient.id;

CREATE TABLE user_ingredient (
    user_id integer,
    ingredient_id integer,
    quantity integer NOT NULL DEFAULT 0,
    measurement_id integer,
    PRIMARY KEY (user_id, ingredient_id),
    FOREIGN KEY (user_id) REFERENCES site_user(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(id),
    FOREIGN KEY (measurement_id) REFERENCES measurement(id)
);

CREATE TABLE recipe_ingredient (
    recipe_id integer REFERENCES recipe,
    ingredient_id integer REFERENCES ingredient,
    quantity integer NOT NULL DEFAULT 0,
    measurement_id integer REFERENCES measurement,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(id),
    FOREIGN KEY (measurement_id) REFERENCES measurement(id)
);
