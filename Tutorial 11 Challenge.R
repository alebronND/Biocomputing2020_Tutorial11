# This function will find the coefficient of variation for each file in a directory (all csv files)
# x is the path of the directory
# y is either TRUE or FALSE, depending on whether or not the file will have headers
# z will be the column number that you will be looking at 
dir=function(x,y,z){
  # this will make a list of all of the csv files in a directory
  files=list.files(path=x,pattern=".csv", all.files=TRUE, full.names=TRUE)
  # Creates the empty vectors to be filled in for each file
  # Coefficient vector contains empty spots for the coefficients of variation to be stored
  coefficient = numeric(length = length(files))
  mean_value=numeric(length=length(files))
  standard_deviation=numeric(length=length(files))
  # this for loop will go through each file and read the table to find coefficient of variation
  for (i in files) { 
    new.table=read.table(i, header=y, stringsAsFactors = FALSE, fill=TRUE, sep=",", na.strings = c("", "NA"))
    # used to omit any NA in the table
    new.table=na.omit(new.table)
    # finds the number of observations in the current file
    observations=nrow(new.table)
    column=new.table[,z]
    # this if statement will check if the file has more than 50 observations
    # if it doesn't it will ask the user if they want to keep going
    # if they say NO, they will exit the function
    if (observations<50) {
      print ("Less than 50 observations")
      decision=readline("Do you want to continue? (yes or no) ")
      if (decision=="yes") {
        standard_deviation[i]=sd(as.numeric(column))
        mean_value[i]=mean(as.numeric(column))
        coefficient[i]=as.numeric(standard_deviation/mean_value)
        # return will place coefficient in global environment
        return(coefficient)
      }
      # this will have the user exit the function
      else if (decision=="no") {
        print ("Please start again when ready")
        break ()
      }
      # this will only happen if the table has more than 50 observations
      else {
        # z will be the number of the column
        standard_deviation[i]=sd(as.numeric(column))
        mean_value[i]=mean(as.numeric(column))
        coefficient[i]=as.numeric(standard_deviation/mean_value)
        #append(all_values, coefficient)
        # return will place coefficient in global environment
        return(coefficient)
      }
      }
  }
  # once the function is done, it will print all done and it will return the all_values vector
  print("all done")
  return(coefficient)
  }
dir("/Users/alebron/Desktop", TRUE, 5)
# btw Laura used my computer to code :) 

