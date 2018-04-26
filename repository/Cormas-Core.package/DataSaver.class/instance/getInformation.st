private
getInformation
	
	| info |
	^self cormasModel sensitivitySetter isCrossedAnalysis
		ifTrue:
			[info := ''.
			self cormasModel sensitivitySetter parametersToAnalyse
				do: [:cav | info := info , cav asString , ' | '].
			info
				copyFrom: 1
				to: info size - 3]
		ifFalse:
			[self currentParameter isNil
				ifFalse: [self currentParameter asString]
				ifTrue: [' ']]