probes - recording
data
	"Returns probes results collected during one simulation"
	"At the moment, data is a dictionary"
	"Should be replaced by DataFrame in the future"
	^data isNil
		ifTrue: [Dictionary new]
		ifFalse: [data]