# script for cleaning 2017 version of auto data
# source - https://www.fueleconomy.gov/feg/download.shtml

# dependencies
library(dplyr)

# load raw data
autoFull17 <- read.csv("autoFull17.csv", stringsAsFactors = FALSE)

# select and rename variables
auto17 <- autoFull17 %>%
  select(EPA.FE.Label.Dataset.ID, Mfr.Name, Division, Carline, 
         Carline.Class, Carline.Class.Desc, 
         City.FE..Guide....Conventional.Fuel, 
         Hwy.FE..Guide....Conventional.Fuel,
         Comb.FE..Guide....Conventional.Fuel,
         Guzzler., Fuel.Usage....Conventional.Fuel, Fuel.Usage.Desc...Conventional.Fuel,
         Annual.Fuel1.Cost...Conventional.Fuel, 
         Eng.Displ, Transmission, Trans, X..Gears, X..Cyl, 
         Air.Aspiration.Method.Desc, Drive.Sys, Drive.Desc) %>%
  rename(id = EPA.FE.Label.Dataset.ID) %>%
  rename(mfr = Mfr.Name) %>%
  rename(mfrDivision = Division) %>%
  rename(carLine = Carline) %>%
  rename(carClass = Carline.Class) %>%
  rename(carClassStr = Carline.Class.Desc) %>%
  rename(cityFE = City.FE..Guide....Conventional.Fuel) %>%
  rename(hwyFE = Hwy.FE..Guide....Conventional.Fuel) %>%
  rename(combFE = Comb.FE..Guide....Conventional.Fuel) %>%
  rename(guzzlerStr = Guzzler.) %>%
  rename(fuelStr = Fuel.Usage....Conventional.Fuel) %>%
  rename(fuelStr2 = Fuel.Usage.Desc...Conventional.Fuel) %>%
  rename(fuelCost = Annual.Fuel1.Cost...Conventional.Fuel) %>%
  rename(displ = Eng.Displ) %>%
  rename(transStr = Transmission) %>%
  rename(transStr2 = Trans) %>%
  rename(gears = X..Gears) %>%
  rename(cyl = X..Cyl) %>%
  rename(airAsp = Air.Aspiration.Method.Desc) %>%
  rename(driveStr = Drive.Sys) %>%
  rename(driveStr2 = Drive.Desc)
  
