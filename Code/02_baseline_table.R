library(dplyr)
library(tidyr)

f75 <- read.csv("f75_interim.csv")

# Demographic
Demographics <- f75 %>%
  group_by(arm) %>%
  summarise(Demographic = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Age in months
Age_in_months <- f75 %>%
  group_by(arm) %>%
  summarize(
    Age_in_months = paste0(median(agemons, na.rm = TRUE), " (", IQR(agemons, na.rm = TRUE), ")"))%>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Sex (Female)
Female <- f75 %>%
  group_by(arm) %>%
  filter(sex == "Female") %>%
  summarise(Female = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Primary caregiver is mother
Primary_caregiver_is_mother <- f75 %>%
  group_by(arm) %>%
  filter(caregiver == "Mother") %>%
  summarise(Primary_caregiver_is_mother = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Site
Kilifi_County_Hospital_Kenya <- f75 %>%
  group_by(arm) %>%
  filter(site == "A") %>%
  summarise(Kilifi_County_Hospital_Kenya = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

Coast_General_Hospital_Kenya <- f75 %>%
  group_by(arm) %>%
  filter(site == "B") %>%
  summarise(Coast_General_Hospital_Kenya = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

Queen_Elizabeth_Central_Hospital_Malawi <- f75 %>%
  group_by(arm) %>%    
  filter(site == "C") %>%
  summarise(Queen_Elizabeth_Central_Hospital_Malawi = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# MUAC (mean, SD)
MUAC <- f75 %>%
  group_by(arm) %>%
  summarize(MUAC = paste0(round(mean(muac, na.rm = TRUE), 2), 
                          " (", round(sd(muac, na.rm = TRUE), 2), ")")) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# weight (mean, SD)
Weight <- f75 %>%
  group_by(arm) %>%
  summarize(Weight = paste0(round(mean(weight, na.rm = TRUE), 2), 
                            " (", round(sd(weight, na.rm = TRUE), 2), ")")) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# height (mean, SD)
Height <- f75 %>%
  group_by(arm) %>%
  summarize(Height = paste0(round(mean(height, na.rm = TRUE), 2), 
                            " (", round(sd(height, na.rm = TRUE), 2), ")")) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Edema (Oedema, Swelling caused by fluid build-up in tissues)
Edema <- f75 %>%
  group_by(arm) %>%
  filter(oedema %in% c("+", "++", "+++")) %>%
  summarise(Edema = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Currently breastfeeding
Currently_breastfeeding <- f75 %>%
  group_by(arm) %>%
  filter(bfeeding == "Yes") %>%
  summarise(Currently_breastfeeding = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Signs of shock
Signs_of_shock <- f75 %>%
  group_by(arm) %>%
  filter(shock == "Yes") %>%
  summarise(Signs_of_shock = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Impaired consciousness
Impaired_consciousness <- f75 %>%
  group_by(arm) %>%
  filter(iconsciousness == "Yes") %>%
  summarise(Impaired_consciousness = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Severe pneumonia
Severe_pneumonia <- f75 %>%
  group_by(arm) %>%
  filter(sev_pneumonia == "Yes") %>%
  summarise(Severe_pneumonia = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Diarrhea
Diarrhea <- f75 %>%
  group_by(arm) %>%
  filter(diarrhoea == "Yes") %>%
  summarise(Diarrhea = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Malaria parasitemia
Malaria_parasitemia <- f75 %>%
  group_by(arm) %>%
  filter(malaria == "Yes") %>%
  summarise(Malaria_parasitemia = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Tuberculosis
Tuberculosis <- f75 %>%
  group_by(arm) %>%
  filter(tb == "Yes") %>%
  summarise(Tuberculosis = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Cerebral palsy
Cerebral_palsy <- f75 %>%
  group_by(arm) %>%
  filter(cerebral_palsy == "Yes") %>%
  summarise(Cerebral_palsy = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Chronic cough
Chronic_cough <- f75 %>%
  group_by(arm) %>%
  filter(chronic_cough == "Yes") %>%
  summarise(Chronic_cough = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Sickle cell disease
Sickle_cell_disease <- f75 %>%
  group_by(arm) %>%
  summarize(Sickle_cell_disease = sum(sickle_cell == "Yes")) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Congenial or acquired heart disease
Congenial_or_acquired_heart_disease <- f75 %>%
  group_by(arm) %>%
  filter(heart_disease == "Yes") %>%
  summarise(Congenial_or_acquired_heart_disease = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# HIV antibody test (Positive/Untested)
HIV_positive <- f75 %>%
  group_by(arm) %>%
  filter(hiv_results == "Positive") %>%
  summarise(HIV_positive = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

HIV_untested <- f75 %>%
  group_by(arm) %>%
  filter(hiv_results == "Unknown") %>%
  summarise(HIV_untested = n()) %>%
  pivot_longer(cols = -arm, names_to = "variable", values_to = "value") %>%
  pivot_wider(names_from = arm, values_from = value)

# Create the baseline characteristics table
Baseline_characteristics <- rbind(Demographics, Age_in_months, Female, Primary_caregiver_is_mother,
                                  Kilifi_County_Hospital_Kenya, Coast_General_Hospital_Kenya,
                                  Queen_Elizabeth_Central_Hospital_Malawi, MUAC, Weight, Height,
                                  Edema, Currently_breastfeeding, Signs_of_shock, Impaired_consciousness,
                                  Severe_pneumonia, Diarrhea, Malaria_parasitemia, Tuberculosis,
                                  Cerebral_palsy, Chronic_cough, Sickle_cell_disease,
                                  Congenial_or_acquired_heart_disease, HIV_positive, HIV_untested)

print(Baseline_characteristics)

