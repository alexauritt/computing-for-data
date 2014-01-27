test.examples <- function()
{
  checkEquals(6, count("other"))
  checkEquals(6, count("Other"))
  checkException(count("farting"))
  checkException(count("not a real cause"))
  # checkEquals(10, count("unknown"))
}
