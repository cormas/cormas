time
finalTime
	^ finalTime ifNil: [ finalTime := self cormasModel class defaultFinalStep ifNil: [ nil]  ]