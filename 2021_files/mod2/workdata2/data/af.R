## Create two populations:

pop1 <- sample(c('AA', 'Aa', 'aa'), 100, replace=TRUE)
pop2 <- sample(c('AA', 'Aa', 'aa'), 100, replace=TRUE)




## Create a set of coordinates for the 100 individuals
xcoord1 <- runif(100, 0, 1)
ycoord1 <- runif(100, 0, 1)

xcoord2 <- runif(100, 0, 1)
ycoord2 <- runif(100, 0, 1)



## Plot two populations
### Pop 1
pdf('pop1_test.pdf', width=8, height=8)

plot(xcoord1, ycoord1, col='red', cex=1, pch=16, xlab='X-coord', ylab='Y-coord', main='Population 1', axes=F)
text(xcoord1, ycoord1, labels=pop1, pos=1, cex=0.5)
box()


dev.off()


### Pop 2
pdf('pop2_test.pdf', width=8, height=8)

plot(xcoord2, ycoord2, col='blue', cex=1, pch=16, xlab='X-coord', ylab='Y-coord', main='Population 2', axes=F)
text(xcoord2, ycoord2, labels=pop2, pos=1, cex=0.5)
box()


dev.off()





## Plot frequencies

freqA <- c(0.24, 0.85)
freqa <- c(0.76, 0.15)

pdf('freq_test.pdf', width=8, height=8)

plot(c(1,2), freqA, pch=16, cex=3, col='red', xlab='Populations', ylab='Allele Frequencies', xlim=c(0,3), ylim=c(0,1), main="Frequencies of Alleles A & a in 2 Populations")
box()

points(c(1,2), freqa, pch=16, cex=3, col='blue')

dev.off()














