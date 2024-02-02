LoggerB1782<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1782_CapBunk_Nov_2021_spawning_O_20211119-20211205_001_i.csv", sep = ",", header = TRUE)
LoggerB1783<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1783_CapBunk_Nov_2021_spawning_F_20211119-20211205_003_i.csv", sep = ",", header = TRUE)
LoggerB1787<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1787_CapBunk_Nov_2021_spawning_D_20211119-20211205_004_i.csv", sep = ",", header = TRUE)
LoggerB1788<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1788_CapBunk_Nov_2021_spawning_E_20211119-20211205_003_i.csv", sep = ",", header = TRUE)
LoggerB1790<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1790_CapBunk_Nov_2021_spawning_N_20211119-20211205_001_i.csv", sep = ",", header = TRUE)
LoggerB1793<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1793_CapBunk_Nov_21_spawning_A_20211119-20211205_004_i.csv", sep = ",", header = TRUE)
LoggerB1794<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1794_CapBunk_Nov_2021_spawning_C_20211119-20211205_003_i.csv", sep = ",", header = TRUE)
LoggerB1796<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1796_CapBunk_Nov_21_spawning_B_20211119-20211205_005_i.csv", sep = ",", header = TRUE)
LoggerB1800<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1800_CapBunk_Nov_2021_spawning_J_20211119-20211205_003_i.csv", sep = ",", header = TRUE)
LoggerB1802<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1802_CapBunk_Nov_2021_spawning_K_20211119-20211205_002_i.csv", sep = ",", header = TRUE)
LoggerB1803<-read.csv("C:/Users/mas201/OneDrive - CSIRO/Documents/Marotte_outputs/Outputs_30secDecimation_RolledBackProgram/MarotteHS_2022-05-22_184927/B1803_CapBunk_Nov_2021_spawning_M_20211119-20211205_003_i.csv", sep = ",", header = TRUE)



LoggerB1782$DayOfYear<-unclass(as.POSIXlt(LoggerB1782$datetime))$yday
LoggerB1782<-subset(LoggerB1782, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1783$DayOfYear<-unclass(as.POSIXlt(LoggerB1783$datetime))$yday
LoggerB1783<-subset(LoggerB1783, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1787$DayOfYear<-unclass(as.POSIXlt(LoggerB1787$datetime))$yday
LoggerB1787<-subset(LoggerB1787, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1788$DayOfYear<-unclass(as.POSIXlt(LoggerB1788$datetime))$yday
LoggerB1788<-subset(LoggerB1788, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1790$DayOfYear<-unclass(as.POSIXlt(LoggerB1790$datetime))$yday
LoggerB1790<-subset(LoggerB1790, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1793$DayOfYear<-unclass(as.POSIXlt(LoggerB1793$datetime))$yday
LoggerB1793<-subset(LoggerB1793, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1794$DayOfYear<-unclass(as.POSIXlt(LoggerB1794$datetime))$yday
LoggerB1794<-subset(LoggerB1794, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1796$DayOfYear<-unclass(as.POSIXlt(LoggerB1796$datetime))$yday
LoggerB1796<-subset(LoggerB1796, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1800$DayOfYear<-unclass(as.POSIXlt(LoggerB1800$datetime))$yday
LoggerB1800<-subset(LoggerB1800, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1802$DayOfYear<-unclass(as.POSIXlt(LoggerB1802$datetime))$yday
LoggerB1802<-subset(LoggerB1802, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

LoggerB1803$DayOfYear<-unclass(as.POSIXlt(LoggerB1803$datetime))$yday
LoggerB1803<-subset(LoggerB1803, DayOfYear > 327 & DayOfYear<338)# subset dataset for days after 24/12/2021 and before 5 /12/ 2021

part_1<-c(1:32)
components<-part_1*22.5/2
(Direction_upper_bound<-components[c(1:16)*2-1])
(Direction_lower_bound<-c(Direction_upper_bound[16], Direction_upper_bound[1:15]))

(current_speed_lower_bound<-c(0:5))
(current_speed_upper_bound<-c(1:5,30))

classify_speed_direction<-function(Logger_dataset) {
  matrix_to_fill<-matrix(0,nrow = 16,ncol = 6)
  
  for (i in c(1:6)){
    Logger_subset<-subset(Logger_dataset, `speed..m.s.`>current_speed_lower_bound[i]/10 & `speed..m.s.`<=current_speed_upper_bound[i]/10)
    for (j in c(1:16)){
    if (j == 1){
      matrix_to_fill[j,i]<-length(which(Logger_subset$`heading..degrees.CW.from.North`>=Direction_lower_bound[j]|Logger_subset$`heading..degrees.CW.from.North`<Direction_upper_bound[j]))
    } 
    else if (is.element(j, c(2:16))==TRUE){
      matrix_to_fill[j,i]<-length(which(Logger_subset$`heading..degrees.CW.from.North`>=Direction_lower_bound[j] & Logger_subset$`heading..degrees.CW.from.North`<Direction_upper_bound[j]))
    }
    }
  }
  return(matrix_to_fill)
}

Logger1782_counts<-classify_speed_direction(LoggerB1782)
