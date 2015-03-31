+ environment - sensing - space
wayTo: aSpatialEntity
	"Purpose: gets the shortest way to another spatial entity
Argument: aSpatialEntity = <SpatialEntity>
Return value: <Collection(SpatialEntity)>
Example: self wayTo: self spaceModel centralLocation"
	
	| path path2 |
	aSpatialEntity isSpatialEntityElement
		ifTrue: [^self wayToCell: aSpatialEntity].
	path := self surround first wayTo: aSpatialEntity surround first.
	self surround
		do:
			[:cell | 
			path2 := aSpatialEntity wayToCell: cell.
			path2 size < path ifTrue: [path := path2]].
	^path