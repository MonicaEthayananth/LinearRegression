#reading the dataset
str(beaver1)
#using r to do linear regression and plotting the results
lsfit(beaver1$time,beaver1$temp)$coefficients
plot(beaver1$time, beaver1$temp, pch=21, 
     bg=c(1:4)[unclass(beaver1$activ)], 
     main="Linear Regression For activity ", xlab="temp ", ylab="time")
abline(lsfit(beaver1$time, beaver1$temp)$coefficients, col="black")
jpeg(file="linear.jpeg")

legend(0,300, c("Activity"), lty=c(1,1), lwd=c(2.5,2.5),col=c("Black")) 
#saving the file
dev.off()
#testing and predicting the data with various graphs
d <- data.frame(x=c(1:3,NA,5:6), y=1:6+rnorm(6))
m1 <- lm(temp~time,data=beaver1)
predict(m1)
summary(m1)
plot(m1)
plot(temp~time, data=beaver1)
abline(m1)
predict(lm,data.frame(testdata),interval = "confidence")
#plot of the values between temperature and the activities of the beaver
m2<-lm(temp~activ,beaver1)
predict(m2)
summary(m2)
plot(m2)
#plot for the temperature of the beaver and the days the temperature is measured
m3<-lm(temp~day,beaver1)
predict(m3)
summary(m3)
plot(m3)
