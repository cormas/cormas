Extension { #name : #RTElement }

{ #category : #'*Cormas-UI' }
RTElement >> logCormasImageTo: aFileStream [
	" Write position information into aFileStream "

	| entityPatch |
	
	entityPatch := self model patch.
	aFileStream 
		<< entityPatch numCol asString;
		space;
		<< entityPatch numLine asString;
		cr;
		flush.
]

{ #category : #'*Cormas-UI' }
RTElement >> relocateCormasEntity: cellSize [ 

	self translateTo: (self model patch numCol @ self model patch numLine) * cellSize.
]
