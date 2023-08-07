"
Comment from VW implementation of CMSpaceModel>>distanceFromCell:toCell:

If nbLines is odd, 
	dist = nbLines if nbCols < (nbLines + 1)/ 2    otherwise
	dist = nbLines + (2.nbCols - nbLines - 1)/ 2
If nbLines is even, 
	dist = nbLines if nbCols < nbLines/ 2           otherwise
	dist = nbLines + (2.nbCols - nbLines)/ 2

explications:  

a) dL impaire
dist = dL en g√©n√©rale, sauf qd on s'√©loigne d'une droite oblique:
D0 : dL > 2.dC -3
D1 : dL = 2.dC-3  alors on ajoute 1 
D2 : dL = 2.dC-5  alors on ajoute 2 
D3 : dL = 2.dC-7  alors on ajoute 3 
...
Dt : dL = 2.dC-(1+2t)   t est l'incr√©ment.
alors: t = (2.dC -1 - dL)/2
donc : 
dist = dL + [ 0 ou (2.dC - dL -1) / 2 si c'est positif]

b) dL paire :
dist = dL en g√©n√©rale, sauf qd on s'√©loigne d'une droite oblique:
D0 : dL > 2.dC - 2
D1 : dL = 2.dC-2  alors on ajoute 1 
D2 : dL = 2.dC-4  alors on ajoute 2 
D3 : dL = 2.dC-6  alors on ajoute 3 
...
Dt : dL = 2.dC-(2t)   t est l'incr√©ment.
alors: t = (2.dC - dL)/2
donc : 
dist = dL + [ 0 ou (2.dC - dL) / 2 si c'est positif] 
bon en fait √ßa ne marche pas :
il faut aussi rajouter 1 √† dC qd dL est impaire...""

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMSpace6Neighbourhood,
	#superclass : #CMNonSquaredSpaceNeighbourhood,
	#category : #'Cormas-Core-Space'
}

{ #category : #'private - accessing' }
CMSpace6Neighbourhood class >> cardinal [

	^ 6
]

{ #category : #'private - accessing' }
CMSpace6Neighbourhood class >> cardinalSymbol [

	^ #six
]

{ #category : #accessing }
CMSpace6Neighbourhood class >> distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols [
	" for irregular cells, the calculus is much more longer "
	" See class side comment "
	| columns |
	
	columns := nbCols.
	^ nbLines odd
		ifTrue: [ 
			"celui des 2 qui est √† droite, s'il est sur la partie droite de sa colonne  (ligne impaire), je rajoute 1 √† dC"
			cell1 columnNumber > cell2 columnNumber
				ifTrue: [ cell1 rowNumber odd
								ifTrue: [ columns := columns + 1 ] ]
				ifFalse: [ cell2 rowNumber odd
								ifTrue: [ columns := columns + 1 ] ].
			nbLines + (0 max: (2 * columns - nbLines - 1) / 2) ]
		ifFalse: [ nbLines + (0 max: (2 * columns - nbLines) / 2) ]
]

{ #category : #accessing }
CMSpace6Neighbourhood >> createCellsFigure [

	super createCellsFigure.
	self spaceModel createHexagonalCellsFigure.
]

{ #category : #'private - regular cells - instance creation' }
CMSpace6Neighbourhood >> eastCellHexa: k [
	
	k = 0 ifTrue: [ ^ 0 ].
	^ k < self column | ((k - 1) // self column + 1) odd
		ifTrue: [ k ] "ligne impaire ou premiere"
		ifFalse: [ self eastCell: k ] "ligne paire"
]

{ #category : #initialization }
CMSpace6Neighbourhood >> initializeOrderedNeighbourhood: k [

	| v i |
	v := Array new: 6.
	(i := self westCellHexa: (self northCell: k)) > 0 ifTrue: [ 
		v at: 1 put: (self elementaryEntitiesAt: i) ].
	(i := self westCell: k) > 0 ifTrue: [ 
		v at: 2 put: (self elementaryEntitiesAt: i) ].
	(i := self westCellHexa: (self southCell: k)) > 0 ifTrue: [ 
		v at: 3 put: (self elementaryEntitiesAt: i) ].
	(i := self eastCellHexa: (self southCell: k)) > 0 ifTrue: [ 
		v at: 4 put: (self elementaryEntitiesAt: i) ].
	(i := self eastCell: k) > 0 ifTrue: [ 
		v at: 5 put: (self elementaryEntitiesAt: i) ].
	(i := self eastCellHexa: (self northCell: k)) > 0 ifTrue: [ 
		v at: 6 put: (self elementaryEntitiesAt: i) ].
	^ (self elementaryEntitiesAt: k) orderedNeighbourhood: v
]

{ #category : #initialization }
CMSpace6Neighbourhood >> setBoundaryDirectionsFor: aCMSpatialEntityElement [

	| dirCollection |
	dirCollection := Set new.
	aCMSpatialEntityElement neighbourW ifNil: [ dirCollection add: #W ].
	aCMSpatialEntityElement neighbourE ifNil: [ dirCollection add: #E ].
	aCMSpatialEntityElement neighbourNE ifNil: [ dirCollection add: #NE ].
	aCMSpatialEntityElement neighbourSE ifNil: [ dirCollection add: #SE ].
	aCMSpatialEntityElement neighbourNW ifNil: [ dirCollection add: #NW ].
	aCMSpatialEntityElement neighbourSW ifNil: [ dirCollection add: #SW ].
	^ dirCollection
]

{ #category : #'private - regular cells - instance creation' }
CMSpace6Neighbourhood >> westCellHexa: k [
	
	k = 0 ifTrue: [ ^ 0 ].
	^ k < self column | ((k - 1) // self column + 1) odd
		ifTrue: [ self westCell: k ] "ligne impaire ou premiere"
		ifFalse: [ k ] "ligne paire"
]
