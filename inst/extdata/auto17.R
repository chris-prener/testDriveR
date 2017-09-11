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
  mutate(mfr = ifelse(id == 20825, "General Motors", mfr)) %>%
  mutate(mfr = ifelse(mfr == "Jaguar Land Rover L", "Jaguar Land Rover Ltd", mfr)) %>%
  mutate(mfr = ifelse(mfr == "Mclaren Automotive", "McLaren Automotive", mfr)) %>%
  mutate(mfr = ifelse(str_detect(mfr, "Volkswagen Group Of") == TRUE,
                      "Volkswagen Group of America", mfr)) %>%
  mutate(mfr = ifelse(str_detect(mfr, "Volvo") == TRUE,
                      str_replace(mfr, "Llc", "LLC"), mfr)) %>%
  mutate(mfr = ifelse(mfr == "Aston Martin" | mfr == "Ferrari" | mfr == "Hyundai" |
                        mfr == "Kia" | mfr == "Lotus" | mfr == "Mitsubishi Motors Co" |
                        mfr == "Rolls-Royce" | mfr == "Roush", mfrDivision, mfr))

auto17 %<>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Aston Martin") == TRUE, "Aston Martin", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Ferrari") == TRUE, "Ferrari", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Hyundai") == TRUE, "Hyundai", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Kia") == TRUE, "Kia", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Lotus") == TRUE, "Lotus", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "McLaren") == TRUE, "McLaren", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Mitsubishi") == TRUE, "Mitsubishi", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Rolls-Royce") == TRUE, "Rolls-Royce", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Roush") == TRUE, "Roush", mfrDivision)) %>%
  mutate(mfrDivision = ifelse(str_detect(mfr, "Volvo") == TRUE, "Volvo", mfrDivision)) %>%
  arrange(mfr, mfrDivision, carLine)

