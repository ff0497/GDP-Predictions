#### German GDP Prediction ####

### The purpose of this file: ###
# Read in data

### In Bearbeitung: Nein ###


#### Packages ####
library(tidyverse)





#### Daten einlesen - BIP ####
gdp <- 
  read.csv2("data/pred_bip_flat.csv", sep=";") %>%
  select(-(Statistik_Code:Zeit_Label),
         -(X1_Merkmal_Code:X2_Auspraegung_Code),
         -(X3_Merkmal_Code:X3_Auspraegung_Code),
         -(X4_Merkmal_Code:X4_Auspraegung_Code),
         -STR006__Guetersteuern_abzuegl._Guetersubventionen__jew._ME,
         -STR020_______Guetersteuern__jew._ME,
         -SUB003_______Guetersubventionen__jew._ME,
         -BIP004__nachr.._Bruttoinlandsprodukt_je_Einwohner__jew._ME) %>%
  rename(year = Zeit,
         quarter = X2_Auspraegung_Label,
         bruttowertschoepfung = BWS001__Bruttowertschoepfung__jew._ME,
         gdp = VGR014__Bruttoinlandsprodukt__jew._ME,
         gdp_change = BIP005__nachr.._Bruttoinlandsprodukt_.Veraenderung_in_..__Prozent) %>%
  mutate(quarter = substring(quarter, 1, 1),
         quarter = as.numeric(quarter)) %>%
  mutate(bruttowertschoepfung = case_when(
    bruttowertschoepfung == "-" ~ NA,
    TRUE ~ bruttowertschoepfung
    )
    )
# Variables in billions of euros





