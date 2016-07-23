CREATE OR REPLACE PROCEDURE eemrt.SP_GET_COR_CONTRACT_LIST(
    p_UserId VARCHAR2 DEFAULT NULL, 	
    REC_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
  SP_INSERT_AUDIT(p_UserId, 'SP_GET_COR_CONTRACT_LIST Get COR contracts for processing');
  
     OPEN REC_CURSOR FOR 
      SELECT 
        C.CONTRACT_NUMBER,
        COALESCE(U.FIRSTNAME,'') || ' ' || COALESCE(U.MIDDLEINITIAL,'') || ' ' || COALESCE(U.LASTNAME,'') FULL_NAME,
        U.ROUTINGSYMBOL,
        U.EMAIL,
        U.PHONE,
        C.CREATED_BY,
        TO_CHAR(C.CREATED_ON,'DD-MON-YYYY') CREATED_ON, 
        C.STATUS
      FROM CONTRACT C
      JOIN USERS U ON UPPER(U.USERNAME) = UPPER(C.CREATED_BY)
      JOIN USERROLE UR ON UPPER(U.USERNAME) = UPPER(UR.USERNAME);
     -- WHERE UPPER(C.STATUS) = 'PENDING'; 
      --WHERE UR.ROLE = 'COR';
      
      EXCEPTION WHEN OTHERS THEN 
        SP_INSERT_AUDIT(p_UserId, 'Error SP_GET_COR_CONTRACTS Get COR CONTRACTS: ' || SQLERRM);
        
End  SP_GET_COR_CONTRACT_LIST;
/