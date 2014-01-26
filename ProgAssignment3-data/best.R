best <- function(state, outcome) {
## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death
## rate


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
	
	numbers <- as.numeric(stateOutcomes[,featureNum])
	bad <- is.na(numbers)

	good <- subset(stateOutcomes, !bad)
	minVal <- min(as.numeric(good[,featureNum]))
	

	bestHospName <- doit(stateOutcomes, minVal, featureNum)	
	bestHospName
}

doit <- function(data, minVal, colNumber) {
	
	
	goodLogical <- as.numeric(data[,colNumber]) == minVal
	bestHospitals <- subset(data, goodLogical)
	bestNames <- bestHospitals$Hospital.Name
	invisible(min(bestNames))
}


