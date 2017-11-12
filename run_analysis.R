# Load dplyr
library(dplyr)

# Get list of activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("Activity.Code","Activity.Name")

# Make unique column names
features <- read.table("UCI HAR Dataset/features.txt")
feat_names <- make.names(names = features$V2, unique = TRUE)

# Load test dataset
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")

# Add activity column to test_data
test_data <- mutate(test_data, Activity = test_labels$V1)

# Create factor for test dataset and activity labels
test_data$Activity <- as.factor(test_data$Activity)

# Load train dataset
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")

# Add activity column to test_data
train_data <- mutate(train_data, Activity = train_labels$V1)

# Create factor for test dataset and activity labels
train_data$Activity <- as.factor(train_data$Activity)

# make final dataset
dataset <- bind_rows(test_data,train_data)
levels(dataset$Activity) <- activities$Activity.Name
names(dataset) <- c(feat_names, "Activity")

meanSet <- select(dataset,contains("mean"))
stdSet <- select(dataset, contains("std"))
actSet <- dataset$Activity
dataset <- bind_cols(meanSet, stdSet, data.frame(Activity=actSet))

act_dataset <- aggregate(dataset[1:86],dataset[87],mean)
