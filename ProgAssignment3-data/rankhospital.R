rankhospital <- function(state, outcome, num = "best") {
## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with the given rank
## 30-day death rate

	validOutcomes <- c("heart attack", "heart failure", "pneumonia")

	if (!(outcome %in% validOutcomes))
		stop("invalid outcome")

	validStates <- c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY", "GU")

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
		
	outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = 'character')
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
	
##	print(good[,featureNum])
##	print(sortedIndices)
##	print(selectedIndex)
	

	good[selectedIndex,]$Hospital.Name
}
