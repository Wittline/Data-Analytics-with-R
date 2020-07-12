

install.packages("tidyverse")
install.packages("cluster")
install.packages("factoextra")
install.packages("NbClust") 
install.packages("jpeg") 
library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization
library("jpeg")
library(ggplot2)
library(NbClust)

justin <-readJPEG("justin.jpg")

dimension <- dim(justin)

"""### **Getting the RGB values of the image**"""

RGB <- data.frame(
  x_axis = rep(1:dimension[2], each = dimension[1]),
  y_axis = rep(dimension[1]:1, dimension[2]),
  Red = as.vector(justin[,,1]),
  Green = as.vector(justin[,,2]),
  Blue = as.vector(justin[,,3])
)

"""### **Plotting the RGB values**"""

ggplot(data = RGB, aes(x = x_axis, y = y_axis)) +
  geom_point(colour = rgb(RGB[c("Red", "Green", "Blue")])) +
  labs(title = "Original justin") +
  xlab("x-axis") +
  ylab("y-axis")

set.seed(123)

k2 <- kmeans(RGB[c(3,4,5)], centers = 2, iter.max = 25, nstart = 1)
k3 <- kmeans(RGB[c(3,4,5)], centers = 3, iter.max = 25, nstart = 1)
k4 <- kmeans(RGB[c(3,4,5)], centers = 4, iter.max = 25, nstart = 1)
k5 <- kmeans(RGB[c(3,4,5)], centers = 5, iter.max = 25, nstart = 1)
k6 <- kmeans(RGB[c(3,4,5)], centers = 6, iter.max = 25, nstart = 1)
k7 <- kmeans(RGB[c(3,4,5)], centers = 7, iter.max = 25, nstart = 1)
k8 <- kmeans(RGB[c(3,4,5)], centers = 8, iter.max = 25, nstart = 1)
k9 <- kmeans(RGB[c(3,4,5)], centers = 9, iter.max = 25, nstart = 1)
k10 <- kmeans(RGB[c(3,4,5)], centers = 10, iter.max = 25, nstart = 1)

# plots to compare
p1 <- fviz_cluster(k2, geom = "point", data = RGB[c(3,4,5)]) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point",  data = RGB[c(3,4,5)]) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point",  data = RGB[c(3,4,5)]) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point",  data = RGB[c(3,4,5)]) + ggtitle("k = 5")
p5 <- fviz_cluster(k6, geom = "point", data = RGB[c(3,4,5)]) + ggtitle("k = 6")
p6 <- fviz_cluster(k7, geom = "point",  data = RGB[c(3,4,5)]) + ggtitle("k = 7")
p7 <- fviz_cluster(k8, geom = "point",  data = RGB[c(3,4,5)]) + ggtitle("k = 8")
p8 <- fviz_cluster(k9, geom = "point",  data = RGB[c(3,4,5)]) + ggtitle("k = 9")
p9 <- fviz_cluster(k10, geom = "point",  data = RGB[c(3,4,5)]) + ggtitle("k = 10")

library(gridExtra)
grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, nrow = 3, ncol=3)

set.seed(123)

#compute total within-cluster sum of square 
wss <- function(k) {
  kmeans(RGB[c(3,4,5)], k, iter.max = 25, nstart = 1 )$tot.withinss
}

#wss for k = 1 to k = 15
k.values <- 1:15

# wss for 2-15 clusters
wss_values <- map_dbl(k.values, wss)

plot(k.values, wss_values,
       type="b", pch = 19, frame = FALSE, 
       xlab="clusters K",
       ylab="wss-clusters sum of squares")

k_cluster <- 3
k_clstr <- kmeans(RGB[, c("Red", "Green", "Blue")],
                      centers = k_cluster)
kcolors <- rgb(k_clstr$centers[k_clstr$cluster,])

ggplot(data = RGB, aes(x = x_axis, y = y_axis)) +
  geom_point(colour = kcolors) +
  labs(title = paste("k-Means Clustering of", k_cluster, "Colours")) +
  xlab("x") +
  ylab("y")

k_cluster <- 4
k_clstr <- kmeans(RGB[, c("Red", "Green", "Blue")],
                      centers = k_cluster)
kcolors <- rgb(k_clstr$centers[k_clstr$cluster,])

ggplot(data = RGB, aes(x = x_axis, y = y_axis)) +
  geom_point(colour = kcolors) +
  labs(title = paste("k-Means Clustering of", k_cluster, "Colours")) +
  xlab("x") +
  ylab("y")

k_cluster <- 5
k_clstr <- kmeans(RGB[, c("Red", "Green", "Blue")],
                      centers = k_cluster)
kcolors <- rgb(k_clstr$centers[k_clstr$cluster,])

ggplot(data = RGB, aes(x = x_axis, y = y_axis)) +
  geom_point(colour = kcolors) +
  labs(title = paste("k-Means Clustering of", k_cluster, "Colours")) +
  xlab("x") +
  ylab("y")

k_cluster <- 6
k_clstr <- kmeans(RGB[, c("Red", "Green", "Blue")],
                      centers = k_cluster)
kcolors <- rgb(k_clstr$centers[k_clstr$cluster,])

ggplot(data = RGB, aes(x = x_axis, y = y_axis)) +
  geom_point(colour = kcolors) +
  labs(title = paste("k-Means Clustering of", k_cluster, "Colours")) +
  xlab("x") +
  ylab("y")

k_cluster <- 7
k_clstr <- kmeans(RGB[, c("Red", "Green", "Blue")],
                      centers = k_cluster)
kcolors <- rgb(k_clstr$centers[k_clstr$cluster,])

ggplot(data = RGB, aes(x = x_axis, y = y_axis)) +
  geom_point(colour = kcolors) +
  labs(title = paste("k-Means Clustering of", k_cluster, "Colours")) +
  xlab("x") +
  ylab("y")

k_cluster <- 8
k_clstr <- kmeans(RGB[, c("Red", "Green", "Blue")],
                      centers = k_cluster)
kcolors <- rgb(k_clstr$centers[k_clstr$cluster,])

ggplot(data = RGB, aes(x = x_axis, y = y_axis)) +
  geom_point(colour = kcolors) +
  labs(title = paste("k-Means Clustering of", k_cluster, "Colours")) +
  xlab("x") +
  ylab("y")