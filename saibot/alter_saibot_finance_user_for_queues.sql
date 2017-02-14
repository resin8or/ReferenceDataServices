-- this project requires  limited database set up
-- we are assuming a single database schema (typically called SAIBOT_FINANCE ) that has a number of basic privileges granted to it:
-- quota on the default tablespace
-- system privileges to create type
-- as SYS:  grant the aq_administrator_role to user saibot_finance
-- as SYS: EXECUTE dbms_aqadm.grant_type_access('saibot_finance');

--=== AS SYS

--create user saibot_finance identified by saibot_finance default tablespace users temporary tablespace temp;
alter user saibot_finance quota unlimited on users;
grant create session to saibot_finance;
grant create type to saibot_finance;
grant aq_administrator_role to saibot_finance;
EXECUTE dbms_aqadm.grant_type_access('saibot_finance');

-- note: instead of creating a separate account SAITBOT_FINANCE you can also reuse schema SAIBOT, provided of course the additional privileges are granted to this schema


