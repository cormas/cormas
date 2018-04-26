xml-rpc
buildDisplayXmlRepOfAgentLeaveOf: anAgentLocation from: srcSpatialEntity
	"Return an XML-RPC representation of the map for the display method"
	
	| repDisplay repMove |
	repMove := Dictionary new.
	repMove
		at: 'IdAgent'
		put: anAgentLocation id.
	repMove
		at: 'Classe'
		put: anAgentLocation class name.
	repMove at: 'Type' put: 'supprAgent'.
	repMove
		at: 'Case'
		put: srcSpatialEntity id.
	repDisplay := Dictionary new.
	repDisplay
		at: 'Agents'
		put: (Array with: repMove).
	^repDisplay