# adjust carline names to title case
auto17 %<>%
  mutate(carLine = ifelse(mfrDivision == "Buick" | mfrDivision == "Chevrolet" |
                            mfrDivision == "Ford" | mfrDivision == "Mini" |
                            mfrDivision == "GMC" | mfrDivision == "Honda" |
                            mfrDivision == "Maserati" | mfrDivision == "Mitsubishi" |
                            mfrDivision == "Nissan" | mfrDivision == "Subaru" |
                            mfrDivision == "Toyota",
                          str_to_title(carLine), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Buick" | mfrDivision == "Chevrolet" |
                            mfrDivision == "Ford" | mfrDivision == "GMC" |
                            mfrDivision == "Honda" | mfrDivision == "Maserati" |
                            mfrDivision == "Nissan" | mfrDivision == "Toyota",
                          str_replace(carLine, "Awd", "AWD"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Buick" | mfrDivision == "Chevrolet" |
                            mfrDivision == "Ford" | mfrDivision == "GMC" |
                            mfrDivision == "Honda" | mfrDivision == "Nissan",
                          str_replace(carLine, "Fwd", "FWD"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Maserati",
                          str_replace(carLine, "Rwd", "RWD"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Chevrolet" | mfrDivision == "Ford" |
                            mfrDivision == "GMC" | mfrDivision == "Mitsubishi" |
                            mfrDivision == "Nissan" | mfrDivision == "Toyota",
                          str_replace(carLine, "2Wd", ""), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Chevrolet" | mfrDivision == "Ford" |
                            mfrDivision == "GMC" | mfrDivision == "Mitsubishi" |
                            mfrDivision == "Nissan" | mfrDivision == "Toyota",
                          str_replace(carLine, "4Wd", "FWD"), carLine))

# fix specific issues in carline (1)
auto17 %<>%
  mutate(carLine = ifelse(mfrDivision == "Chevrolet" & carLine == "Ss", "SS", carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Chevrolet" | mfrDivision == "GMC",
                          str_replace(carLine, "Mdpv", "MDPV"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ferrari",
                          str_replace(carLine, "gtb", "GTB"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ferrari",
                          str_replace(carLine, "tdf", "TDF"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ford",
                          str_replace(carLine, "El", "EL"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ford" | mfrDivision == "Nissan" |
                            mfrDivision == "Toyota",
                          str_replace(carLine, "Ffv", "FFV"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ford",
                          str_replace(carLine, "Gt", "GT"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ford",
                          str_replace(carLine, "Gt350", "GT350"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ford",
                          str_replace(carLine, "Lwb", "LWB"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ford",
                          str_replace(carLine, "Sfe", "SFE"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ford",
                          str_replace(carLine, "St", "ST"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Ford",
                          str_replace(carLine, "Rs", "RS"), carLine))

# fix specific issues in carline (2)
auto17 %<>%
  mutate(carLine = ifelse(mfrDivision == "GMC",
                          str_replace(carLine, "Xl", "XL"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Honda",
                          str_replace(carLine, "Cr-V", "CR-V"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Honda",
                          str_replace(carLine, "Hr-V", "HR-V"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Honda",
                          str_replace(carLine, "Dr", " Door"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Hyundai",
                          str_replace(carLine, "ULTIMATE", "Ultimate"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Hyundai",
                          str_replace(carLine, "SPORT", "Sport"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Hyundai",
                          str_replace(carLine, "LIMITED", "Limited"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Lincoln",
                          str_replace(carLine, "CONTINENTAL", "Continental"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Maserati",
                          str_replace(carLine, "Gts", "GTS"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Maserati",
                          str_replace(carLine, "Sq4", "SQ4"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Mazda" | mfrDivision == "Subaru",
                          str_replace(carLine, "-Door", " Door"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Mercedes-Benz",
                          str_replace(carLine, "convertible", "Convertible"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Mercedes-Benz",
                          str_replace(carLine, "coupe", "Coupe"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Mercedes-Benz",
                          str_replace(carLine, "COUPE", "Coupe"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Mercedes-Benz",
                          str_replace(carLine, "station wagon", "Station Wagon"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Nissan",
                          str_replace(carLine, "Sr", "SR"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Nissan",
                          str_replace(carLine, "Rs", "RS"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Nissan",
                          str_replace(carLine, "Nv200", "NV200"), carLine))

# fix specific issues in carline (3)
auto17 %<>%
  mutate(carLine = ifelse(mfrDivision == "Subaru",
                          str_replace(carLine, "Brz", "BRZ"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Subaru",
                          str_replace(carLine, "Wrx", "WRX"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Lexus",
                          str_replace(carLine, "0t", "0T"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Lexus",
                          str_replace(carLine, "0h", "0H"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Lexus",
                          str_replace(carLine, "SPORT", "Sport"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Toyota",
                          str_replace(carLine, "Le", "LE"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Toyota",
                          str_replace(carLine, "Xle", "XLE"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Toyota",
                          str_replace(carLine, "Se", "SE"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Toyota",
                          str_replace(carLine, "Ltd", "LTD"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Toyota",
                          str_replace(carLine, "Eco", "ECO"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Toyota",
                          str_replace(carLine, "Ia", "IA"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Toyota",
                          str_replace(carLine, "Rav", "RAV"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Audi",
                          str_replace(carLine, "quattro", "Quattro"), carLine)) %>%
  mutate(carLine = ifelse(mfrDivision == "Audi",
                          str_replace(carLine, "allroad", "Allroad"), carLine))

# fix specific issues in carline (4)
auto17 %<>%
  mutate(carLine = ifelse(id == 20046, "Escalade", carLine)) %>%
  mutate(carLine = ifelse(id == 20132, "Escalade FWD", carLine)) %>%
  mutate(carLine = ifelse(id == 20237, "XTS Hearse", carLine)) %>%
  mutate(carLine = ifelse(id == 20105, "XTS Limo", carLine)) %>%
  mutate(carLine = ifelse(id == 21149, str_replace(carLine, "LIVERY", "Livery"), carLine)) %>%
  mutate(carLine = ifelse(id == 19668, str_replace(carLine, "HYBRID", "Hybrid"), carLine)) %>%
  mutate(carLine = ifelse(id == 20138, "Ghibli V6 RWD", carLine)) %>%
  mutate(carLine = ifelse(id == 19907, "GT-R", carLine)) %>%
  mutate(carLine = ifelse(id == 20502, "RAV4 Limited AWD/SE AWD", carLine)) %>%
  mutate(carLine = ifelse(id == 20903, word(carLine, 1, 2), carLine)) %>%
  mutate(carLine = ifelse(id == 20906, word(carLine, 1, 3), carLine)) %>%
  mutate(carLine = ifelse(id == 20977, word(carLine, 1, 2), carLine)) %>%
  mutate(carLine = ifelse(id == 20988, word(carLine, 1, 3), carLine)) %>%
  mutate(carLine = ifelse(id == 20961, word(carLine, 1, 3), carLine)) %>%
  mutate(carLine = ifelse(id == 20963, word(carLine, 1, 4), carLine))

# save data
save(auto17, file="auto17.RData")
