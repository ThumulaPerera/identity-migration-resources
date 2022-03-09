CREATE OR REPLACE PROCEDURE ALTER_IDN_OAUTH2_DEVICE_FLOW
BEGIN ATOMIC
    IF EXISTS(SELECT * FROM SYSCAT.TABLES WHERE TABNAME='IDN_OAUTH2_DEVICE_FLOW')
    THEN
        IF NOT EXISTS(SELECT * FROM SYSCAT.COLUMNS WHERE TABNAME='IDN_OAUTH2_DEVICE_FLOW' AND COLNAME='QUANTIFIER')
        THEN
            BEGIN
                DECLARE const_name VARCHAR(128);
                DECLARE STMT VARCHAR(200);
                SELECT INDNAME into const_name from SYSCAT.INDEXES WHERE TABNAME='IDN_OAUTH2_DEVICE_FLOW' AND COLNAMES='+USER_CODE';
                SET STMT = 'ALTER TABLE IDN_OAUTH2_DEVICE_FLOW DROP CONSTRAINT ' ||  const_name;
                PREPARE S1 FROM STMT;
                EXECUTE S1;
            END;
            EXECUTE IMMEDIATE 'ALTER TABLE IDN_OAUTH2_DEVICE_FLOW ADD COLUMN QUANTIFIER INTEGER DEFAULT 0 NOT NULL';
            EXECUTE IMMEDIATE 'ALTER TABLE IDN_OAUTH2_DEVICE_FLOW ADD CONSTRAINT USRCDE_QNTFR_CONSTRAINT UNIQUE (USER_CODE, QUANTIFIER)';
        END IF;
    END IF;
END
/

CALL ALTER_IDN_OAUTH2_DEVICE_FLOW
/

DROP PROCEDURE ALTER_IDN_OAUTH2_DEVICE_FLOW
/
