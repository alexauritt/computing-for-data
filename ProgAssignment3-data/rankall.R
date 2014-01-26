




rankall <- function(outcome, num = "best") {
## Read outcome data
## Check that state and outcome are valid
## For each state, find the hospital of the given rank
## Return a data frame with the hospital names and the
## (abbreviated) state name

  validOutcomes <- c("heart attack", "heart failure", "pneumonia")

  if (!(outcome %in% validOutcomes))
  	stop("invalid outcome")


  if (!(state %in% validStates))
  	stop("invalid state")

  if (outcome == validOutcomes[1])
  	featureNum <- 11
  else if (outcome == validOutcomes[2])
  	featureNum <- 17
  else if (outcome == validOutcomes[3])
  	featureNum <- 23
  else
  	stop("invalid outcome")

    validStates <- c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY")
  
  outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = 'character')
  
  rankhospital <- function(state, outcome, num = "best") {
  	stateOutcomes <- outcomeData[outcomeData$State == state,]
	
  	numbers <- suppressWarnings(as.numeric(stateOutcomes[,featureNum]))
  	bad <- is.na(numbers)

  	good <- subset(stateOutcomes, !bad)
	
  	stateCount <- nrow(good)
  	if (num == 'best')
  		rank <- 1
  	else if (num == 'worst')
  		rank <- stateCount
  	else 
  		rank <- num

  	if (rank > length(stateCount))
  		solution <- 'NA'
		
  	sortedIndices <- order(as.numeric(good[,featureNum]), good[,2])
  	selectedIndex <- sortedIndices[rank]
		
  	good[selectedIndex,]$Hospital.Name
  }
  
  collectedData = data.frame(hospital = rankhospital(validStates[1], outcome, num), state = validStates[1])
  
  for (state in validStates) {
    if (state != validStates[1]) {
      newData = data.frame(hospital = rankhospital(state, outcome, num), state = state)
      collectedData <- rbind(collectedData, newData)
    }
  }
	collectedData
}
