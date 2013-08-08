data <- iris # load data 'iris'
labels <- data$Species # move labels to not affect learning
data$Species <- NULL # erase labels from working data
set.seed(1) # set non-random randomness
train.pct <- 0.7 # partition training data
N <- nrow(data) # remember how many rows there are
train.index <- sample(1:N, train.pct * N) 
# train index is a sample of fields 1:150, selecting 0.7 * 150
train.data <- data[train.index, ]
test.data <- data[-train.index, ]
train.labels <- as.factor(as.matrix(labels)[train.index, ])
# train.data turned into factors (ie 1,2,3) - selected from train.index
# index allows the data to be brought back together
test.labels <- as.factor(as.matrix(labels)[-train.index, ])
# test.data turned into factors selected inverse of train.index
err.rates <- data.frame() #creates new data frame

max.k <- 50
for (k in 1:max.k) { 
	knn.fit <- knn(train = train.data, test = test.data, cl=train.labels, k=k) 
	#save to knn.fit knn data knn() using parameters
	# train = train.data, test = test.data, cl = factor of classification with k 1:max.k(100)
	cat ('\n', 'k= ', k, ', train.pct=', train.pct, '\n', sep='')
	# -> k= 100, train.pct=0.7
	print(table(test.labels, knn.fit)) # print confusion matrix
	this.err <- sum(test.labels != knn.fit) / length(test.labels)
	err.rates <- rbind(err.rates, this.err) 
}

results <- data.frame(1:max.k, err.rates)
names(results) <- c('k', 'err.rate')
title <- paste('knn results (train.pct = ', train.pct, ')', sep='')

results.plot <- ggplot(results, aes(x = k, y=err.rate)) + geom_point() + geom_line()
results.plot <- results.plot + ggtitle(title)
print(results.plot)
results.plot <- ggplot(results, aes(x=k, y=err.rate)) + geom_smooth() + ggtitle(title)
print(results.plot)