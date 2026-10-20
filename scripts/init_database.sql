/*
====================================================================================
Create Database and schemas
====================================================================================
Script Purpose :
	This script will create the 'DataWarehouse' database and following Schema:
	'bronze', 'silver', 'gold'
Warning :
	if you rerun this script it will delete the existing warehouse with all dasta inside it.
*/

USE MASTER;
GO
-- Checking if the 'DataWarehouse' database exists. If yes delete it
IF EXISTS (SELECT 1 FROM sys.databases WHERE NAME = 'DataWarehouse')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse
END;
-- Creating database 
CREATE DATABASE	DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas inside 'DataWarehouse' database
CREATE SCHEMA bronze
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
