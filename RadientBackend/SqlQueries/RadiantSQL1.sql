CREATE TABLE UserAddress(
	AddressID				INT					IDENTITY(1,1),
	AddressType				VARCHAR(10)     	NOT NULL CHECK (AddressType IN ('SHIPPING', 'BILLING')),
	StreetLine1				VARCHAR(MAX)		NOT NULL,
	StreetLine2				VARCHAR(MAX),
	City					VARCHAR(MAX)		NOT NULL,
	StateOrProvince			VARCHAR(MAX)		NOT NULL,
	PostalCode				VARCHAR(10)			NOT NULL,
	Country					VARCHAR(MAX)		NOT NULL,
	PRIMARY KEY (AddressID)
);

CREATE TABLE AppUser(
	UserID					INT					IDENTITY(1,1),
	UserName				VARCHAR(150)		NOT NULL,
	UserSurname				VARCHAR(150)		NOT NULL,
	Email					VARCHAR(255)		NOT NULL		UNIQUE,
	PhoneNumber				CHAR(10)			NOT NULL		UNIQUE,
	HashedPassword			VARCHAR(MAX)		NOT NULL,
	Gender					VARCHAR(10)     	NOT NULL CHECK (Gender IN ('MALE', 'FEMALE', 'OTHER')),
	Race					VARCHAR(20)			NOT NULL CHECK (Race IN
							('BLACK', 'WHITE', 'INDIAN', 'COLOURED', 'OTHER')),
	DOB						DATETIME			NOT NULL,
	BillingAddressID		INT,
	ShippingAddressID		INT,
	DateCreated				DATETIME			NOT NULL 		DEFAULT CURRENT_TIMESTAMP,
	IsVerified				BIT					DEFAULT	0,
	VerificationToken		VARCHAR(64)			NULL,
	VerificationExpiry		DATETIME			NULL,
	ResetToken				VARCHAR(64)			NULL,
	ResetTokenExpiry		DATETIME			NULL,
	PRIMARY KEY (UserID),
	FOREIGN KEY (BillingAddressID)				REFERENCES		UserAddress (AddressID),
	FOREIGN KEY (ShippingAddressID)				REFERENCES		UserAddress (AddressID)
);

CREATE TABLE Administrator(
	AdminID					INT					NOT NULL,
	Role					VARCHAR(50)			NOT NULL,
	DateAppointed			DATETIME			NOT NULL		DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (AdminID),
	FOREIGN KEY (AdminID)						REFERENCES		AppUser(UserID)
);

CREATE TABLE SkinCondition(
	ConditionID				INT					IDENTITY(1,1),
	ConditionType			VARCHAR(30)     	NOT NULL UNIQUE CHECK (ConditionType IN
							('ALLERGIC-REACTION', 'ECZEMA', 'ACNE', 'CHICKEN-POX', 'WRINKLING', 'DRY-SKIN', 'OILY-SKIN')),
	PRIMARY KEY (ConditionID)
);

CREATE TABLE CustomerSkinCondition(
	CustomerID				INT					NOT NULL,
	ConditionID				INT					NOT NULL,
	PRIMARY KEY (CustomerID, ConditionID),
	FOREIGN KEY (CustomerID)					REFERENCES		AppUser (UserID),
	FOREIGN KEY (ConditionID)					REFERENCES		SkinCondition (ConditionID)
);

CREATE TABLE BeautyProduct(
	ProductID				INT					IDENTITY(1,1),
	ProductName				VARCHAR(100)		NOT NULL,
	ProductDescription		VARCHAR(MAX)		NOT NULL,
	ProductType				VARCHAR(20)     	NOT NULL CHECK (ProductType IN
							('CLEANSER', 'MOISTURIZER', 'SUNSCREEN', 'EXFOLIATOR', 'SERUM', 'OTHER')),
	Price					DECIMAL(10,2)		NOT NULL CHECK (Price >= 0),
	DateAdded				DATETIME			NOT NULL 		DEFAULT CURRENT_TIMESTAMP,
	StockQuantity			INT					NOT NULL,
	ImagePath				VARCHAR(255)		NOT NULL,
	PRIMARY KEY (ProductID)
);

CREATE TABLE BundlePackage (
    BundleID            	INT             	IDENTITY(1,1),
    BundleName          	VARCHAR(100)    	NOT NULL,
    BundleDescription   	VARCHAR(MAX)    	NULL,
    BundlePrice         	DECIMAL(10,2)  	 	NOT NULL CHECK (BundlePrice >= 0),
    DateAdded           	DATETIME        	NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (BundleID)
);
 
CREATE TABLE BundleItem (
    BundleID    			INT     			NOT NULL,
    ProductID   			INT     			NOT NULL,
    Quantity    			INT     			NOT NULL DEFAULT 1 CHECK (Quantity > 0),
    PRIMARY KEY (BundleID, ProductID),
    FOREIGN KEY (BundleID) 						REFERENCES BundlePackage(BundleID),
    FOREIGN KEY (ProductID) 					REFERENCES BeautyProduct(ProductID)
);

CREATE TABLE CustomerOrder (
	OrderID					INT					IDENTITY(1,1),
	CustomerID				INT					NOT NULL,
	ShippingAddressID		INT					NOT NULL,
	BillingAddressID		INT					NOT NULL,
	DateOrdered				DATETIME			NOT NULL		DEFAULT CURRENT_TIMESTAMP,
	OrderStatus         	VARCHAR(20)     	NOT NULL DEFAULT 'PENDING' CHECK (OrderStatus IN
                            ('PENDING', 'PROCESSING', 'SHIPPED', 'DELIVERED', 'CANCELLED')),
	TotalAmount         	DECIMAL(10,2)   	NOT NULL CHECK (TotalAmount >= 0),
	PRIMARY KEY (OrderID),
	FOREIGN KEY (CustomerID)					REFERENCES		AppUser (UserID)
);

CREATE TABLE OrderItem(
	ItemID					INT					IDENTITY(1,1),
	OrderID					INT					NOT NULL,
	ProductID				INT					NOT NULL,
	ProductQuantity			INT					NOT NULL,
	UnitPrice       		DECIMAL(10,2)		NOT NULL CHECK (UnitPrice >= 0),
	PRIMARY KEY (ItemID), 
	FOREIGN KEY (OrderID)						REFERENCES		CustomerOrder (OrderID),
	FOREIGN KEY (ProductID)						REFERENCES		BeautyProduct (ProductID),
    --CONSTRAINT  OneItemInOrder 				UNIQUE (OrderID, ProductID)
);

-- At most one standalone line per product, per order (buying more of the same product
--CREATE UNIQUE INDEX UQ_OrderItem_StandaloneProduct ON OrderItem(OrderID, ProductID) WHERE BundleID IS NULL;

--CREATE UNIQUE INDEX UQ_OrderItem_BundleProduct ON OrderItem(OrderID, ProductID, BundleID) WHERE BundleID IS NOT NULL;

CREATE TABLE REVIEW(
	ReviewID				INT					IDENTITY(1,1),
	ProductID				INT					NOT NULL,
	CustomerID				INT					NOT NULL,
	ReviewText				VARCHAR(MAX)		NOT NULL,
	Rating					INT					NOT NULL		CHECK (Rating BETWEEN 0 AND 5),
	PRIMARY KEY (ReviewID),
	FOREIGN KEY (ProductID)						REFERENCES		BeautyProduct (ProductID),
	FOREIGN KEY (CustomerID)					REFERENCES		AppUser (UserID)
);
