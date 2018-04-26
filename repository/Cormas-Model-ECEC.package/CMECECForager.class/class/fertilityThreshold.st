accessing
fertilityThreshold
	"Getter accessor with default value = 100 "
	
	^fertilityThreshold ifNil: [fertilityThreshold := 100]