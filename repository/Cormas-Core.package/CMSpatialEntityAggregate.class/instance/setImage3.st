- obsolete
setImage3
	
	| p segments vertices newSegment thePolylines mainPolyline directions includedNeighCells |
	self spaceModel gridCellShape = #irregular
		ifTrue: [^self setImageFromIrregularCells].
	directions := Set new.
	self getSkinE
		do:
			[:cell | 
			"im := cell image component translatedBy: cell center.
			cell view model delimiter ifTrue: [d := 1] ifFalse: [d := 0].
			^LineSegment from: (im bottomRight translatedBy: d @ d)
				to: (im bottomLeft translatedBy: 0 @ d)"
			"directions := cell boundaryDirections copy asSet.
				includedNeighCells := cell neighbourhood select: [:n | self containsCell: n].
				includedNeighCells do: [:n | directions := directions - n boundaryDirections].
				self outline addAll: directions"
			directions := Set new.
			directions addAll: cell boundaryDirections.
			(cell neighbourhood
				select: [:cc | (self elementaryComponents includes: cc) not])
				do: [:on | directions add: (cell directionNeighbour: on)].
			self outline
				add:
					(Array
						with: cell id
						with: directions)].	"Recuperation de tous les segments"
	self outline isNil not
		ifTrue:
			[segments := OrderedCollection new.
			self outline
				do:
					[:c | 
					p := self view model elementaryEntities at: c first.
					c last
						do:
							[:dir | 
							newSegment := p perform: ('lineSegment' , dir asString , 'f') asSymbol.
							newSegment isNil ifFalse: [segments add: newSegment]]].	"Il faut ensuite les recoudre...pour creer les vertices des polylines"
			thePolylines := OrderedCollection new.
			[segments isEmpty]
				whileFalse:
					[vertices := self joinSegments: segments.
					(vertices isNil not and: [vertices isEmpty not])
						ifTrue: [thePolylines add: (Polyline vertices: vertices)]].	"Creation de l'image, mise a jour affichage si necessaire"
			thePolylines isEmpty
				ifFalse:
					[thePolylines := thePolylines
						asSortedCollection: [:a :b | a vertices size > b vertices size].
					mainPolyline := thePolylines first.
					thePolylines remove: mainPolyline.	"Controle si le mainPolyline ne contient pas d'autres polylines (cas connexite = 8)"	"Marche pas trop ! Voir avec example de Geometric :
	comp := CompositePart new.
	comp add: g1. <Wapper>
	comp add: g2.
	win component: (BoundedWrapper on: comp)."
					thePolylines isEmpty
						ifFalse:
							[| extension |
							extension := thePolylines.
							[extension isEmpty]
								whileFalse:
									[extension := Set new.
									thePolylines
										do:
											[:pol | 
											pol
												verticesDo:
													[:pt | 
													(mainPolyline vertices contains: [:ptm | ptm = pt])
														ifTrue: [extension add: pol]]].
									extension
										do:
											[:poly | 
											| v |
											v := mainPolyline vertices asOrderedCollection.
											v addAll: poly vertices.
											mainPolyline := Polyline vertices: v.
											thePolylines remove: poly]]].
					self includedEntities: Set new.
					self image: mainPolyline.	"le centre de l'agregat correspond au centre du 1er element"
					self center: (self at: 1) center.
					self includedEntities addAll: thePolylines]]