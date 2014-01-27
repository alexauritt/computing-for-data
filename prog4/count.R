count <- function(cause = NULL) {
## Check that "cause" is non-NULL; else throw error
## Check that specific "cause" is allowed; else throw error
## Read "homicides.txt" data file
## Extract causes of death
## Return integer containing count of homicides for that cause
  if (!isValidCause(cause))
    stop("invalid caused")
  6
}

isValidCause <- function(cause) {
  validCauses <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")
  cause %in% validCauses
}
