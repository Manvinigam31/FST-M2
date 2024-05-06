-- Load input files from HDFS
inputFile1 = LOAD 'hdfs:///user/manvi/inputs/episodeIV_dialogues.txt' USING PigStorage('\t') AS (Character:chararray, line:chararray);
inputFile2 = LOAD 'hdfs:///user/manvi/inputs/episodeV_dialogues.txt' USING PigStorage('\t') AS (Character:chararray, line:chararray);
inputFile3 = LOAD 'hdfs:///user/manvi/inputs/episodeVI_dialogues.txt' USING PigStorage('\t') AS (Character:chararray, line:chararray);


---Filter out the first 2 lines from each file
ranked4 = RANK inputFile1;
OnlyDialogues4 = FILTER ranked4 BY (rank_inputFile1 > 2);
ranked5 = RANK inputFile2;
OnlyDialogues5 = FILTER ranked5 BY (rank_inputFile2 > 2);
ranked6 = RANK iinputFile3;
OnlyDialogues6 FILTER ranked6 BY (rank_inputFile3> 2);

-- Step 2: Combine all data using UNION
combinedfile = UNION OnlyDialogues4, OnlyDialogues5, OnlyDialogues5;

-- Step 3: Group data by actor and count the lines spoken by each actor
lines = FOREACH (GROUP combined_data BY Character) GENERATE group AS Character, COUNT(combinedfile) AS lines_spoken;

-- Step 4: Order the results by the number of lines spoken in descending order
Descendingorder = ORDER lines BY lines_spoken DESC;

-- Store the result in HDFS
STORE cntd INTO 'hdfs:///user/manvi/ProjectPigOutput1';