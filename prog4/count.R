count <- function(cause = NULL) {
## Check that "cause" is non-NULL; else throw error
## Check that specific "cause" is allowed; else throw error
## Read "homicides.txt" data file
## Extract causes of death
## Return integer containing count of homicides for that cause
  if (!isValidCause(cause))
    stop("invalid cause")
  6
}

extractCause <- function(textLine) {
  "other"
}

isValidCause <- function(cause) {
  ## checks that specified string is a valid cause. caps are disregarded
  validCauses <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")
  tolower(cause) %in% validCauses
}
