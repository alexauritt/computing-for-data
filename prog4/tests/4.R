test.examples <- function()
{
  checkTrue(isValidCause("other"))
  checkTrue(isValidCause("Other"))
  checkTrue(!isValidCause("farting"))
  checkTrue(!isValidCause("not a real cause"))
  
  textLineOther <- "39.31637800000, -76.60977400000, icon_homicide_other, 'p1003', '<dl><dt><a href=\"http://essentials.baltimoresun.com/micro_sun/homicides/victim/1003/tammy-madison\">Tammy Madison</a></dt><dd class=\"address\">2400 Greenmount Ave<br />Baltimore, MD 21218</dd><dd>Race: Black<br />Gender: female<br />Age: 45 years old</dd><dd>Found on December  3, 2010</dd><dd>Victim died at Johns Hopkins Hospital</dd><dd>Cause: Other</dd><dd class=\"popup-note\"><p>Madison was pushed in front of a delivery truck on Feb. 16 and killed. Investigators determined on this date that she...</dd></dl>'"
  checkEquals(extractCause(textLineOther), "other")
  
  textLineShooting <- "39.28471600000, -76.64871100000, icon_homicide_shooting, 'p1000', '<dl><dt><a href=\"http://essentials.baltimoresun.com/micro_sun/homicides/victim/1000/raquan-campbell\">Raquan Campbell</a></dt><dd class=\"address\">200 S. Payson St.<br />Baltimore, MD 21223</dd><dd>Race: Black<br />Gender: male<br />Age: 15 years old</dd><dd>Found on December  1, 2010</dd><dd>Victim died at Unknown</dd><dd>Cause: Shooting</dd></dl>'"
  checkEquals(extractCause(textLineShooting), "shooting")
  

  checkEquals(6, count("other"))
  checkEquals(6, count("Other"))
  checkException(count("farting"))
  checkException(count("not a real cause"))

  # checkEquals(10, count("unknown"))
}
