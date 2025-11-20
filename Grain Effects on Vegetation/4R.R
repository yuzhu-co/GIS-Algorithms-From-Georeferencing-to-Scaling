install.packages("raster")
install.packages("rasterVis")
library(raster)
library(rasterVis)
getwd()
setwd("C:/Users/w9671/Documents/2024spring/23/4/Assignment_4")
mb<-raster('mbveg2.rst')
raster_data <- raster("C:/Users/w9671/Documents/mbveg2.rst")

# ?????????????????????
resolution <- res(raster_data)
print(resolution)
# ??????Raster??????
raster_data <- raster("C:/Users/w9671/Documents/mbveg2.rst")
# ??????levelplot????????????????????????
levelplot(raster_data)
raster_data <- raster("C:/Users/w9671/Documents/mbveg2.rst")

# ??????Raster
plot(raster_data)
mb(raster_data)
str(raster_data)
raster_crs <- raster_data@crs
print(raster_crs)
colours()
farg <-c("beige", "forestgreen", "yellowgreen", "lightgreen", "orange", "red")
plot(mb, main='Vegetation Cover, Mer Bleue' ,col=farg)
click(mb)
freq(raster_data)
#8 ?????? raster_data ?????????????????????
#8 ???????????????
cover_types <- c(1, 2, 3, 4, 5, 6)  # Adjust this based on your data
# Initialize an empty vector to store proportions
propmb1 <- numeric(length(cover_types))
# Loop through each cover type
for (i in seq_along(cover_types)) {
  # Count the number of cells for the current cover type
  cell_count <- sum(values(raster_data) == cover_types[i])
  # Compute the proportion
  prop <- cell_count / ncell(raster_data)
  # Store the proportion in the vector
  propmb1[i] <- prop
}
# Assign names to the proportions vector
names(propmb1) <- paste("cover_type", cover_types, sep = "_")
# Print the proportions vector
print(propmb1)

propmb2 <- numeric(length(cover_types))
# Loop through each cover type
for (i in seq_along(cover_types)) {
  # Count the number of cells for the current cover type
  cell_count <- sum(values(mb2) == cover_types[i])
  # Compute the proportion
  prop <- cell_count / ncell(mb2)
  # Store the proportion in the vector
  propmb2[i] <- prop
}
# Assign names to the proportions vector
names(propmb2) <- paste("cover_type", cover_types, sep = "_")
# Print the proportions vector
print(propmb2)

propmb4 <- numeric(length(cover_types))
# Loop through each cover type
for (i in seq_along(cover_types)) {
  # Count the number of cells for the current cover type
  cell_count <- sum(values(mb4) == cover_types[i])
  # Compute the proportion
  prop <- cell_count / ncell(mb4)
  # Store the proportion in the vector
  propmb4[i] <- prop
}
# Assign names to the proportions vector
names(propmb4) <- paste("cover_type", cover_types, sep = "_")
# Print the proportions vector
print(propmb4)

names(propmb4) <- paste("cover_type", cover_types, sep = "_")
# Print the proportions vector
print(propmb4)

propmb8 <- numeric(length(cover_types))
# Loop through each cover type
for (i in seq_along(cover_types)) {
  # Count the number of cells for the current cover type
  cell_count <- sum(values(mb8) == cover_types[i])
  # Compute the proportion
  prop <- cell_count / ncell(mb8)
  # Store the proportion in the vector
  propmb8[i] <- prop
}
# Assign names to the proportions vector
names(propmb8) <- paste("cover_type", cover_types, sep = "_")
# Print the proportions vector
print(propmb8)

