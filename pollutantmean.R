# dfPolData = read.csv('./specdata/001.csv')
# dfPolData2 = read.csv('./specdata/002.csv')
# dfPolDataAll <- rbind(dfPolData,dfPolData2)
# dir("./specdata")
# 
# #the whole dataframe (first 100 rows)
# dfPolData[!(is.na(dfPolData$nitrate)),][1:100,]
# 
# #the whole dataframe with another parameter (all rows)
# dfPolDataAll[!(is.na(dfPolDataAll$nitrate)) & dfPolDataAll$ID == 1,]
# 
# #just the vector 
# vMeasuresForMean <- 
#    dfPolDataAll$nitrate[!(is.na(dfPolDataAll$nitrate)) & dfPolDataAll$ID == 1] 
# 
# 
# #compute the mean
# mean(vMeasuresForMean)


pollutantmean <- function(directory, pollutant='nitrate', id = 1:332) {
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        ## Format the directory
        directory <- paste('./',directory,'/',sep='')
        
        ## initialize a dataframe
        dfPolDataAll <- data.frame(matrix(vector(), 0, 4, dimnames=list(c(), 
                c("Date", "sulfate", "nitrate", "ID"))), stringsAsFactors=F)
        
        ##########  Read the .csv's and combine to one dataframe
        
        ## Get a list of filenames from the directory
        filenames <- dir(directory)
        
        ## Loop through files and combine data
        for (i in 1:length(filenames)){
                #print.default(paste(directory, filenames[i], sep=''))
                dfTemp <- read.csv(paste(directory, filenames[i], sep=''))
                dfPolDataAll <- rbind(dfPolDataAll,dfTemp)
        }
        
        #print(nrow(dfPolDataAll))

        # just the vector of the specified pollutant
        vMeasuresForMean <- 
             dfPolDataAll[[pollutant]][!(is.na(dfPolDataAll[[pollutant]])) 
             & dfPolDataAll$ID %in% id]

        ## Return the mean
        return(mean(vMeasuresForMean))        

        ## Clean up
        rm(dfTemp)
}