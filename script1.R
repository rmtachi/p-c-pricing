####
#### P&C pricing project                4 June, 2016

#### current tariff 

### original data, don't alter
moto.origin <- read.csv(file="Team2_Data.csv")

### current tariff only considers four rating factors
moto.curr <- moto.origin[,c("zone","mc","vage","bonus","duration","freq","sev")]

### group vehicle age into 0-1, 2-4, >=5
moto.curr$vage <- ifelse(moto.origin$vage <= 1, 1, 2)
moto.curr$vage[moto.origin$vage >= 5] <- 3

### group bonus into 1-2, 3-4, 5-7
moto.curr$bonus <- ifelse(moto.origin$bonus <= 2, 1, 2)
moto.curr$bonus[moto.origin$bonus >= 5] <- 3

### make into factors
moto.curr$zone <- as.factor(moto.curr$zone)
moto.curr$mc <- as.factor(moto.curr$mc)
moto.curr$vage <- as.factor(moto.curr$vage)
moto.curr$bonus <- as.factor(moto.curr$bonus)

#### aggregate exposure (duration)
aggregate(duration ~ zone + mc + vage + bonus, data=moto.curr, FUN=sum)

?aggregate
