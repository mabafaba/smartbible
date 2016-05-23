bestplaceforent = function(m){
  bestE<-0
  bestspot<--1
  for(i in c(1:length(m))){
    m1<-m
    m1[i]<-m1[i]+1
    p<-(as.vector(table(m1)))/as.numeric(sum(table(m1)))
    thisE<- -sum(p*log(p))
    if(thisE>bestE){
    bestE<-thisE
    bestspot<-i
    }else if(thisE==bestE){
    bestspot<-c(bestspot,i)
    }
  }
return(sample(x = bestspot,size = 1))
}

m<-matrix(c(1),50,50)
par(mfrow=c(1,2))
for(j in c(1:300)){
bp<-bestplaceforent(m)
m[bp]<-m[bp]+1
}
plot(hist(m,breaks=max(m)))
m
bp<-bestplaceforent(m)
m[bp]<-m[bp]+1
image(m)
m
bestplaceforent(m)
warnings()
