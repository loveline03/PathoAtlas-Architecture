/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  30/05/2026 12:52:46                      */
/*==============================================================*/


drop table if exists CONSULTE;

drop table if exists FINANCIAL_COSTS;

drop table if exists MEDICAL_ACTS;

drop table if exists MEDICAL_ACT_TRANSLATIONS;

drop table if exists MEDICAL_CENTERS;

drop table if exists PATHOLOGIES;

drop table if exists PATHOLOGY_TRANSLATIONS;

drop table if exists PROPOSE;

drop table if exists REQUIERT;

drop table if exists USERS;

/*==============================================================*/
/* Table : CONSULTE                                             */
/*==============================================================*/
create table CONSULTE
(
   ID_UTILISATEUR       int not null,
   ID_CENTRE            int not null,
   primary key (ID_UTILISATEUR, ID_CENTRE)
);

/*==============================================================*/
/* Table : FINANCIAL_COSTS                                      */
/*==============================================================*/
create table FINANCIAL_COSTS
(
   ID_COUT              int not null,
   ID_ACTE              int not null,
   CODE_PAYS            varchar(100),
   COUT_MOYEN_          decimal,
   DEVISE               varchar(100),
   primary key (ID_COUT)
);

/*==============================================================*/
/* Table : MEDICAL_ACTS                                         */
/*==============================================================*/
create table MEDICAL_ACTS
(
   ID_ACTE              int not null,
   TYPE_ACTE            varchar(100),
   NIVEAU_PRIORITE      int,
   primary key (ID_ACTE)
);

/*==============================================================*/
/* Table : MEDICAL_ACT_TRANSLATIONS                             */
/*==============================================================*/
create table MEDICAL_ACT_TRANSLATIONS
(
   ID_TRAD_ACTE         int not null,
   ID_ACTE              int not null,
   CODE_LANGUE          varchar(100),
   NOM_ACTE             varchar(100),
   DESCRIPTION_ACTE     text,
   primary key (ID_TRAD_ACTE)
);

/*==============================================================*/
/* Table : MEDICAL_CENTERS                                      */
/*==============================================================*/
create table MEDICAL_CENTERS
(
   ID_CENTRE            int not null,
   NOM_CENTRE           varchar(100),
   TYPE_CENTRE          varchar(100),
   LATITUDE             decimal,
   LONGITUDE            decimal,
   SPECIALITES_DISPONIBLES text,
   primary key (ID_CENTRE)
);

/*==============================================================*/
/* Table : PATHOLOGIES                                          */
/*==============================================================*/
create table PATHOLOGIES
(
   ID_PATHOLOGIE        int not null,
   SPECIALITE_REQUISE   varchar(100),
   CATEGORIE            varchar(100),
   primary key (ID_PATHOLOGIE)
);

/*==============================================================*/
/* Table : PATHOLOGY_TRANSLATIONS                               */
/*==============================================================*/
create table PATHOLOGY_TRANSLATIONS
(
   ID_TRAD_PATHO        int not null,
   ID_PATHOLOGIE        int not null,
   CODE_LANGUE          varchar(100),
   NOM_MALADIE          varchar(100),
   DESCRIPTION_SYMPTOMES_ text,
   DESCRIPTION_CAUSES   text,
   MECANISME_IMMUNOLOGIQUE text,
   primary key (ID_TRAD_PATHO)
);

/*==============================================================*/
/* Table : PROPOSE                                              */
/*==============================================================*/
create table PROPOSE
(
   ID_ACTE              int not null,
   ID_CENTRE            int not null,
   primary key (ID_ACTE, ID_CENTRE)
);

/*==============================================================*/
/* Table : REQUIERT                                             */
/*==============================================================*/
create table REQUIERT
(
   ID_PATHOLOGIE        int not null,
   ID_ACTE              int not null,
   primary key (ID_PATHOLOGIE, ID_ACTE)
);

/*==============================================================*/
/* Table : USERS                                                */
/*==============================================================*/
create table USERS
(
   ID_UTILISATEUR       int not null,
   EMAIL                varchar(100),
   DATE_CREATION        date,
   LANGUE_PREFEREE      varchar(50),
   STATUT_FINANCIER     varchar(50),
   primary key (ID_UTILISATEUR)
);

alter table CONSULTE add constraint FK_CONSULTE foreign key (ID_UTILISATEUR)
      references USERS (ID_UTILISATEUR) on delete restrict on update restrict;

alter table CONSULTE add constraint FK_CONSULTE2 foreign key (ID_CENTRE)
      references MEDICAL_CENTERS (ID_CENTRE) on delete restrict on update restrict;

alter table FINANCIAL_COSTS add constraint FK_A_POUR_PRIX foreign key (ID_ACTE)
      references MEDICAL_ACTS (ID_ACTE) on delete restrict on update restrict;

alter table MEDICAL_ACT_TRANSLATIONS add constraint FK_POSSEDE_TRAD_ACTE foreign key (ID_ACTE)
      references MEDICAL_ACTS (ID_ACTE) on delete restrict on update restrict;

alter table PATHOLOGY_TRANSLATIONS add constraint FK_POSSEDE_TRAD_PATHO foreign key (ID_PATHOLOGIE)
      references PATHOLOGIES (ID_PATHOLOGIE) on delete restrict on update restrict;

alter table PROPOSE add constraint FK_PROPOSE foreign key (ID_ACTE)
      references MEDICAL_ACTS (ID_ACTE) on delete restrict on update restrict;

alter table PROPOSE add constraint FK_PROPOSE2 foreign key (ID_CENTRE)
      references MEDICAL_CENTERS (ID_CENTRE) on delete restrict on update restrict;

alter table REQUIERT add constraint FK_REQUIERT foreign key (ID_PATHOLOGIE)
      references PATHOLOGIES (ID_PATHOLOGIE) on delete restrict on update restrict;

alter table REQUIERT add constraint FK_REQUIERT2 foreign key (ID_ACTE)
      references MEDICAL_ACTS (ID_ACTE) on delete restrict on update restrict;

