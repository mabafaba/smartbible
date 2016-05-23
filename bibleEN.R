# bible text in bibleEN.txt.
# list of bible words and replacement strings stored in biblesub.csv
# new bible version is saved as smartcitiesbible.txt



######################################################################################################
#   main code   ######################################################################################
######################################################################################################

#set working directory to source folder
setwd("~/bibler")

#load data:
sublist<-read.csv("biblesub.csv")
sublist<-as.matrix(sublist)
b<-readLines("bibleEN.txt")
#copy the bible (rerun this line to "reset")
b2<-b
#substitute strings
for(i in c(1:nrow(sublist))){b2<-gsub(paste("\\b",sublist[i,'pattern'],sep=''),sublist[i,'sub'], b2, ignore.case = T)}
#export:
writeLines(text = b2,"smartcitiesbible.txt")

print(paste('substituted',nrow(sublist),'unique patterns. New Bible exported to smartcitiesbible.txt'))

str(b2)

######################################################################################################
#   other stuff   ####################################################################################
######################################################################################################

b2la<-b2

booksIds<-(which(sequence(rle(as.character(b2la))$lengths)==4)+1)
testamentIds<-c(2,which(b2=="***")+5)
verseIds<-which(!is.na(as.numeric(substring(b2la, 1, 1))))

beforeBooks<- paste(readLines("beforeBookHeading.tex"),collapse = '\n')
afterBooks<- paste(readLines("afterBookHeading.tex"),collapse = '\n')

b2la[booksIds]<-
  paste(beforeBooks,b2la[booksIds],afterBooks)


# b2la<-b2la[1:400]
LAstart<-readLines('start.tex')
LAend<-readLines('end.tex')
writeLines(c(LAstart,b2la,LAend),'smartcitiesbibleLA.tex')

#print percentage of affected verses
a<-paste(sublist[,'sub'],collapse = "|") 
print(length(grep(a,b2))/length(b2))
#histogram showing which parts of the bible are altered most: 
hist(grep(a,b2),breaks= 1000)






#frequent words to add to the sub list:
# children
# city
# father
# name
# heard
# 
# brethren
# hands
# fear
# voice
# face
# brother

b2[grep("high performance",b2)]

#look up lines containig a certain word to see if possible replacement works well:
# lookupword<-"security system"
# head(b2[which(grepl(lookupword,b2))],n=200)
# library("http")
# library(XML)

#scraping a list of all biblical names from the web:
#this is not in use (yet)
# 
# allnames = array();
# 
# for(letter in letters){
# htmlraw<-htmlTreeParse(paste('http://www.complete-bible-genealogy.com/names/starting_',letter,'.htm',sep=''), useInternal = TRUE)
# html.parse<-xpathApply(htmlraw, "//a", xmlValue)
# names<-unlist(html.parse)
# names<-names[which(names!="")]
# names<-names[!grepl("\\d", names)]
# names<-unlist(strsplit(names, split = ' - '))
# names<-names[c(34:length(names))]
# allnames<-c(allnames,names)
# }
# 

images<-list.files('./img')

