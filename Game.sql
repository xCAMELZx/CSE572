
-- ************************************** `Game`
CREATE TABLE Game
(
 InventoryID     number(10,0) NOT NULL ,
 gameMode        varchar2(45) NOT NULL ,
 Developers      varchar2(255) NOT NULL ,
 Rating          number(10,0) NOT NULL ,
 Platform        varchar2(255) NOT NULL ,
 Genre           varchar2(255) NOT NULL ,
 Publishers      varchar2(255) NOT NULL ,
 Themes          varchar2(255) NOT NULL ,
 Perspective     varchar2(45) NOT NULL ,
 Description     linestring NOT NULL ,
 Availablity     varchar2(1) NOT NULL ,
 InventoryCount number(10,0) NOT NULL ,
 CustomerID     number(10,0) NOT NULL ,
PRIMARY KEY (inventoryID)
);

-- ************************************** `Platform`
CREATE TABLE Platform
(
 platID     number(10,0) NOT NULL ,
 platname    varchar2(255) NOT NULL ,
 platrating  number(10,0) NOT NULL ,
 platdesc    linestring NOT NULL ,
 platprice   number(10,0) NOT NULL ,
 InventoryID number(10,0) NOT NULL ,
PRIMARY KEY (platID)
);



CREATE INDEX FK1 ON Platform (InventoryID);

ALTER TABLE Platform
ADD CONSTRAINT FK20
  FOREIGN KEY (inventoryID)
  REFERENCES Game (inventoryID);


-- ************************************** `gameMode`
CREATE TABLE gameMode
  (
   modeType varchar(45) NOT NULL ,
   InventoryID number(10,0) NOT NULL ,
   PRIMARY KEY (modeType)
  );

CREATE INDEX FK2 ON gameMode (inventoryID),

ALTER TABLE gameMode
ADD CONSTRAINT FK21
  FOREIGN KEY (inventoryID)
  REFERENCES Game (inventoryID);


-- ************************************** `Developer`

CREATE TABLE Developer
(
 developer   varchar2(45) NOT NULL ,
 devFirst    varchar2(45) NOT NULL ,
 devLast     varchar2(255) NOT NULL ,
 devCompany  linestring NOT NULL ,
 devDesc     linestring NOT NULL ,
 inventoryID number(10,0) NOT NULL ,
PRIMARY KEY (developer)
);

CREATE INDEX FK3 ON Developer (inventoryID),

ALTER TABLE Developer
ADD CONSTRAINT FK22
  FOREIGN KEY (inventoryID)
  REFERENCES Game (inventoryID);


-- ************************************** `Available`
CREATE TABLE Available
(
 availGame   varchar2(45) NOT NULL ,
 inventoryID number(10,0) NOT NULL ,
PRIMARY KEY (availGame)
);

CREATE INDEX FK4 ON Available (inventoryID),

ALTER TABLE Available
ADD CONSTRAINT FK23
  FOREIGN KEY (inventoryID)
  REFERENCES Game (inventoryID);

  -- ************************************** `Publishers`

  CREATE TABLE Publishers
(
 pubFirst    varchar2(45) NOT NULL ,
 pubLast     varchar2(45) NOT NULL ,
 pubDesc     linestring NOT NULL ,
 inventoryID number(10,0) NOT NULL ,
 developer   varchar2(45) NOT NULL ,
PRIMARY KEY (pubFirst)
);

CREATE INDEX FK5 ON Publishers (inventoryID),

ALTER TABLE Publishers
ADD CONSTRAINT FK24
  FOREIGN KEY (inventoryID)
  REFERENCES Game (inventoryID)

ALTER TABLE Publishers
ADD CONSTRAINT FK25
  FOREIGN KEY (developer)
  REFERENCES Developer (developer)

  -- ************************************** `InvCount`

  CREATE TABLE InvCount
(
 count  varchar2(45) NOT NULL ,
 availGame varchar2(45) NOT NULL ,
PRIMARY KEY (count)
);

CREATE INDEX FK6 ON InvCount (count),

ALTER TABLE InvCount
ADD CONSTRAINT FK26
  FOREIGN KEY (availGame)
  REFERENCES Available (availGame);


  -- ************************************** `Genre`

  CREATE TABLE Genre
  (
   genreType linestring NOT NULL ,
   platID    number(10,0) NOT NULL ,
  PRIMARY KEY (genreType)
  );

  CREATE INDEX FK7 ON Genre (platID),

  ALTER TABLE Genre
  ADD CONSTRAINT FK27
    FOREIGN KEY (platID)
    REFERENCES Platform (platID)

    -- ************************************** `Themes`
