accessing
catabolicRate
	"Getter accessor with default value = 2 "
	
	^catabolicRate ifNil: [catabolicRate := 2]