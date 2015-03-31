- obsolete
setImage
	
	| p segments vertices newSegment thePolylines mainPolyline ie |
	self setOutline.
	self outline isNil not
		ifTrue:
			["Recuperation de tous les segments"
			segments := OrderedCollection new.
			self outline
				do:
					[:c | 
					p := self spaceModel elementaryEntities
						detect: [:cc | cc id = c first]
						ifNone: [self halt].
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
					thePolylines remove: mainPolyline.
					self image: mainPolyline asFiller.
					self center: (self at: 1) center.	"le centre de l'agregat correspond au centre du 1er element"
					self includedEntities: Set new.
					thePolylines
						do:
							[:polyL | 
							ie := self class new: self spaceModel.
							ie image: polyL asFiller.
							self includedEntities add: ie]]]