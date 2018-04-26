accessing
codeGenerator
	" Answer a code generator binding a reference to the receiver model "

	^ codeGenerator
		ifNil: [ codeGenerator := CGStCormas for: self ]
