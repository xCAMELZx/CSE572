
-- ***************** This has been created by Yousef
-- ************************************** `Game`
CREATE TABLE Game
(
 InventoryID     number(10,0) NOT NULL ,
 gameMode        varchar2(20) NOT NULL ,
 Developers      varchar2(20) NOT NULL ,
 Rating          number(10,0) NOT NULL ,
 Platform        varchar2(20) NOT NULL ,
 Genre           varchar2(20) NOT NULL ,
 Publishers      varchar2(20) NOT NULL ,
 Themes          varchar2(20) NOT NULL ,
 Perspective     varchar2(20) NOT NULL ,
 Description     varchar2(255) NOT NULL ,
 Availablity     varchar2(1) NOT NULL ,
 InventoryCount number(10,0) NOT NULL ,
 CustomerID     number(10,0) NOT NULL ,
 title 		varchar2(20) NOT NULL,
PRIMARY KEY (inventoryID)
);

-- ************************************** `Platform`
CREATE TABLE Platform
(
 platID     number(10,0) NOT NULL ,
 platname    varchar2(25) NOT NULL ,
 platrating  number(10,0) NOT NULL ,
 platdesc     varchar2(25) NOT NULL,
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
 developer    varchar2(45) NOT NULL ,
 devFirst     varchar2(10) NOT NULL ,
 devLast      varchar2(10) NOT NULL ,
 devCompany   varchar2(16) NOT NULL ,
 devDesc      varchar2(30) NOT NULL ,
 inventoryID  number(10) NOT NULL ,
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
 availGame   varchar2(1) NOT NULL ,
 inventoryID number(10) NOT NULL ,
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
 pubFirst    varchar2(17) NOT NULL ,
 pubLast     varchar2(17) NOT NULL ,
 pubDesc      varchar2(30) NOT NULL ,
 inventoryID number(10) NOT NULL ,
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
 count  varchar2(10) NOT NULL ,
 availGame varchar2(1) NOT NULL ,
PRIMARY KEY (count)
);

ALTER TABLE InvCount
ADD CONSTRAINT FK26
  FOREIGN KEY (availGame)
  REFERENCES Available (availGame);


  -- ************************************** `Genre`

  CREATE TABLE Genre
  (
   genreType varchar2(11) NOT NULL ,
   platID    number(10) NOT NULL ,
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
     themeType varchar2(16) NOT NULL ,
     genreType varchar2(16) NOT NULL ,
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
 descPublisher  varchar2(30) NOT NULL ,
 descDeveloper  varchar2(30) NOT NULL ,
 descGame       varchar2(255) NOT NULL ,
 inventoryID   number(10) NOT NULL ,
 developer     varchar2(20) NOT NULL ,
 pubFirst      varchar2(10) NOT NULL ,
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
 CustomerID    varchar2(5) NOT NULL ,
 customerFName  varchar2(10) NOT NULL ,
 customerLName  varchar2(10) NOT NULL ,
 customerCC     varchar2(21) NOT NULL ,
 customerDOB   varchar2(13) NOT NULL ,
 customerEmail  varchar2(22) NOT NULL ,
 customerPhone varchar2(13) NOT NULL ,
 invCount      varchar2(8) NOT NULL ,
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
  perspectiveType varchar2(16) NOT NULL ,
  themeType varchar2(16) NOT NULL ,
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
  perspectiveType varchar(16) NOT NULL ,
 PRIMARY KEY (rate)
 );

 CREATE INDEX FK12 ON Rating (perspectiveType);

 ALTER TABLE Rating
 ADD CONSTRAINT FK34
  FOREIGN KEY (perspectiveType)
  REFERENCES Perspective (perspectiveType);
