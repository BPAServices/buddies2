CREATE TABLE eemrt.pop_clin (
  clin_id NUMBER NOT NULL,
  period_of_performance_id NUMBER,
  clin_number VARCHAR2(20 BYTE),
  clin_type VARCHAR2(100 BYTE),
  clin_sub_clin VARCHAR2(6 BYTE),
  clin_title VARCHAR2(200 BYTE),
  clin_hours NUMBER,
  clin_rate NUMBER(18,2),
  clin_amount NUMBER(18,2),
  hours_commited NUMBER,
  created_by VARCHAR2(50 BYTE) DEFAULT 'SYS',
  created_on TIMESTAMP DEFAULT SYSDATE,
  last_modified_by VARCHAR2(50 BYTE),
  last_modified_on TIMESTAMP,
  labor_category_id NUMBER,
  haslaborcategories VARCHAR2(3 BYTE),
  labor_rate_type VARCHAR2(20 BYTE),
  rate_type VARCHAR2(20 BYTE),
  CONSTRAINT pop_clin_uk1 UNIQUE (clin_number,period_of_performance_id),
  PRIMARY KEY (clin_id),
  CONSTRAINT fk_pop_clin FOREIGN KEY (period_of_performance_id) REFERENCES eemrt.period_of_performance (period_of_performance_id)
);