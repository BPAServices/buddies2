CREATE OR REPLACE PROCEDURE eemrt.SP_GET_USERS_BY_ROLE 
(
  P_USERID IN USERS.USERNAME%TYPE,
  P_ROLE IN USERROLE.ROLE%TYPE,
  REC_CURSOR OUT SYS_REFCURSOR
) AS 
BEGIN
  /*
    Created By: SAI ALLU
    Created On: 06/28/2016
    Purpose   : Gets users by role.
  */
  
   SP_INSERT_AUDIT(p_UserId, 'SP_GET_SMALL_BUSINESS_LIST Get all small business types');
   
   OPEN REC_CURSOR FOR 
   SELECT
    U.USERNAME,
    UPPER(FIRSTNAME || ' ' || MIDDLEINITIAL || ' ' || LASTNAME) FULL_NAME
  FROM USERS U JOIN USERROLE UR ON UPPER(U.USERNAME) = UPPER(UR.USERNAME)
  WHERE UPPER(UR.ROLE) = UPPER(P_ROLE)
  ORDER BY FIRSTNAME || ' ' || MIDDLEINITIAL || ' ' || LASTNAME;
  
END SP_GET_USERS_BY_ROLE;
/