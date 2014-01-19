source('complete.R')

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        
        counts <- complete(directory)

        sufficients <- subset(counts, nobs >= threshold)

        datacor <- function(monitorNum) {
          completeMonitorData <- getcompletemonitor(monitorNum, directory)
          cor(completeMonitorData$sulfate, completeMonitorData$nitrate)
          # print("I have complete data for something")
          # print(class(monitorNum))
          # print(monitorNum)
          # print("\n")
        }

        # print('num 1')
        # print(sufficients[1])        
        # print(sufficients$id)
        sapply(sufficients$id, datacor)

        # cors = integer()
        
        # for (i in sufficients$id)
          # print(i)
          # curData <- getmonitor(i, 'specdata')
          
          # sulfateTaken <- subset(curData, sulfate != 'NA')
          # completeRows <- subset(sulfateTaken, nitrate != 'NA')
          
          ## print(completeRows)
          
          ## print(curData)
          ## correld <- cor(completeRows$nitrate, completeRows$sulfate)
          ## cors <- c(cors, correld)
        # end
        
        # cors
        # 3
        ## cor(sufficients$nitrate, sufficients$sulfate)
}