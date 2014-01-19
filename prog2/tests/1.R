test.examples <- function() {
  checkEquals("006", padIntegerString(6))
  checkEquals("006", padIntegerString('6'))
  checkEquals("006", padIntegerString('06'))
  checkEquals("006", padIntegerString('006'))  
  checkEquals("007", padIntegerString(7))
  checkEquals("056", padIntegerString(56))
  checkEquals("056", padIntegerString('056'))  
  checkEquals("356", padIntegerString(356))
  checkEquals("356", padIntegerString('356'))
}