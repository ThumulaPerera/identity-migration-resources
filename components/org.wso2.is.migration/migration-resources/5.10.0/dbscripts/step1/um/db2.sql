CREATE TABLE UM_UUID_DOMAIN_MAPPER
(
    UM_ID        INTEGER      NOT NULL,
    UM_USER_ID   VARCHAR(255) NOT NULL,
    UM_DOMAIN_ID INTEGER      NOT NULL,
    UM_TENANT_ID INTEGER DEFAULT 0,
    PRIMARY KEY (UM_ID),
    UNIQUE (UM_USER_ID),
    FOREIGN KEY (UM_DOMAIN_ID, UM_TENANT_ID) REFERENCES UM_DOMAIN (UM_DOMAIN_ID, UM_TENANT_ID) ON DELETE CASCADE
)/

CREATE SEQUENCE UM_UUID_DOMAIN_MAPPER_SEQUENCE AS DECIMAL(27, 0)
    INCREMENT BY 1
    START WITH 1
    NO CACHE/

CREATE TRIGGER UMUUID_DOMAIN_MAPPER
    NO CASCADE BEFORE INSERT
    ON UM_UUID_DOMAIN_MAPPER
    REFERENCING NEW AS NEW
    FOR EACH ROW MODE DB2SQL
BEGIN
    ATOMIC
    SET (NEW.UM_ID)
        = (NEXTVAL FOR UM_UUID_DOMAIN_MAPPER_SEQUENCE);
END/

CREATE INDEX UUID_DM_UID_TID ON UM_UUID_DOMAIN_MAPPER (UM_USER_ID, UM_TENANT_ID)/
