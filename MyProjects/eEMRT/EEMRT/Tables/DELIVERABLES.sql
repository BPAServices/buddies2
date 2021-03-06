CREATE TABLE eemrt.deliverables (
  deliverable_id NUMBER NOT NULL,
  deliverable_number VARCHAR2(200 BYTE),
  deliverable_type VARCHAR2(200 BYTE),
  deliverable_title VARCHAR2(1000 BYTE),
  due_date DATE,
  acceptance_criteria VARCHAR2(2000 BYTE) NOT NULL,
  technical_reviewer VARCHAR2(2000 BYTE),
  deliverable_status VARCHAR2(200 BYTE),
  instructions VARCHAR2(2000 BYTE),
  work_orders_id NUMBER,
  sub_tasks_id NUMBER,
  contract_number VARCHAR2(200 BYTE),
  vendor VARCHAR2(200 BYTE),
  co_name VARCHAR2(200 BYTE),
  cor_name VARCHAR2(200 BYTE),
  created_by VARCHAR2(50 BYTE),
  created_on TIMESTAMP,
  updated_by VARCHAR2(50 BYTE),
  updated_on TIMESTAMP,
  due_date_frequncy VARCHAR2(1000 BYTE),
  fyi_notification VARCHAR2(2000 BYTE),
  technical_reviewer_id VARCHAR2(2000 BYTE),
  co_id VARCHAR2(2000 BYTE),
  cor_id VARCHAR2(2000 BYTE),
  task_info VARCHAR2(2000 BYTE),
  CONSTRAINT deliverables_pk PRIMARY KEY (deliverable_id)
);