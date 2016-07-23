CREATE OR REPLACE PROCEDURE eemrt.SP_RUN_CONTRACT_JOBS(
    p_PStatus OUT VARCHAR2)
IS
BEGIN
  SP_INSERT_AUDIT('SYS', 'Begin of SP_RUN_CONTRACT_JOBS ' || sysdate() );
  
  P_insert_prism_info_in_stage(P_PSTATUS => P_PSTATUS);
  SP_UPDATE_AWDBYR(P_PSTATUS => P_PSTATUS);
   p_update_value_Added_fields;
  UPDATE_CONTRACT_AMOUNTS( P_PSTATUS => P_PSTATUS   ); 
  SP_MERGE_STAGE2_DETAIL( P_PSTATUS => P_PSTATUS   );
  
 
  SP_INSERT_AUDIT('SYS', 'End of SP_RUN_CONTRACT_JOBS ' || sysdate() );
EXCEPTION
WHEN OTHERS THEN
  p_PStatus := 'ERROR:' || SQLERRM;
  ROLLBACK;
END SP_RUN_CONTRACT_JOBS;
/