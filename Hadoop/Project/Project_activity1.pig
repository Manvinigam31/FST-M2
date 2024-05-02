-- Load input files from HDFS
inputFile1 = LOAD 'hdfs:///user/manvi/inputs/episodeIV_dialogues.txt' USING PigStorage('\t') AS (Character:chararray, line:chararray);
inputFile2 = LOAD 'hdfs:///user/manvi/inputs/episodeV_dialogues.txt' USING PigStorage('\t') AS (Character:chararray, line:chararray);
inputFile3 = LOAD 'hdfs:///user/manvi/inputs/episodeVI_dialogues.txt' USING PigStorage('\t') AS (Character:chararray, line:chararray);

-- Step 2: Combine all data using UNION
combinedfile = UNION inputFile1, inputFile2, CinputFile3;

-- Step 3: Group data by actor and count the lines spoken by each actor
lines = FOREACH (GROUP combined_data BY Character) GENERATE group AS Character, COUNT(combinedfile) AS lines_spoken;

-- Step 4: Order the results by the number of lines spoken in descending order
Descendingorder = ORDER lines BY lines_spoken DESC;

-- Store the result in HDFS
STORE cntd INTO 'hdfs:///user/manvi/ProjectPigOutput1';