if (!file.exists("UCI HAR Dataset")) {
    if (!file.exists("UCI HAR Dataset.zip")) {
        stop("was expecting UCI HAR Dataset folder or zip file")
    } else {
        unzip("UCI HAR Dataset.zip")
    }
}

# Read the various data files
print("Reading test data")
test <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses = "numeric", comment.char = "")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
print("Reading training data")
train <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses = "numeric", comment.char = "")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
print("Reading labels")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

colnames(activity_labels) <- c("Activity", "ActivityLabel")
activity_labels$ActivityLabel <- factor(activity_labels$ActivityLabel, levels=activity_labels$ActivityLabel)

# Select columns relating to mean and std
data <- rbind(train, test)
#data <- test
colnames(data) <- features$V2
data <- data[,grep("(mean|std)\\(\\)", colnames(data))]

# Add subject and activity variables
data$Subject <- rbind(subject_train, subject_test)[,"V1"]
data$Activity <- rbind(y_train, y_test)[,"V1"]
data$ActivityLabel <- ""
data$ActivityLabel[data$Activity == 1] <- "WALKING"
data$ActivityLabel[data$Activity == 2] <- "WALKING_UPSTAIRS"
data$ActivityLabel[data$Activity == 3] <- "WALKING_DOWNSTAIRS"
data$ActivityLabel[data$Activity == 4] <- "SITTING"
data$ActivityLabel[data$Activity == 5] <- "STANDING"
data$ActivityLabel[data$Activity == 6] <- "LAYING"
data$ActivityLabel <- as.factor(data$ActivityLabel)

# Clean up variable names
colnames(data) <- gsub("^t", "T", colnames(data))
colnames(data) <- gsub("^f", "F", colnames(data))
colnames(data) <- gsub("mean", "Mean", colnames(data))
colnames(data) <- gsub("std", "Std", colnames(data))
colnames(data) <- gsub("BodyBody", "Body", colnames(data))
colnames(data) <- gsub("(\\(\\)|-)", "", colnames(data))

# Aggregate data
means <- aggregate(data[,1:66], list(Subject = data$Subject, Activity = data$Activity), FUN = mean)
dput(means, "tidymeans.txt")

