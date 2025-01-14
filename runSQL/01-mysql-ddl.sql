
CREATE TABLE ENCRYPTED_TRANSACTION (ENCODED_PAYLOAD BLOB NOT NULL, PAYLOAD_CODEC VARCHAR(50), HASH VARBINARY(100) NOT NULL, TIMESTAMP BIGINT, PRIMARY KEY (HASH));
CREATE TABLE ENCRYPTED_RAW_TRANSACTION (ENCRYPTED_KEY BLOB NOT NULL, ENCRYPTED_PAYLOAD BLOB NOT NULL, NONCE BLOB NOT NULL, SENDER BLOB NOT NULL, TIMESTAMP BIGINT, HASH VARBINARY(100) NOT NULL, PRIMARY KEY (HASH));
CREATE TABLE PRIVACY_GROUP(ID VARBINARY(100) NOT NULL, LOOKUP_ID BLOB NOT NULL, DATA BLOB NOT NULL, TIMESTAMP BIGINT, PRIMARY KEY (ID));
CREATE TABLE ST_TRANSACTION(ID BIGINT(19) NOT NULL, PAYLOAD_CODEC VARCHAR(50), HASH VARCHAR(100) NOT NULL, PAYLOAD BLOB, PRIVACY_MODE BIGINT(10), TIMESTAMP BIGINT(19), VALIDATION_STAGE BIGINT(19), PRIMARY KEY (ID));
CREATE TABLE ST_AFFECTED_TRANSACTION(ID BIGINT(19) NOT NULL, AFFECTED_HASH VARCHAR(100) NOT NULL, TXN_ID BIGINT(19) NOT NULL, CONSTRAINT FK_ST_AFFECTED_TRANSACTION_TXN_ID FOREIGN KEY (TXN_ID) REFERENCES ST_TRANSACTION(ID), PRIMARY KEY (ID));
ALTER TABLE ST_TRANSACTION ADD INDEX ST_TRANSACTION_VALSTG (VALIDATION_STAGE);