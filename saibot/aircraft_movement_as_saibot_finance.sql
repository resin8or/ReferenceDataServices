--=== AS SAIBOT_FINANCE


CREATE or replace TYPE aircraft_movement_report_t AS OBJECT (
    message_id     NUMBER(15)
  , movement_timestamp   timestamp
  , flightnumber         number(3)
  , carrier_iata_code    varchar2(3)
  , airport_iata_code    varchar2(3)
  , arrival_or_departure varchar2(1)
  , aircraft_iata_equipment_code      varchar2(3)  
  , number_of_passengers number(4,0)
);



BEGIN
    DBMS_AQADM.CREATE_QUEUE_TABLE (
        queue_table         => 'saibot_finance.aircraft_movements_qt'
      , queue_payload_type  => 'saibot_finance.aircraft_movement_report_t'
    );
    DBMS_AQADM.CREATE_QUEUE (
        queue_name          => 'aircraft_movements_queue'
      , queue_table         => 'saibot_finance.aircraft_movements_qt'
      , queue_type          => DBMS_AQADM.NORMAL_QUEUE
      , max_retries         => 0
      , retry_delay         => 0
      , retention_time      => 1209600
      , dependency_tracking => FALSE
      , comment             => 'Aircraft Movement Reports Queue'
      , auto_commit         => FALSE
    );
    DBMS_AQADM.START_QUEUE('aircraft_movements_queue');
END;