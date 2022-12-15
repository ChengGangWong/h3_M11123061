/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
DECLARE @TABLE1 table (cmd nvarchar(max))
insert into @TABLE1
SELECT  'INSERT INTO [Data_Mining].[osi].[online_shoppers_intention_data] VALUES ('''+[Administrative]+''','
      +''''+[Administrative_Duration]+''','
       +''''+[Informational]+''','
       +''''+[Informational_Duration]+''','
       +''''+[ProductRelated]+''','
       +''''+[ProductRelated_Duration]+''','
       +''''+[BounceRates]+''','
       +''''+[ExitRates]+''','
       +''''+[PageValues]+''','
       +''''+[SpecialDay]+''','
       +''''+[Month]+''','
       +''''+[OperatingSystems]+''','
       +''''+[Browser]+''','
       +''''+[Region]+''','
       +''''+[TrafficType]+''','
       +case [VisitorType] when 'New_Visitor' then '1,0,0'
	   when 'Returning_Visitor' then '0,1,0'
	    when 'Other' then '0,0,1' end
	   +','
       +''''+ case [Weekend] when 'FALSE' THEN '0' WHEN 'TRUE' THEN '1' END+''','
       +''''+case [Revenue] when 'FALSE' THEN '0' WHEN 'TRUE' THEN '1' END +''')'
  FROM [Data_Mining].[osi].[online_shoppers_intention]

  DECLARE @TABLE2 table (idx int,cmd nvarchar(max))
  insert into @TABLE2
  select ROW_NUMBER() over(order by cmd),cmd from @TABLE1

  DECLARE @MIN INT=(SELECT MIN(idx) FROM @TABLE2)
  DECLARE @MAX INT=(SELECT MAX(idx) FROM @TABLE2)
  WHILE(@MIN<=@MAX)
  BEGIN
	DECLARE @CMDsTR NVARCHAR(MAX)='';
	SELECT @CMDsTR=CMD FROM @TABLE2 WHERE IDX=@MIN
	DECLARE @ALLCMD NVARCHAR(MAX)='';
	EXEC sp_executesql  @CMDsTR
	SET @MIN=@MIN+1;
  END
  SELECT * FROM [Data_Mining].[osi].[online_shoppers_intention_data]


  
