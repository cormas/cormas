accessing
validateCormasModelName: modelName
	" Answer a <String> with modelName as valid Smalltalk class name "

	| validClassName |
	
	(validClassName := self codeGenerator validateClassName: modelName) ~= modelName
		ifTrue: [ self alertMessage: self translator tModifiedModelName  ].
	^ validClassName