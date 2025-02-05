--DROP PROCEDURE UpdateWatermarkTable

CREATE PROCEDURE UpdateWatermarkTable
 @lastload Varchar(200) --to pass this info to ADF
AS
BEGIN
  --start the transaction
  BEGIN TRANSACTION;

  --update the incremental column in the table
  UPDATE watermark_table
  SET last_data_load = @lastload
  COMMIT TRANSACTION;
  END;
