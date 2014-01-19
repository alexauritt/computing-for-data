getmonitor <- function(id, directory, summarize = FALSE) {
        ## 'id' is a vector of length 1 indicating the monitor ID
        ## number. The user can specify 'id' as either an integer, a
        ## character, or a numeric.
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'summarize' is a logical indicating whether a summary of
        ## the data should be printed to the console; the default is
        ## FALSE
        
        ## Your code here
        location <- paste(directory, padIntegerString(id), sep="/")
        with_ext <- paste(location, ".csv", sep="")

        data <- read.csv(with_ext)
        
        if (summarize)
          print(data)
          
        data
}

padIntegerString <- function(id) {
  padString <- ''
  if (nchar(id) == 1)
    padString <- '00'
  else if (nchar(id) == 2)
    padString <- '0'
  paste(padString, as.character(id), sep='')
}