CREATE SCHEMA coronavirus;


CREATE TABLE coronavirus.clima (
	temp_max integer NOT NULL,
	temp_min integer NOT NULL,
	preciptacao decimal NOT NULL
);

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
	pop int NOT NULL,
	total_leitos int NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT tempo_fk FOREIGN KEY (data_reg) REFERENCES coronavirus.tempo(id),
	CONSTRAINT pais_fk FOREIGN KEY (pais_cod) REFERENCES coronavirus.pais(codigo_iso),
	CONSTRAINT leitos_fk FOREIGN KEY (total_leitos) REFERENCES coronavirus.leitos(id)
);

CREATE TABLE coronavirus.casos_por_cidade (
    data_reg date NOT NULL,
    cidade text NOT NULL,
    pais char(3) NOT NULL,
    casos integer,
    mortes integer
);

CREATE TABLE coronavirus.temperatura_cidade (
    data_reg date NOT NULL,
    temp_max integer,
    temp_min integer,
    cidade text NOT NULL,
    pais char(3) NOT NULL
);