propmb16 <- numeric(length(cover_types))
# Loop through each cover type
for (i in seq_along(cover_types)) {
  # Count the number of cells for the current cover type
  cell_count <- sum(values(mb16) == cover_types[i])
  # Compute the proportion
  prop <- cell_count / ncell(mb16)
  # Store the proportion in the vector
  propmb16[i] <- prop
}
# Assign names to the proportions vector
names(propmb16) <- paste("cover_type", cover_types, sep = "_")
# Print the proportions vector
print(propmb16)
resolution <- res(mb32)
print(resolution)
propmb32 <- numeric(length(cover_types))
# Loop through each cover type
for (i in seq_along(cover_types)) {
  # Count the number of cells for the current cover type
  cell_count <- sum(values(mb32) == cover_types[i])
  # Compute the proportion
  prop <- cell_count / ncell(mb32)
  # Store the proportion in the vector
  propmb32[i] <- prop
}
# Assign names to the proportions vector
names(propmb32) <- paste("cover_type", cover_types, sep = "_")
# Print the proportions vector
print(propmb32)

# ??????????????????????????????
prop_vector <- numeric(length(unique_values))

# ????????????????????????????????????????????????
for (i in seq_along(unique_values)) {
  cover_type <- unique_values[i]
  count <- sum(raster_data[] == cover_type, na.rm = TRUE)
  proportion <- count / length(raster_data[])
  
  # ????????????
  prop_vector[i] <- proportion
}

# ????????????
print(prop_vector)
mb <- raster("C:/Users/w9671/Documents/mbveg2.rst")
# ???????????????
mb2 <- aggregate(mb, fact = 2, fun = modal)

plot(mb2)
plot(mb2, main='Vegetation Cover, Mer Bleue' ,col=farg)
dev.new()
plot(mb)
click(mb)
freq(mb2)
count_per_class <- extract(mb, mb, fun=sum)

# ?????????????????????????????????
proportions <- count_per_class / sum(count_per_class)

# ??????????????????????????????
propmb <- proportions

# ??????????????????
print(propmb)
# ????????????????????????mb???raster??????
# ??????????????????????????????????????????
count_per_class <- extract(mb, fun=sum)

# ?????????????????????????????????
proportions <- count_per_class / sum(count_per_class, na.rm = TRUE)

# ??????????????????????????????
propmb <- proportions

# ??????????????????
print(propmb)
any(is.na(values(mb)))
count_per_class <- extract(raster_data, fun=sum)

mb4 <- aggregate(mb2, fact = 2, fun = modal)
mb8 <- aggregate(mb4, fact = 2, fun = modal)
mb16 <- aggregate(mb8, fact = 2, fun = modal)
mb32 <- aggregate(mb16, fact = 2, fun = modal)
plot(mb4, main='Vegetation Cover, Mer Bleue' ,col=farg)
plot(mb8, main='Vegetation Cover, Mer Bleue' ,col=farg)
plot(mb16, main='Vegetation Cover, Mer Bleue' ,col=farg)
plot(mb32, main='Vegetation Cover, Mer Bleue' ,col=farg)
plot(mb4)
freq(mb4)
freq(mb8)
freq(mb16)
freq(mb32)

resolution <- res(mb2)
print(resolution)
resolution <- res(mb4)
print(resolution)
resolution <- res(mb8)
print(resolution)
resolution <- res(mb16)
print(resolution)
resolution <- res(mb32)
print(resolution)

landcover <- c("Other surfaces", "Closed canopy", "Open canopy - tree",
               "Open canopy - tall shrub", "Open canopy - low shrub",
               "Barren land")
proportion<-data.frame(propmb1, propmb2, propmb4, propmb8, propmb16, propmb32)

# ??????data.frame,???propmb?????????landcover????????????
proportion <- data.frame(landcover, propmb1 = propmb_list[[2]], 
                         propmb2 = propmb_list[[3]], propmb4 = propmb_list[[4]],
                         propmb8 = propmb_list[[5]], propmb16 = propmb_list[[6]],
                         propmb32 = propmb_list[[7]])

# ??????data.frame
print(proportion)

rownames(proportion)<-landcover
colnames(proportion) <- c("Resolution 28m", "Resolution 56m", "Resolution 112m", 
                          "Resolution 224m", "Resolution 448m", "Resolution 896m")
print(proportion)

