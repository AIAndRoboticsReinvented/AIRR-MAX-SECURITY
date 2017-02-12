--- Switch to the master database
use master
go
--- Determine if the security database exists.
if not exists (Select * from sysdatabases where name = 'AIRR.MAX.SECURITY')
begin
  --- If the database does not exist then create the security database.
  create database [AIRR.MAX.SECURITY]
end
go
--- Switch to the security database.
use [AIRR.MAX.SECURITY]
go
--- The Users table is used to store the username and password of the user.
create table Users (
  UserGUID uniqueidentifier not null default newid(),       --- A uniqueidentifier for the user.
  UserName nvarchar(50) default '',                         --- The user name that the user logs in with
  EMail nvarchar(250) default '',                           --- The email address where the user can be contacted.
  Password varbinary(250),                                  --- The password that the user enters to access the system
  State numeric not null default 0,                         --- 0 - Inactive Account, 1 - Active Account 
  Created datetime not null default getdate(),              --- The date the account was created.
  LastAccess datetime null,                                 --- The last date the account was used.
  Expires datetime null)                                    --- The date that the user password expires.
go
---
