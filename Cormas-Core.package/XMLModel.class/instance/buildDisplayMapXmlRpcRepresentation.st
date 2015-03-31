xml-rpc
buildDisplayMapXmlRpcRepresentation
	"Return an XML-RPC representation of the map for the display method"
	
	| spaceModel repMap repDisplay |
	spaceModel := model spaceModel.
	repMap := spaceModel elementaryEntities
		collect:
			[:entity | 
			| repCell |
			repCell := Dictionary new.
			attributes
				do:
					[:att | 
					| value |
					value := entity perform: (att at: #name) asSymbol.
					repCell
						at: (att at: #id)
						put:
							(value isNil
								ifTrue: ['nil']
								ifFalse: [value printString])].
			repCell].
	repDisplay := Dictionary new.
	repDisplay at: 'Carte' put: repMap.
	^repDisplay