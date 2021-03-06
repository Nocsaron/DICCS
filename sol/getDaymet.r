library(DaymetR)
args <- commandArgs(trailingOnly = TRUE)
result <- get.Daymet.tiles(lat1=as.numeric(args[1]),lon1=as.numeric(args[2]),lat2=as.numeric(args[3]),lon2=as.numeric(args[4]),start_yr=as.numeric(args[5]),end_yr=as.numeric(args[6]),param=args[7])
resultpath <- as.character(args[8])
write(result,file=paste(resultpath,'daymet_result',sep='/'))
