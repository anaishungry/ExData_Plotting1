####Download the file and extract 2007-02-01 and 2007-02-02 data ()
#data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,comment.char="",rowIndex=4000:4200)
data<- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
head(data)

#####
####Make 2nd plot
with(data, plot(Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowats)",xaxt="n"))
axis(1, at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()