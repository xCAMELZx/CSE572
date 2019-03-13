
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

CREATE INDEX FK2 ON gameMode (inventoryID);

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

CREATE INDEX FK3 ON Developer (inventoryID);

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

CREATE INDEX FK4 ON Available (inventoryID);

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

CREATE INDEX FK5 ON Publishers (inventoryID);

ALTER TABLE Publishers
ADD CONSTRAINT FK24
  FOREIGN KEY (inventoryID)
  REFERENCES Game (inventoryID);

ALTER TABLE Publishers
ADD CONSTRAINT FK25
  FOREIGN KEY (developer)
  REFERENCES Developer (developer);

  -- ************************************** `InvCount`

  CREATE TABLE InvCount
(
 count  varchar2(45) NOT NULL ,
 availGame varchar2(45) NOT NULL ,
PRIMARY KEY (count)
);

ALTER TABLE InvCount
ADD CONSTRAINT FK26
  FOREIGN KEY (availGame)
  REFERENCES Available (availGame);


  -- ************************************** `Genre`

  CREATE TABLE Genre
  (
   genreType varchar2(255) NOT NULL ,
   platID    number(10,0) NOT NULL ,
  PRIMARY KEY (genreType)
  );

  CREATE INDEX FK7 ON Genre (platID);

ALTER TABLE Genre
ADD CONSTRAINT FK27
  FOREIGN KEY (platID)
  REFERENCES Platform (platID);

    -- ************************************** `Themes`

    CREATE TABLE Themes
    (
     themeType varchar2(255) NOT NULL ,
     genreType varchar2(255) NOT NULL ,
    PRIMARY KEY (themeType)
    );

CREATE INDEX FK8 ON Themes (genreType);

ALTER TABLE Themes
ADD CONSTRAINT FK28
 FOREIGN KEY (genreType)
 REFERENCES Genre (genreType);

-- ************************************** `Description`
CREATE TABLE Description
(
 descript      varchar2(255) NOT NULL ,
 descPublisher linestring NOT NULL ,
 descDeveloper linestring NOT NULL ,
 descGame      linestring NOT NULL ,
 inventoryID   number(10,0) NOT NULL ,
 developer     varchar2(45) NOT NULL ,
 pubFirst      varchar2(45) NOT NULL ,
PRIMARY KEY (descript)
);

CREATE INDEX FK9 ON Description (developer);

ALTER TABLE Description
ADD CONSTRAINT FK29
  FOREIGN KEY (developer)
  REFERENCES Developer (developer);

ALTER TABLE Description
ADD CONSTRAINT FK30
  FOREIGN KEY (pubFirst)
  REFERENCES Publishers (pubFirst);

ALTER TABLE Description
ADD CONSTRAINT FK31
  FOREIGN KEY (inventoryID)
  REFERENCES Game (inventoryID);

-- ************************************** `Customer`

CREATE TABLE Customer
(
 CustomerID    varchar2(10) NOT NULL ,
 customerFName linestring NOT NULL ,
 customerLName linestring NOT NULL ,
 customerCC    linestring NOT NULL ,
 customerAge   varchar2(45) NOT NULL ,
 customerEmail linestring NOT NULL ,
 customerPhone varchar2(20) NOT NULL ,
 invCount      varchar2(45) NOT NULL ,
PRIMARY KEY (CustomerID)
);

CREATE INDEX FK10 ON Customer (invCount);

ALTER TABLE Customer
ADD CONSTRAINT FK32
 FOREIGN KEY (invCount)
 REFERENCES InvCount (count);

 -- ************************************** `Perspective`

 CREATE TABLE Perspective
 (
  perspectiveType varchar2(45) NOT NULL ,
  themeType varchar2(255) NOT NULL ,
 PRIMARY KEY (perspectiveType)
);

CREATE INDEX FK11 ON Perspective (themeType);

ALTER TABLE Perspective
ADD CONSTRAINT FK33
 FOREIGN  KEY (themeType)
 REFERENCES Themes (themeType);

 -- ************************************** `Rating`

 CREATE TABLE Rating
 (
  rate  varchar2(45) NOT NULL ,
  perspectiveType varchar(255) NOT NULL ,
 PRIMARY KEY (rate)
 );

 CREATE INDEX FK12 ON Rating (perspectiveType);

 ALTER TABLE Rating
 ADD CONSTRAINT FK34
  FOREIGN KEY (perspectiveType)
  REFERENCES Perspective (perspectiveType);
