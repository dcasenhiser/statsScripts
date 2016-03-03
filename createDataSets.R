##2 Groups Dataframe

set.seed(6789)


##2 Groups with 10 in each group. Group 1 Mean = 50; Group 2 Mean = 40. Both groups have SD of 5
mydf=data.frame(group=c(rep("Group1",10),rep("Group2",10)), scores=c(rnorm(10,50,5),rnorm(10,40,5)))

mydf$group=as.factor(mydf$group) #make sure R knows group is a factor

#####

##3 Groups Dataset

set.seed(6789)
##3 Groups with 100 in each group. Means of 50, 60, 70 with an sd of 10 for each group
mydf=data.frame(group=c(rep("Group1",100),rep("Group2",100),rep("Group3",100)),scores=c(rnorm(100,50,10),rnorm(100,60,10),rnorm(100,70,10)))

mydf$group=as.factor(mydf$group) ##make sure R know group is a factor

###

##4 groups with a column for participant ID
set.seed(6789)

mydf=data.frame(id=rep(1:10,4),cond=c(rep("Cond1",10),rep("Cond2",10),rep("Cond3",10),rep("Cond4",10)), scores=c(rnorm(10,5,.3),rnorm(10,11,.4),rnorm(10,3,.5),rnorm(10,10,.5))); mydf

mydf$cond=as.factor(mydf$cond)

## Get Person totals for the above dataframe and save them to an object called P
P=tapply(mydf$scores,mydf$id,FUN=sum)
