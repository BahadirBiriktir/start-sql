-- Löscht die Tabelle und den gesamten Inhlat und alle zugehörigen Bedingungen
drop table auto cascade constraints;
drop table besitzer cascade constraints;

--Tabelle Besitzer erstellen 
create table besitzer(
    id integer,  -- ganze Zahl, NUMBER(prec, sclae) für Gleitkommerzahlen
    name varchar2(64),
    geburtsdatum date,
    adresse varchar2(128) not null, 
    constraint pk_bestizer_id primary key (id),
    constraint uq_besitzer_name unique (name)--,
   constraint ck_besitzer_alter check (2022 - to_char(geburtsdatum,'yyyy')>=18)
);


create table auto(
    id integer,
    Bezeichnung varchar2(64),
    PS integer,
    id_besitzer integer not null, -- weil ein auto einen bestizer haben muss
    constraint pk_auto_id primary key (id),
    constraint fk_auto_id_besitzer foreign key (ID_Besitzer) references besitzer (id),
    constraint uq_auto_Bezeichnung unique (Bezeichnung),
    constraint ck_auto_ps check (ps>19)
);

--Daten einfügen
insert into besitzer values(
1, 'Bahadir Biriktir',to_date('27.07.2003','dd.mm.yyyy'), 'St.Martin');
insert into besitzer values(    -- Besitzer der kein auto hat
2, 'Hugo Bert', null, 'Vorarlberg');

--Inserts, die nicht gehen
--Name unique
insert into besitzer values(
3, 'fabio', null, 'St.Martin');

/*insert into besitzer values(
3, 'Bahadir Biriktir', null, 'null'); muss einen adresse haben
*/

--Daten einfügen Auto
insert into auto values(
111, 'Audi A4 Avant', 190,1);
insert into auto values(
112, 'Audi A6 Sport', 260,1);
insert into auto values(
113, 'BMW 320d', 185,2);


/*insert into auto values(
114, 'BMW 320d', 185,2); -- muss auto id besitzer haben
*/
/*--PS <20 
insert into auto values(
114, 'smart', 15,2);
*/

/*insert into auto values(
114, 'BMW 320d', 185,null); --muss besitzer haben
*/
/*
--Insert, die die Constraints verletzen
--FK-Constraint verletz
insert into auto values(
112, 'Audi A4 Avant', 190,15);
*/

commit;
