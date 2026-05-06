/*
===============================================================================
Script Name: init_database.sql
Purpose:
    This script creates a new database named data_warehouse.
    If the database already exists, it will be dropped and recreated.

    The script also creates three schemas:
        - bronze
        - silver
        - gold

WARNING:
    Running this script will delete the existing data_warehouse database
    if it already exists. All data inside the database will be permanently lost.

Author:
    Your Name

Created:
    2026-05-06
===============================================================================
*/

USE master;
GO

IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'data_warehouse'
)
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
