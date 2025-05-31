pollutantmean <- function (directory, pollutant, id = 1:332) {
  sums <- vector(mode = "numeric")
  totalcount <- vector(mode = "numeric")
  for (i in id){
    monitorID <- list.files(directory, pattern = paste(sprintf("%03d", i),".csv", sep = ""), full.names = TRUE)
    monitordata <- read.csv(monitorID)
    pollutantlist <- subset.data.frame(monitordata, subset = !is.na(monitordata[pollutant]), select = pollutant, drop = TRUE)
    sums <- c(sums, sum (pollutantlist))
    totalcount <- c(totalcount, length(pollutantlist))
  }
  meanpollutant <- sum(sums) / sum(totalcount)
  meanpollutant
}