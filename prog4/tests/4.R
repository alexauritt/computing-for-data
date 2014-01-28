test.examples <- function()
{
  checkTrue(isValidCause("other"))
  checkTrue(isValidCause("Other"))
  checkTrue(!isValidCause("farting"))
  checkTrue(!isValidCause("not a real cause"))

  checkEquals(6, count("other"))
  checkEquals(6, count("Other"))

  checkEquals(10, count("unknown"))
  checkException(count("farting"))
  checkException(count("not a real cause"))
}
