This repo contains a script (run_analysis.R) to create a tidy dataset from activity data.  The original dataset, the processing performed to create the tidy dataset and the variables used, are all described in the file Codebook.md.

In order to use the script, do the following:

1. The script expects either a subdirectory (UCI HAR Dataset) with the original dataset, or the zip file (UCI HAR Dataset.zip) with the original data.  The zip file will be unzipped if the subdirectory doesn't exist.

2. In R, change working directory to the directory where either the zip file or the dataset directory is located.  E.g.

   <pre>> setwd("~/Coursera/DataScience")</pre>

3. Then, run the script like this:

   <pre>> source("run_analysis.R")</pre>

4. The data files as described in the codebook will be read and a file tidydata.txt will be written to the current directory.  This resulting tidy dataset is created using dput(), and can be imported using:

   <pre>> means = dget("tidymeans.txt")</pre>

