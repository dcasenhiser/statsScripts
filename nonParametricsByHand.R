###Mann Whitney U Test

nA=length(mydf$group[mydf$group=="A"]);nA
nB=length(mydf$group[mydf$group=="B"]);nB

UA=nA*nB+(nA*(nA+1)/2-sum(mydf$rank[mydf$group=="A"]))
UB=nA*nB+(nB*(nB+1)/2-sum(mydf$rank[mydf$group=="B"]))

sumRA=sum(mydf$rank[mydf$group=="A"])
sumRB=sum(mydf$rank[mydf$group=="B"])

MannU=min(c(UA, UB)); MannU


###Wilcoxon Signed-Ranks Test including 0
mydf$difference=mydf$after-mydf$before

mydfNo0=mydf[!mydf$difference==0,] #run to discard zeros

mydf$rank=rank(abs(mydf$difference))

zeroRank=sum(mydf$rank[mydf$difference==0])/2; zeroRank

sumRp=sum(mydf$rank[mydf$difference>0])+zeroRank; sumRp
sumRm=sum(mydf$rank[mydf$difference<0])+zeroRank; sumRm

mydfNo0=mydf[!mydf$difference==0,]

##Kruskal-Wallis
N=length(mydf)
n=length(mydf[mydf$group=="group1"])
T=c(sum(rank(mydf$rank[mydf$group=="group1"])),sum(rank(mydf$rank[mydf$group=="group2"])),sum(rank(mydf$group=="group3")) )

H=12/N*(N+1)*sum(T^2/n)-3(N+1)
