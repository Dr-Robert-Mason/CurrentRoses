# Script for developing a wind-spokes plot: 

library(DescTools)
library(plotrix)
# 

N_gon <- 16 # number of sides of the regular polygon = number of bins of wind direction.
Inradius <-2 # inradius of the said regular polygon. 
(side_length <- 2*Inradius*tan(pi/N_gon))

Real_dataset<-Logger_B1782_counts # This is the dataset from the logger binning script. 

create_Y_positions<-function(input_matrix,current_speed_bin){

  bin2<-as.integer((current_speed_bin-2)>=0)
  bin3<-as.integer((current_speed_bin-3)>=0)
  bin4<-as.integer((current_speed_bin-4)>=0)
  bin5<-as.integer((current_speed_bin-5)>=0)
  bin6<-as.integer((current_speed_bin-6)>=0)
  
  Temp_matrix_Y<-matrix(0, nrow=nrow(input_matrix),ncol=4)
  Temp_matrix_Y[,1]<--side_length/2+input_matrix[,1]/1000*bin2+input_matrix[,2]/1000*bin3+input_matrix[,3]/1000*bin4+input_matrix[,4]/1000*bin5+input_matrix[,5]/1000*bin6
  Temp_matrix_Y[,2]<--side_length/2+input_matrix[,1]/1000+input_matrix[,2]/1000*bin2+input_matrix[,3]/1000*bin3+input_matrix[,4]/1000*bin4+input_matrix[,5]/1000*bin5+input_matrix[,6]/1000*bin6
  Temp_matrix_Y[,3]<-Temp_matrix_Y[,2]
  Temp_matrix_Y[,4]<-Temp_matrix_Y[,1]
  
  return(Temp_matrix_Y)
}

Bin1_Ypositions<-create_Y_positions(Real_dataset,1)
Bin2_Ypositions<-create_Y_positions(Real_dataset,2)
Bin3_Ypositions<-create_Y_positions(Real_dataset,3)
Bin4_Ypositions<-create_Y_positions(Real_dataset,4)
Bin5_Ypositions<-create_Y_positions(Real_dataset,5)
Bin6_Ypositions<-create_Y_positions(Real_dataset,6)

X_points_original<-c(side_length/2, side_length/2, -side_length/2, -side_length/2)
Repeated_X<-matrix(rep.int(X_points_original, 16), ncol = 4, byrow = TRUE)

Rotate_translate<-function(Repeated_X, Repeated_Y, Inradius, side_length, XorY){

angle_of_rotation<-c(0, 22.5, 45.0, 67.5, 90.0, 112.5, 135.0, 157.5, 180.0, 202.5, 225.0, 247.5, 270.0, 292.5, 315.0, 337.5)

apply_translation<-function(x_or_y, angle, dist, datum){
  In_1st_quad<-as.integer(angle>=0 & angle<=90)
  In_2nd_quad<-as.integer(angle>90 & angle<=180)
  In_3rd_quad<-as.integer(angle>180 & angle<=270)
  In_4th_quad<-as.integer(angle>270 & angle<360)
  
  if (x_or_y=='x'){
  output<-datum + In_1st_quad*dist*cos((90-angle)*pi/180) + In_2nd_quad*dist*cos((angle-90)*pi/180) - In_3rd_quad*dist*cos((270 - angle)*pi/180) - In_4th_quad*dist*cos((angle-270)*pi/180)
  }
  else if (x_or_y=='y'){
  output<-datum + In_1st_quad*dist*sin((90-angle)*pi/180) - In_2nd_quad*dist*sin((angle-90)*pi/180) - In_3rd_quad*dist*sin((270 - angle)*pi/180) + In_4th_quad*dist*sin((angle-270)*pi/180)
  }
  return(output)
}

x = 'x'
y = 'y'

Rotated_dataset_X<-Repeated_X*cos(angle_of_rotation*pi/180) + Repeated_Y*sin(angle_of_rotation*pi/180)
Rotated_dataset_Y<--Repeated_X*sin(angle_of_rotation*pi/180) + Repeated_Y*cos(angle_of_rotation*pi/180)

Translated_dataset_X<-matrix(0,nrow=nrow(Rotated_dataset_X), ncol=ncol(Rotated_dataset_X))
for (i in 1:nrow(Rotated_dataset_X)){
  for (j in 1:ncol(Rotated_dataset_X))
  Translated_dataset_X[i,j]<-apply_translation(x,angle_of_rotation[i],Inradius+side_length/2, Rotated_dataset_X[i,j])
}

Translated_dataset_Y<-matrix(0,nrow=nrow(Rotated_dataset_Y), ncol=ncol(Rotated_dataset_Y))
for (i in 1:nrow(Rotated_dataset_Y)){
  for (j in 1:ncol(Rotated_dataset_Y))
    Translated_dataset_Y[i,j]<-apply_translation(y,angle_of_rotation[i],Inradius+side_length/2, Rotated_dataset_Y[i,j])
}
if (XorY=='X'){
return(Translated_dataset_X)
}
else if (XorY=='Y'){
  return(Translated_dataset_Y)
}
}

X<-'X'
Y<-'Y'

