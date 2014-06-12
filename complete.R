complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        
        
        
        
        
}

## Get the complete cases for ALL rows
test<-complete.cases(dfPolDataAll)

## Get the row count of all complete cases for a particular ID
nobs <- nrow(dfPolDataAll[test & dfPolDataAll$ID == 2,])

## this sum of TRUE works too because T = 1 and F = 0
nobs <- sum(complete.cases(dfPolData2))

## Make a data frame with the 2 data elements
dftest <- data.frame(id=2, nobs)
