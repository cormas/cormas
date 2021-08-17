Extension { #name : #RSCanvas }

{ #category : #'*Cormas-UI' }
RSCanvas >> removeAllElements [

	self shapes do: [ : s | s remove ].
"	self privateEdges do: [ : e | self removeEdge: e ].
	self privateNodes do: [ : e | self removeNode: e ]."
]
