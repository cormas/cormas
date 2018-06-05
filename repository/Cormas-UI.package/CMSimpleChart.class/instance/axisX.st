public - axis
axisX
	| s |
	s := super axisX.
	axisConfigurationX noDecimal.
	axisConfigurationX numberOfLabels: ((cormasModel timeStep max: 2) min: 10).
	^ s