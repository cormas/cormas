+ utilities - mathematics
linearRegression: data
	"Purpose: Return an array containing a, b, and correlation coefficient, that are the parameters of the linear 	regression of a set of data, where y = a + bx.
Argument: data is supposed to be a List of Array ( x,y) : data = <Collection (Array 2)>
Example: Cormas linearRegression: #(#(1 2) #(5 2) #(5 4) #(10 9) #(1 1) #(2 2))   ->  #(0.2 0.783333 0.921746)"
	
	| sumX sumY sumX2 sumY2 n marginalMeanX marginalMeanY sumDiffX2 sumDiffXY diffX diffY diffXY covariance marginalVarianceX b a correlationCoefficient sumDiffY2 |
	sumX := 0.
	sumY := 0.
	sumX2 := 0.
	sumY2 := 0.
	n := data size.
	data
		do:
			[:couple | 
			sumX := sumX + couple first.
			sumY := sumY + (couple at: 2).
			sumX2 := sumX2 + couple first squared.
			sumY2 := sumY2 + (couple at: 2) squared].
	marginalMeanX := sumX / n.
	marginalMeanY := sumY / n.
	sumDiffX2 := 0.
	sumDiffY2 := 0.
	sumDiffXY := 0.
	data
		do:
			[:couple | 
			diffX := couple first - marginalMeanX.
			sumDiffX2 := sumDiffX2 + diffX squared.
			diffY := (couple at: 2) - marginalMeanY.
			sumDiffY2 := sumDiffY2 + diffY squared.
			diffXY := diffX * diffY.
			sumDiffXY := sumDiffXY + diffXY].
	covariance := sumDiffXY / n.
	marginalVarianceX := sumDiffX2 / n.
	b := covariance / marginalVarianceX.
	a := marginalMeanY - (b * marginalMeanX).
	correlationCoefficient := covariance
		/ ((sumDiffX2 / n) sqrt * (sumDiffY2 / n) sqrt).
	^Array
		with: a asFloat
		with: b asFloat
		with: correlationCoefficient asFloat