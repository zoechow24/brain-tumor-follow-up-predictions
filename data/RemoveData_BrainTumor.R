# Load Data
url <- "https://storage.googleapis.com/kagglesdsdata/datasets/6816800/10957640/brain_tumor_dataset.csv?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=gcp-kaggle-com%40kaggle-161607.iam.gserviceaccount.com%2F20250728%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20250728T010515Z&X-Goog-Expires=259200&X-Goog-SignedHeaders=host&X-Goog-Signature=146063d3970999549dc0272f364470c949549717a7792c34e5e67199d5c224b01bfd79b18ee1dc02e69e0b2a26e72a1f10abbd7af9044b8af476beaa901b73d7aebb0358ae05bfcc802bb37cf15aa4d863c07eed1c50fe6f14f73ff30470195542911a5940ca2726a672493ab21d9b29aa03f39c5dff784f5bdec401629b4b6addf354f9d069f27ea227f4a552930144c52dcd82e2bca706b97000c86088706794f786ebe8c7b6d3cde8df1064c166a7967413850f6d3edd27b619318d964c078f38aa4e9331ae8dd45874c319ede50dc568caa699d5d718b59c05b453784f822ea193588486739a77a1edb65b789c59eb52c3ca2a4e4759d66000e6104fd119"
df <- read.csv(url)

colSums(is.na(df))

set.seed(2025)
NA_df <- df

# Total cells to remove = 8% of number of rows
cols <- c("Tumor_Size", "Symptom_3", "Survival_Rate")
n_total_missing <- round(0.08 * nrow(df))  # e.g., 1600

# Randomly generate row/column pairs
row_indices <- sample(1:nrow(df), n_total_missing, replace = TRUE)
col_indices <- sample(cols, n_total_missing, replace = TRUE)

# Apply NA values
for (i in seq_len(n_total_missing)) {
  NA_df[row_indices[i], col_indices[i]] <- NA
}

# Check how many NA values in each column
colSums(is.na(NA_df))

write.csv(NA_df, "brain_tumor_dataset_with_missing.csv", row.names = FALSE)

