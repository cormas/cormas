star testing
isComponentOf: aSpatialEntity 
"Purpose: tests if the receiver belongs to the components of a given compound spatial entity
It will return 'false' if the receiver is a component of a component of aSpatialEntity (cf. belongsToAggregate:)
Argument: aSpatialEntity = <SpatialEntitySet>
Return value: <Boolean>
Example: self isComponentOf: Forest"

	^(self theCSE keys includes: aSpatialEntity name)
		and: [(self theCSE at: aSpatialEntity name) isNil not]