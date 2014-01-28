count <- function(cause = NULL) {
## Check that "cause" is non-NULL; else throw error
## Check that specific "cause" is allowed; else throw error
## Read "homicides.txt" data file
## Extract causes of death
## Return integer containing count of homicides for that cause
  if (!isValidCause(cause))
    stop("invalid cause")

  homicides <- readLines("homicides.txt")
  length(grep(getRegex(cause), homicides))
}

isValidCause <- function(cause) {
  ## checks that specified string is a valid cause. caps are disregarded
  validCauses <- c("asphyxiation", "blunt force", "other", "shooting", "stabbing", "unknown")
  tolower(cause) %in% validCauses
}

getRegex <-function(cause) {
  cas <- tolower(cause)
  if (cas == "asphyxiation")
    "[Cc]ause: [Aa]sphyxiation"
  else if (cas == 'blunt force')
    "[Cc]ause: [Bb]lunt [Ff]orce"
  else if (cas == 'other')
    "[Cc]ause: [Oo]ther"
  else if (cas == 'shooting')
    "[Cc]ause: [Ss]hooting"
  else if (cas == 'stabbing')
    "[Cc]ause: [Ss]tabbing"
  else if (cas == 'unknown')
    "[Cc]ause: [Uu]nknown"
}
