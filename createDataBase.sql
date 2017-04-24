CREATE TABLE Users(
    userID INT(20) NOT NULL AUTO_INCREMENT,
    userName VARCHAR(50) NOT NULL,
    userPhone VARCHAR(11) NOT NULL,
    userPassword VARCHAR(50) NOT NULL,
    userMail VARCHAR(50),
    userSex TINYINT,
    userBirthDay DATE,
    PRIMARY KEY(userID)
);
CREATE TABLE DishType(
    typeID INT(20) NOT NULL AUTO_INCREMENT,
    typeName VARCHAR(50) NOT NULL,
    PRIMARY KEY(TypeID)
);
CREATE TABLE Menu(
    DishID INT(20) NOT NULL AUTO_INCREMENT,
    DishName VARCHAR(20) NOT NULL,
    DishNum INT,
    DishComment VARCHAR(50),
    DishPrice DOUBLE,
    DishPriceUrl VARCHAR(255),
    TypeID INT(20) NOT NULL,
    PRIMARY KEY(DishID),
    FOREIGN KEY(TypeID) REFERENCES DishType(TypeID)
);
CREATE TABLE orders(
    OrderID INT(20) NOT NULL AUTO_INCREMENT,
    userID INT(20) NOT NULL,
    OrderTime DATETIME,
    DeskID INT,
    OrderState INT,
    OrderComment VARCHAR(50),
    PRIMARY KEY(OrderID),
    FOREIGN KEY(userID) REFERENCES Users(userID)
);
CREATE TABLE OrderInfo(
    OrderInfoID INT(20) NOT NULL AUTO_INCREMENT,
    OrderID INT(20) NOT NULL,
    DishID INT(20) NOT NULL,
    OrderDishTime DATETIME,
    OrderDishNum INT,
    OrderDishState INT,
    PRIMARY KEY(OrderInfoID),
    FOREIGN KEY(OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY(DishID) REFERENCES Menu(DishID)
);
CREATE TABLE Manager(
    ManagerID INT(20) NOT NULL AUTO_INCREMENT,
    ManagerName VARCHAR(50),
    ManagerPassword VARCHAR(50),
    PRIMARY KEY(ManagerID)
);
CREATE TABLE comments(
    CommentID INT(20) NOT NULL AUTO_INCREMENT,
    userID INT(20) NOT NULL,
    OrderInfoID INT(20) NOT NULL,
    CommentContent VARCHAR(200),
    PRIMARY KEY(CommentID),
    FOREIGN KEY(userID) REFERENCES Users(userID),
    FOREIGN KEY(OrderInfoID) REFERENCES OrderInfo(OrderInfoID)
)
