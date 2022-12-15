/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
DECLARE @MIN_SL FLOAT,@MAX_SL FLOAT,@MIN_SW FLOAT,@MAX_SW FLOAT,@MIN_PL FLOAT,@MAX_PL FLOAT,@MIN_PW FLOAT,@MAX_PW FLOAT
SELECT	@MIN_SL=MIN([SepalLength])
	   ,@MAX_SL=MAX([SepalLength])
	   ,@MIN_SW=MIN([SepalWidth])
	   ,@MAX_SW=MAX([SepalWidth])
	   ,@MIN_PL=MIN([PetalLength])
	   ,@MAX_PL=MAX([PetalLength])
       ,@MIN_PW=MIN([PetalWidth])
	   ,@MAX_PW=MAX([PetalWidth])
  FROM [Data_Mining].[iris].[Original]

  SELECT ([SepalLength]-@MIN_SL)/(@MAX_SL-@MIN_SL) [SepalLength]
		 ,([SepalWidth]-@MIN_SW)/(@MAX_SW-@MIN_SW) [SepalWidth]
		 ,([PetalLength]-@MIN_PL)/(@MAX_PL-@MIN_PL)[PetalLength]
		 ,([PetalWidth]-@MIN_PW)/(@MAX_PW-@MIN_PW)[PetalWidth]
  FROM [Data_Mining].[iris].[Original]