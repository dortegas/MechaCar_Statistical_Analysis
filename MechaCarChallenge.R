# Deliverable 1. Linear Regression to Predict MPG
# 3. Load dplyr package
library(tidyverse)
# 4. Import and read the csv file as a dataframe
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)
# 5. Perform linear regresion with the six variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg)
# 6. Using the summary() function, determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg))

# Deliverable 2. Create Visualizations for the Trip Analysis
# 2. Import and read in the Suspension_Coil.csv file as a table.
suspension_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors=F)
# 3. Create a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column
total_summary <- suspension_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
# 4. Group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

# Deliverable 3: T-Tests on Suspension Coils
# 1. Determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch
# randomly sample 30 data points
suspension_sample = suspension_table %>% sample_n(30)
# One-Sample t-Test
# Comparing sample versus suspensions mean
t.test(suspension_sample$PSI,mu=1500)

# 2. Determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
# One-Sample t-Test
# Comparing subsets versus suspensions mean
t.test(subset(suspension_table, Manufacturing_Lot=="Lot1")$PSI,mu=1500)
t.test(subset(suspension_table, Manufacturing_Lot=="Lot2")$PSI,mu=1500)
t.test(subset(suspension_table, Manufacturing_Lot=="Lot3")$PSI,mu=1500)
