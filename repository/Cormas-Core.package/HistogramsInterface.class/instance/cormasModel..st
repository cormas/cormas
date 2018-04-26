accessing
cormasModel: aModel
	
	cormasModel == aModel
		ifFalse:
			[cormasModel isNil ifFalse: [cormasModel removeDependent: self].
			(cormasModel := aModel) isNil ifFalse: [cormasModel addDependent: self]].
	cormasModel timeStepValue onChangeSend: #refreshAfterStep to: self