prop<-t(proportion)
print(prop)
class(prop)
prop.df<-data.frame(prop)
class(prop.df)
# ?????????????????????????????????????????????
plot(prop.df[,1], type='o', xlab='Resolution', ylab='Proportion', main='Proportion vs. Resolution, Other Surfaces', xaxt='n')
tics <- c(1, 2, 3, 4, 5, 6)
res <- c("28m", "56m", "112m", "224m", "448m", "896m")
axis(1,at=tics,labels=res)

plot(prop.df[,2], type='o', xlab='Resolution', ylab='Proportion', main='Proportion vs. Resolution, Closed canopy', xaxt='n')
tics <- c(1, 2, 3, 4, 5, 6)
res <- c("28m", "56m", "112m", "224m", "448m", "896m")
axis(1,at=tics,labels=res)

plot(prop.df[,3], type='o', xlab='Resolution', ylab='Proportion', main='Proportion vs. Resolution, Open canopy - tree', xaxt='n')
tics <- c(1, 2, 3, 4, 5, 6)
res <- c("28m", "56m", "112m", "224m", "448m", "896m")
axis(1,at=tics,labels=res)

plot(prop.df[,4], type='o', xlab='Resolution', ylab='Proportion', main='Proportion vs. Resolution, Open canopy - tall shrub', xaxt='n')
tics <- c(1, 2, 3, 4, 5, 6)
res <- c("28m", "56m", "112m", "224m", "448m", "896m")
axis(1,at=tics,labels=res)

plot(prop.df[,5], type='o', xlab='Resolution', ylab='Proportion', main='Proportion vs. Resolution, Open canopy - low shrub', xaxt='n')
tics <- c(1, 2, 3, 4, 5, 6)
res <- c("28m", "56m", "112m", "224m", "448m", "896m")
axis(1,at=tics,labels=res)

plot(prop.df[,6], type='o', xlab='Resolution', ylab='Proportion', main='Proportion vs. Resolution, Barren land', xaxt='n')
tics <- c(1, 2, 3, 4, 5, 6)
res <- c("28m", "56m", "112m", "224m", "448m", "896m")
axis(1,at=tics,labels=res)

# ?????????????????????????????????????????????,???????????????
colnames (proportion) <- c ("res", "res2", "res4", "res8", "res16", "res32")
# ???matplot??????????????????????????????????????????????????????????????????
matplot (t (proportion), type="l", lty=1, col=1:7, xlab="Resolution", ylab="Proportion", xaxt="n")
axis (1, at=1:6, labels=colnames (proportion)) # ?????????x?????????????????????
legend ("topright", legend=rownames (proportion), col=1:6, lty=1, cex=0.8) # ????????????

tics <- c(1, 2, 3, 4, 5, 6)
res <- c("28m", "56m", "112m","224","448","895")

axis(1,at=tics,labels=res)
plot(prop.df$'Closed treed canopy', type='o', xlab='Resolution', ylab='Proportion',main='Proportion vs. Resolution, Closed treed canopy', xaxt='n')
plot(prop.df$'Closed treed canopy', type='o', xlab='Resolution', ylab='Proportion',main='Proportion vs. Resolution, Closed treed canopy', xaxt='n')
plot(prop.df$'Closed treed canopy', type='o', xlab='Resolution', ylab='Proportion',main='Proportion vs. Resolution, Closed treed canopy', xaxt='n')
plot(prop.df$'Closed treed canopy', type='o', xlab='Resolution', ylab='Proportion',main='Proportion vs. Resolution, Closed treed canopy', xaxt='n')



# ???????????????matplot??????????????????????????????????????????????????????????????????
matplot(t(proportion), type="l", lty=1, col=1:7, xlab="Resolution", ylab="Proportion", xaxt="n")
axis(1, at=1:6, labels=colnames(proportion)) # ?????????x?????????????????????
legend(x = "topright", y = 1, legend=rownames(proportion), col=1:6, lty=1, cex=0.4, title="Land Cover", bg="transparent") # ????????????,?????????????????????,????????????

