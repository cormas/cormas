"
Please note the following possible problems:
	CormasNS.Kernel.SpatialEntityNotConnex has not been commented yet.


"
Class {
	#name : #CMSpatialEntityNotConnex,
	#superclass : #CMSpatialEntitySet,
	#category : #'Cormas-Core-Entities'
}

{ #category : #displaying }
CMSpatialEntityNotConnex >> getSkinE [
	"Returns a collection of cells belonging to the 'internal skin' of the aggregate"
	
	| elementaryComponents |
	elementaryComponents := self elementaryComponents.
	^elementaryComponents
		select:
			[:c | 
			(c neighbourhood anySatisfy: [:n | (elementaryComponents includes: n) not])
				or: [c edge]]
]

{ #category : #'initialize-release' }
CMSpatialEntityNotConnex >> initEdge [
	
	self edge: (self components anySatisfy: #edge)
]

{ #category : #obsolete }
CMSpatialEntityNotConnex >> setImage [

	"a collec of components images"

	| collec |
	collec := OrderedCollection new.
	self components do: [ :c | 
		c image ifNil: [ c setImage ].
		collec add: c image ].
	self image: collec
]

{ #category : #displaying }
CMSpatialEntityNotConnex >> setOutline [
	"original setOutline method for SptialEntityNotConnex
	self outline: Set new.
	self components do:[:aComponent | self outline addAll: aComponent outline].
	^self outline"
	"clp mars 2000 : setOutline for SpatialEntityAggregate copied to SptialEntityNotConnex"
	
	| directions |
	"outline est une collection de couples de valeurs (id de cellule; collection de directions)"
	self outline: Set new.
	self getSkinE
		do:
			[:c | 
			directions := Set new.
			directions addAll: c boundaryDirections.
			(c neighbourhood
				select: [:cc | (self elementaryComponents includes: cc) not])
				do: [:on | directions add: (c directionNeighbour: on)].
			self outline
				add:
					(Array
						with: c id
						with: directions)]
]

{ #category : #'initialize-release' }
CMSpatialEntityNotConnex >> setSurround [
	
	self components first isSpatialEntityElement ifTrue: [^super setSurround].
	self surround: Set new.
	self components
		do: [:aComponent | self surround addAll: aComponent surround].
	self surround: self surround asOrderedCollection.
	^self surround
]

{ #category : #metrics }
CMSpatialEntityNotConnex >> surface [
	"Purpose: returns the number of elementary components
Return value: <Integer>"
	
	| surface |
	surface := 0.
	self components do: [:n1 | surface := surface + n1 surface].
	^surface
]
