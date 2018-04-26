callbacks
openPovSetterGUI

	| setter |
	
	self cormasModelClass isNil ifTrue: [ ^ self alertMessage: self translator tNoModel ].
	self cormasModelClass cellClass isNil ifTrue: [ ^ self alertMessage: self translator tWhichAttribute ].
	setter := CMSpecPovSetterNotebook openFor: self projectManager.
