--##############################################################################
--
-- SAMPLE SCRIPTS TO ACCOMPANY "SQL SERVER 2017 ADMINISTRATION INSIDE OUT"
--
-- © 2018 MICROSOFT PRESS
--
--##############################################################################
--
-- CHAPTER 8: UNDERSTANDING AND DESIGNING TABLES
-- EXTRA T-SQL SAMPLE 3
--

-- Assumes the existence of a sample database (no prerequisites)
CREATE TABLE CT (
	Id INT IDENTITY (1, 1),
	Val VARCHAR(20) NULL,
	CONSTRAINT PK_CT PRIMARY KEY CLUSTERED (Id)
);

ALTER TABLE CT
	ADD CONSTRAINT IX_Val_U UNIQUE (Val);

INSERT INTO CT VALUES ('Val 1'), ('Val 2');
-- Fails due to CONSTRAINT
INSERT INTO CT VALUES ('Val 2');
INSERT INTO CT VALUES (NULL);

-- Fails due to CONSTRAINT
INSERT INTO CT VALUES (NULL);

ALTER TABLE CT
	DROP CONSTRAINT IX_Val_U;

ALTER TABLE CT
	ADD CONSTRAINT IX_ID_Val_U UNIQUE (Id, Val);

CREATE UNIQUE INDEX UX_Val ON CT (Val) WHERE Val IS NOT NULL;

SELECT * FROM CT;

CREATE TABLE CTChild (
	Id INT IDENTITY (100, 1) PRIMARY KEY CLUSTERED,
	ParentVal VARCHAR(20),
	CONSTRAINT FK_CTChild_CT FOREIGN KEY (ParentVal) REFERENCES CT (Val));

TRUNCATE TALBE CTChild;
DELETE FROM CT;

DROP TABLE CTChild;
DROP TABLE CT;
