source('getmonitor.R')

complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        stuff <- data.frame(id, 'smelly')

        completeCount = c(length(id))
        
        index = 1
        for (i in id) {
          curData <- getmonitor(i, directory)
          completeCount[index] = completeObservationCount(curData)
          index <- index + 1
        }

        data.frame(id, 'nobs' = completeCount)
}

completeObservationCount <- function(data) {
  sulfateTaken <- subset(data, sulfate != 'NA')
  completeRows <- subset(sulfateTaken, nitrate != 'NA')
  nrow(completeRows)
}