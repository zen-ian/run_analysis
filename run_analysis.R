# First, read in the data from the test subjects
X_df <- read.table("./test/X_test.txt")
# Then merge the data from the train subjects
X_df <- rbind(read.table("./train/X_train.txt"))
# Load the cryptic feature names
features <- read.table("./features.txt", stringsAsFactors = FALSE)
# Extract the feature names as a character vector
X_cols <- features[,2]
# Name the columns using the cryptic feature names
colnames(X_df) <- X_cols
#str(X_df)
Y_df <- read.table("./test/y_test.txt")
Y_df <- rbind(read.table("./train/y_train.txt"))
Y_vec <- Y_df[[1]]
Y_fac <- factor(Y_vec,labels = fac_act)
subj_df <- read.table("./test//subject_test.txt")
subj_df <- rbind(read.table("./train//subject_train.txt"))
subj_vec <- subj_df[[1]]
data <- data.frame(subj_vec,Y_fac,X_df)
data_tbl <- tbl_df(data)
data_sel <- select(data_tbl, subj_vec, Y_fac, contains("mean"), contains("std"))

