corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        ## Format the directory
        directory <- paste('./',directory,'/',sep='')
        
        ## initialize a vector
        vCors <- numeric()
        
        ##########  Read the .csv's and build a vector
        
        ## Get a list of filenames from the directory
        filenames <- dir(directory)
        
        ## Loop through files and combine data
        for (i in 1:length(filenames)){
                #print.default(paste(directory, filenames[i], sep=''))
                dfTemp <- read.csv(paste(directory, filenames[i], sep=''))
                
                ## Remove incomplete cases
                dfClnTemp <- dfTemp[complete.cases(dfTemp),]
                
                ## Build the result vector
                if (nrow(dfClnTemp) >= threshold){
                        nCor <- cor(dfClnTemp$sulfate,dfClnTemp$nitrate)
                        vCors <- append(vCors,nCor)  
                }
                
        }
        
        ## Clean up
        rm(dfTemp)
        
        ## Return the vector
        return(vCors)
        
        
}