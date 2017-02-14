create user saibot_finance identified by saibot_finance default tablespace users temporary tablespace temp;
alter user saibot_finance quota unlimited on users;
grant create session to saibot_finance;
grant create type to saibot_finance;
grant aq_administrator_role to saibot_finance;
EXECUTE dbms_aqadm.grant_type_access('saibot_finance');