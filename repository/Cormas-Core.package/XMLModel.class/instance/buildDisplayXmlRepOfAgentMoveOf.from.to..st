xml-rpc
buildDisplayXmlRepOfAgentMoveOf: anAgentLocation from: srcSpatialEntity to: dstSpatialEntity
	"Return an XML-RPC representation of the map for the display method"
	
	| repDisplay repMove |
	repMove := Dictionary new.
	repMove
		at: 'IdAgent'
		put: anAgentLocation id.
	repMove
		at: 'Classe'
		put: anAgentLocation class name.
	srcSpatialEntity isNil
		ifTrue:
			[repMove at: 'Type' put: 'ajoutAgent'.
			repMove
				at: 'Case'
				put: dstSpatialEntity id]
		ifFalse:
			[repMove at: 'Type' put: 'deplacerAgent'.
			repMove
				at: 'From'
				put: srcSpatialEntity id.
			repMove
				at: 'To'
				put: dstSpatialEntity id].
	repDisplay := Dictionary new.
	repDisplay
		at: 'Agents'
		put: (Array with: repMove).
	^repDisplay