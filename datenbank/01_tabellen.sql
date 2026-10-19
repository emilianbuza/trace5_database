-- Tabellen des Übungsshops shop.beispiel.de
-- Kurs "SQL für Online-Marketer"

DROP TABLE IF EXISTS bestellungen;
DROP TABLE IF EXISTS kampagnen;
DROP TABLE IF EXISTS kunden;
DROP TABLE IF EXISTS produkte;

CREATE TABLE produkte (
    produkt_id  SERIAL PRIMARY KEY,
    name        TEXT NOT NULL,
    preis       NUMERIC(10, 2) NOT NULL
);

CREATE TABLE kunden (
    kunde_id     SERIAL PRIMARY KEY,
    name         TEXT NOT NULL,
    email        TEXT NOT NULL,
    strasse      TEXT,
    plz          TEXT,
    ort          TEXT,
    angelegt_am  TIMESTAMP NOT NULL   -- in UTC
);

CREATE TABLE kampagnen (
    kampagne_id   SERIAL PRIMARY KEY,
    utm_campaign  TEXT NOT NULL,
    kanal         TEXT,
    start_datum   DATE,
    ende_datum    DATE,
    kosten        NUMERIC(10, 2)
);

CREATE TABLE bestellungen (
    bestell_id    SERIAL PRIMARY KEY,
    kunde_id      INTEGER NOT NULL REFERENCES kunden (kunde_id),
    produkt_id    INTEGER NOT NULL REFERENCES produkte (produkt_id),
    bestellt_am   TIMESTAMP NOT NULL,  -- in UTC
    betrag        NUMERIC(10, 2) NOT NULL,
    status        TEXT NOT NULL,
    utm_source    TEXT,
    utm_medium    TEXT,
    utm_campaign  TEXT
);
