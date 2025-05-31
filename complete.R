complete <- function (directory, id = 1:332) {
  
  observations <- data.frame(id = character(), nobs = numeric())
  
  for (i in id){
    totaldata <- 0
    monitorID <- list.files(directory, pattern = paste(sprintf("%03d", i),".csv", sep = ""), full.names = TRUE)
    monitordata <- read.csv(monitorID)
    pollutantdata <- subset.data.frame(
      monitordata,
      subset = !is.na(monitordata[,2]) & !is.na(monitordata[,3]),
      select = c(sulfate, nitrate))
    totaldata <- mean(colSums(!is.na(pollutantdata)))
    newrow <- data.frame(id = i, nobs = totaldata)
    observations <- rbind(observations, newrow)
  }
  observations
}