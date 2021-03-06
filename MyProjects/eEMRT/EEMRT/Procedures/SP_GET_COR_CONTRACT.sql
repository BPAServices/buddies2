CREATE OR REPLACE PROCEDURE eemrt.SP_GET_COR_CONTRACT(
    p_UserId VARCHAR2 DEFAULT NULL,
    p_UserName Users.USERNAME%TYPE,
    p_Contract_Number Contract.CONTRACT_NUMBER%TYPE,
    REC_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
  SP_INSERT_AUDIT(p_UserId, 'SP_GET_COR_CONTRACT Get COR contract for processing');
  
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
      JOIN USERS U ON U.USERNAME = C.CREATED_BY
      JOIN USERROLE UR ON U.USERNAME = UR.USERNAME
      WHERE LOWER(C.CREATED_BY) = LOWER(p_UserName) AND LOWER(C.CONTRACT_NUMBER) = LOWER(p_Contract_Number);
      
      EXCEPTION WHEN OTHERS THEN 
        SP_INSERT_AUDIT(p_UserId, 'Error SP_GET_COR_CONTRACTS Get COR CONTRACTS: ' || SQLERRM);
        
End  SP_GET_COR_CONTRACT;
/