Translated_dataset_X_bin1<-Rotate_translate(Repeated_X, Bin1_Ypositions, Inradius, side_length, X)
Translated_dataset_Y_bin1<-Rotate_translate(Repeated_X, Bin1_Ypositions, Inradius, side_length, Y)

Translated_dataset_X_bin2<-Rotate_translate(Repeated_X, Bin2_Ypositions, Inradius, side_length, X)
Translated_dataset_Y_bin2<-Rotate_translate(Repeated_X, Bin2_Ypositions, Inradius, side_length, Y)

Translated_dataset_X_bin3<-Rotate_translate(Repeated_X, Bin3_Ypositions, Inradius, side_length, X)
Translated_dataset_Y_bin3<-Rotate_translate(Repeated_X, Bin3_Ypositions, Inradius, side_length, Y)

Translated_dataset_X_bin4<-Rotate_translate(Repeated_X, Bin4_Ypositions, Inradius, side_length, X)
Translated_dataset_Y_bin4<-Rotate_translate(Repeated_X, Bin4_Ypositions, Inradius, side_length, Y)

Translated_dataset_X_bin5<-Rotate_translate(Repeated_X, Bin5_Ypositions, Inradius, side_length, X)
Translated_dataset_Y_bin5<-Rotate_translate(Repeated_X, Bin5_Ypositions, Inradius, side_length, Y)

Translated_dataset_X_bin6<-Rotate_translate(Repeated_X, Bin6_Ypositions, Inradius, side_length, X)
Translated_dataset_Y_bin6<-Rotate_translate(Repeated_X, Bin6_Ypositions, Inradius, side_length, Y)

par(mar=c(1,1,1,1), bg = "grey") # Background is set to grey as the PolarGrid function colours the labels for the radial lines white. 
plot(1, 1, col = "white", xlab = "X", ylab = "Y", xlim = c(-10,10), ylim = c(-10,10),xaxt = "n" , yaxt = "n")
# axis(1, at = seq(-10, 10, by = 2))
# axis(2, at = seq(-10, 10, by = 2))
add=TRUE
#Circles solution 1: 
plotrix::draw.circle(x = 0, y = 0, radius = 2)
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 2*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 4*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 6*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 8*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 10*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 12*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 14*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 16*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 18*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 20*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 22*sum(Real_dataset)/100/1000, border = 'darkgrey')
plotrix::draw.circle(x = 0, y = 0, radius = 2+ 24*sum(Real_dataset)/100/1000, border = 'darkgrey')

# Circles solution 2:
# plotrix::draw.circle(x = 0, y = 0, radius = 2+ 5*sum(Real_dataset)/100/1000, border = 'darkgrey')
# plotrix::draw.circle(x = 0, y = 0, radius = 2+ 10*sum(Real_dataset)/100/1000, border = 'darkgrey')
# plotrix::draw.circle(x = 0, y = 0, radius = 2+ 15*sum(Real_dataset)/100/1000, border = 'darkgrey')
# plotrix::draw.circle(x = 0, y = 0, radius = 2+ 20*sum(Real_dataset)/100/1000, border = 'darkgrey')
# plotrix::draw.circle(x = 0, y = 0, radius = 2, border = 'darkgrey', col='white')
add=TRUE
DescTools::PolarGrid(nr = NA, lty = 1, ntheta = 16, alabels=c('E','ENE','NE','NNE','N','NNW','NW','WNW','W','WSW','SW','SSW','S','SSE','SE','ESE'),dist=par("usr")[2] * 0.9,col='darkgrey')
# PolarGrid usage notes: angle starts at zero on quadrant 1 x-axis and increases counterclockwise. Hence, my list of radial line labels started at E and went counterclockwise. 
add=TRUE

# Colours from 'Tol' colourblind friendly palette at https://davidmathlogic.com/colorblind/#%23D81B60-%231E88E5-%23FFC107-%23004D40
for (i in 1:16){
  polygon(Translated_dataset_X_bin1[i,],Translated_dataset_Y_bin1[i,], col = "#DDCC77") 
  add=TRUE
}

add=TRUE
for (i in 1:16){
  polygon(Translated_dataset_X_bin2[i,],Translated_dataset_Y_bin2[i,], col = "#88CCEE") 
  add=TRUE
}

add=TRUE
for (i in 1:16){
  polygon(Translated_dataset_X_bin3[i,],Translated_dataset_Y_bin3[i,], col = "#44AA99") 
  add=TRUE
}

add=TRUE
for (i in 1:16){
  polygon(Translated_dataset_X_bin4[i,],Translated_dataset_Y_bin4[i,], col = "#117733") 
  add=TRUE
}

add=TRUE
for (i in 1:16){
  polygon(Translated_dataset_X_bin5[i,],Translated_dataset_Y_bin5[i,], col = "#332288") 
  add=TRUE
}

add=TRUE
for (i in 1:16){
  polygon(Translated_dataset_X_bin6[i,],Translated_dataset_Y_bin6[i,], col = "#AA4499") 
  add=TRUE
}

# Use DescTools to add in a polar grid. see https://rdrr.io/cran/DescTools/man/PolarGrid.html
