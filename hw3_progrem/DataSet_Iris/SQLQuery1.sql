/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
SELECT DISTINCT [Y]
  FROM [iris].[dbo].[iris_y]

UPDATE [iris].[dbo].[iris_y]
  SET Y=CASE Y WHEN 'Iris-setosa' THEN '0' WHEN 'Iris-versicolor' THEN '1' WHEN 'Iris-virginica' THEN '2' ELSE Y END

DELETE [iris].[dbo].[iris_y] WHERE SepalLength=' ' AND  SepalWidth=' ' 

SELECT * FROM [iris].[dbo].[iris_y]
