Extension { #name : #RSCanvas }

{ #category : #'*Cormas-UI-Roassal3' }
RSCanvas >> removeAllElements [

	self shapes do: [ : s | s remove ].
"	self privateEdges do: [ : e | self removeEdge: e ].
	self privateNodes do: [ : e | self removeNode: e ]."
]
