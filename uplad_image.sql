/*================ Create Directory and and Grant :======*/
grant execute on utl_file to emp;
CREATE OR REPLACE DIRECTORY DIRECTORY_NAME AS 'C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\emp';
GRANT read, write ON DIRECTORY emp TO emp;
/*=============== Create Procedure In Database :=========*/
CREATE OR REPLACE PROCEDURE blob_to_file (p_blob      IN OUT NOCOPY BLOB,
                                          p_dir       IN  VARCHAR2,
                                          p_filename  IN  VARCHAR2)
AS
  l_file      UTL_FILE.FILE_TYPE;
  l_buffer    RAW(32767);
  l_amount    BINARY_INTEGER := 32767;
  l_pos       INTEGER := 1;
  l_blob_len  INTEGER;
BEGIN
  l_blob_len := DBMS_LOB.getlength(p_blob);
  -- Open the destination file.
  l_file := UTL_FILE.fopen(p_dir, p_filename,'WB', 32767);
  -- Read chunks of the BLOB and write them to the file until complete.
  WHILE l_pos <= l_blob_len LOOP
    DBMS_LOB.read(p_blob, l_amount, l_pos, l_buffer);
    UTL_FILE.put_raw(l_file, l_buffer, TRUE);
    l_pos := l_pos + l_amount;
  END LOOP;
  -- Close the file.
  UTL_FILE.fclose(l_file);
EXCEPTION
  WHEN OTHERS THEN
   -- Close the file if something goes wrong.
    IF UTL_FILE.is_open(l_file) THEN
      UTL_FILE.fclose(l_file);
    END IF;
    RAISE;

UTL_FILE.fclose(l_file);
 RAISE;*/
END blob_to_file;
/

/*============Create Table============*/

CREATE TABLE PRODUCT_INFO
(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(50),
    dep_no NUMBER,
    

);




