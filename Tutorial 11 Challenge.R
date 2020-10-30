dir=function(x,y,z){
  all_values=c()
  files=list.files(path=x,pattern=".csv", all.files=TRUE, full.names=TRUE)
  files
  for (i in files) { 
    new.table=read.table(i, header=y, stringsAsFactors = FALSE)
    observations=nrow(new.table)
    if (observations<50) {
      print ("Less than 50 observations")
      decision=readline("Do you want to continue? (yes or no) ")
      if (decision=="yes") {
        standard_deviation=sd("file_column")
        mean_value=mean("file_column")
        coefficient=coefficient.variation(standard_deviation, mean_value)
        append("all_values","coefficient")}
      else if (decision=="no") {
        print ("Please start again when ready")
        break ()
      }}
      else {
        # z will be the number of the column
        file_column=i[,z]
        standard_deviation=sd("file_column")
        mean_value=mean("file_column")
        coefficient=coefficient.variation(standard_deviation, mean_value)
        append("all_values","coefficient")}
      }
      
    }


dir("/Users/alebron/Biocomputing2020_Tutorial11", TRUE, 1  )

