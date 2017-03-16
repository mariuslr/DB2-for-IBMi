--Privileges/Permissions for the IBM DB2 for i  

--Table Grant Priveleges
-- Outputs each pivelege to a row, which you copy and paste into ACS and run it on the system you want to grant the permissions on 
--t2 handles not granting indexes on views
--t3 handles not touching join logicals
SELECT 'GRANT '||t1.PRIVILEGE_TYPE||' ON '||t1.TABLE_SCHEMA||'."'||t1."TABLE_NAME"||'" TO '||GRANTEE||' ;' 
FROM QSYS2.SYSTABAUTH t1
    LEFT JOIN QSYS2.TABLES t2 on t1.TABLE_SCHEMA=t2.TABLE_SCHEMA AND t1."TABLE_NAME"=t2."TABLE_NAME"
    LEFT JOIN QSYS.QADBKFLD t3 on t3.DBKLIB=t1.TABLE_SCHEMA AND t3.DBKFIL=t1."TABLE_NAME" AND t3.DBKPOS=1
WHERE t1.TABLE_SCHEMA='REPLACE_WITH_YOUR_SCHEMA_OR_LIB' AND (t1.PRIVILEGE_TYPE!='INDEX' OR (t1.PRIVILEGE_TYPE='INDEX' AND t2.TABLE_TYPE!='VIEW')) AND (t3.DBKFMT!='JREC' OR t3.DBKFMT is null);


--DB2 for i catalog views (QSYS2)
SELECT * FROM QSYS2.SYSCOLAUTH;
SELECT * FROM QSYS2.SYSPACKAGEAUTH;
SELECT * FROM QSYS2.SYSROUTINEAUTH;
SELECT * FROM QSYS2.SYSSCHEMAAUTH;
SELECT * FROM QSYS2.SYSSEQUENCEAUTH;
SELECT * FROM QSYS2.SYSTABAUTH;
SELECT * FROM QSYS2.SYSUDTAUTH;
SELECT * FROM QSYS2.SYSVARIABLEAUTH;
SELECT * FROM QSYS2.SYSXSROBJECTAUTH;

--ODBC and JDBCTM catalog views (SYSIBM)
SELECT * FROM SQLCOLPRIVILEGES;
SELECT * FROM SQLTABLEPRIVILEGES;

--ANS and ISO catalog views (QSYS2)
SELECT * FROM QSYS2.AUTHORIZATIONS;
SELECT * FROM QSYS2.ROUTINE_PRIVILEGES;
SELECT * FROM QSYS2.UDT_PRIVILEGES;
SELECT * FROM QSYS2.USAGE_PRIVILEGES;
SELECT * FROM QSYS2.VARIABLE_PRIVILEGES;
