-- Add first user which will be the main admin
INSERT INTO AppUser(Username, UserSurname, Email, PhoneNumber,HashedPassword, Gender, Race, DOB)
	VALUES ('Sally', 'Mashavave', 'admin@radiantbeauty.com', '0835100072','$2a$11$05w1rXdPOOoEpBPkFU/S9uuX7uB6jCJbqqPY/ZgxJOrfUxV9CVHlq', 'FEMALE', 'BLACK', '2003-01-17');
	  --HASHED password (PLAIN TEXT FORM=Sally@gmail.com)
INSERT INTO Administrator(AdminID, Role)
	VALUES (2, 'Main Admin');

UPDATE AppUser SET IsVerified = 1 WHERE UserID = 2;

-- Queries to add ALL the skin conditions
INSERT INTO SkinCondition(ConditionType)
	VALUES ('ACNE'),
		   ('ALLERGIC-REACTION'),
	       ('CHICKEN-POX'),
		   ('WRINKLING'),
		   ('ECZEMA'),
		   ('OILY-SKIN');
