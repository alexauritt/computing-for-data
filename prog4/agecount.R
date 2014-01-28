agecount <- function(age = NULL) {
## Check that "age" is non-NULL; else throw error
## Read "homicides.txt" data file
## Extract ages of victims; ignore records where no age is
## given
## Return integer containing count of homicides for that age

  homicides <- readLines("homicides.txt")
  liner <- getRegex(age)
  length(grep(liner, homicides))
}


getRegex <-function(age) {
  paste("male,", age, "years old|ge:", age, "years old")
}

