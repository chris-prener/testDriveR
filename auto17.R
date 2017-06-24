# script for cleaning 2017 version of auto data
# source - https://www.fueleconomy.gov/feg/download.shtml

# dependencies
library(dplyr)     # data cleaning
library(stringr)   # working with strings

# load raw data
auto17 <- read.csv("autoFull17.csv", stringsAsFactors = FALSE)

# select and rename variables
auto17 %<>%
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
  
# remove duplicates and re-order rows
auto17 %<>%
  filter(is.na(id) == FALSE) %>%
  arrange(mfr, mfrDivision, carLine)

# adjust inconsistent capitalization
auto17 %<>%
  mutate(mfr = ifelse(mfr == "BMW" | mfr == "FCA US LLC", mfr, str_to_title(mfr))) %>%
  mutate(mfrDivision = ifelse(mfr == "BMW" | mfrDivision == "GMC", 
                              mfrDivision, str_to_title(mfrDivision)))

# adjust inconsistent manufacturer and division data
auto17 %<>%
  mutate(mfr = ifelse(mfr == "Aston Martin" | 
                        mfr == "Ferrari" |
                        mfr == "Hyundai" |
                        mfr == "Kia", mfrDivision, mfr)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Aston Martin") == TRUE, "Aston Martin", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Ferrari") == TRUE, "Ferrari", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Hyundai") == TRUE, "Hyundai", mfrDivision)) %>%
  mutate(mfr = ifelse(mfr == "Jaguar Land Rover L", "Jaguar Land Rover Ltd", mfr)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Kia") == TRUE, "Kia", mfrDivision))