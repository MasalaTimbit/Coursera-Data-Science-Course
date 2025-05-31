corr <- function (directory, threshold = 0){
  correlations <- numeric()
  monitorlist <- list.files(directory, all.files = TRUE, full.names = TRUE, pattern = ".csv")
  for (monitor in monitorlist){
    monitordata <- read.csv(monitor)
    monitordata <- subset.data.frame(
      monitordata,
      subset = !is.na(monitordata[,2]) & !is.na(monitordata[,3]),
      select = c(sulfate, nitrate))
    id <- which(monitor == monitorlist)
    observations <- complete(directory, id)
    if (observations$nobs > threshold){
      correlations <- c(correlations, cor(x = monitordata$nitrate, y = monitordata$sulfate))
    }
  }
  correlations
}