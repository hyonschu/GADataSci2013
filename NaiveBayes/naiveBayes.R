> library("e1071")
Loading required package: class
> data(iris)
> classifier<-naiveBayes(iris[,1:4], iris[,5])
> table(predict(classifier, iris[,-5]), iris[,5], dnn=list('predicted','actual'))
            actual
predicted    setosa versicolor virginica
  setosa         50          0         0
  versicolor      0         47         3
  virginica       0          3        47
> classifier$apriori classifier$tables$Petal.Length
Error: unexpected symbol in "classifier$apriori classifier"
> plot(function(x) dnorm(x, 1.462, 0.1736640), 0, 8, col="red", main="Petal length distribution for the 3 different species")
> classifier$tables$Petal.Length
            Petal.Length
iris[, 5]     [,1]      [,2]
  setosa     1.462 0.1736640
  versicolor 4.260 0.4699110
  virginica  5.552 0.5518947
> plot(function(x) dnorm(x, 1.462, 0.1736640), 0, 8, col="red", main="Petal length distribution for the 3 different species")
> curve(dnorm(x, 4.260, 0.4699110), add=TRUE, col="blue")
> curve(dnorm(x, 5.552, 0.5518947 ), add=TRUE, col = "green")
> 
