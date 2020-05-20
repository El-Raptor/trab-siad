CREATE SCHEMA coronavirus;


CREATE TABLE coronavirus.temperatura (
	id serial,
	temp_celsius int NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE coronavirus.cidade (
    id serial primary key,
    nome text NOT NULL
);

CREATE TABLE coronavirus.pais (
    codigo_iso CHAR(3) primary key,
    nome text NOT NULL,
    pop integer NOT NULL, 
    continente VARCHAR(20) NOT NULL
);

CREATE TABLE coronavirus.leitos (
	id serial,
	total_leitos int  NOT NULL,
	pais_iso int NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT pais_codfk FOREIGN KEY (pais_iso) REFERENCES coronavirus.pais(codigo_iso)
);

CREATE TABLE coronavirus.tempo (
    id serial primary key,
    dia smallint NOT NULL,
    mes smallint NOT NULL, 
    ano smallint NOT NULL
);

CREATE TABLE coronavirus.covid19_mundo (
	id serial,
	data_reg int NOT NULL,
	casos int NOT NULL,
	mortes int NOT NULL,
	pais_cod char(3) NOT NULL,
	total_leitos int NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT tempo_fk FOREIGN KEY (data_reg) REFERENCES coronavirus.tempo(id),
	CONSTRAINT pais_fk FOREIGN KEY (pais_cod) REFERENCES coronavirus.pais(codigo_iso),
	CONSTRAINT leitos_fk FOREIGN KEY (total_leitos) REFERENCES coronavirus.leitos(id)
);

CREATE TABLE coronavirus.casos_por_cidade (
    id serial,
    id_data int NOT NULL,
    cidade int NOT NULL,
    pais char(3) NOT NULL,
    casos integer,
    PRIMARY KEY (id),
    CONSTRAINT cidade_casos_cidade_fk FOREIGN KEY (cidade) REFERENCES coronavirus.cidade(id),
    CONSTRAINT pais_casos_cidade_fk FOREIGN KEY (pais) REFERENCES coronavirus.pais(codigo_iso),
    CONSTRAINT data_id_casos_cidade_fk FOREIGN KEY (id_data) REFERENCES coronavirus.tempo(id)
);

CREATE TABLE coronavirus.temperatura_cidade (
    id serial,
    id_data int NOT NULL,
    temp_max integer NOT NULL,
    temp_min integer NOT NULL,
    cidade int NOT NULL,
    pais char(3) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT cidade_temp_cidade_fk FOREIGN KEY (cidade) REFERENCES coronavirus.cidade(id),
    CONSTRAINT pais_temp_cidade_fk FOREIGN KEY (pais) REFERENCES coronavirus.pais(codigo_iso),
    CONSTRAINT data_id_temp_cidade_fk FOREIGN KEY (id_data) REFERENCES coronavirus.tempo(id),
    CONSTRAINT temp_max_fk FOREIGN KEY (temp_max) REFERENCES coronavirus.temperatura(id),
    CONSTRAINT temp_min_fk FOREIGN KEY (temp_min) REFERENCES coronavirus.temperatura(id)
);
