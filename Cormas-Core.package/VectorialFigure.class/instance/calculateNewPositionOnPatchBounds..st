transforming
calculateNewPositionOnPatchBounds: absolutePatchBounds
	"return the position Point (an absolute Point) where the POV should be placed"
	
	| positionName adaptedPatchBounds absoluteExtent |
	positionName := self model position.
	absoluteExtent := self model bounds extent * self model sizeRatio.	"/ self container scaleFactor"	"(absolutePatchBounds extent / PovSetter standardCellBounds extent)."	"Point when the fig is on a border (positionName starts with #border_) "
	(positionName copyFrom: 1 to: 6) = 'border'
		ifTrue:
			[^(absolutePatchBounds translatedBy: absoluteExtent / -2)
				perform:
					(positionName
						copyFrom: 8
						to: positionName size) asSymbol].	"Otherwise, calculate position INTO the cell"
	adaptedPatchBounds := absolutePatchBounds insetOriginBy: 0 cornerBy:
			absoluteExtent.
	positionName = #random
		ifTrue:
			[^(Cormas
				simpleRandomFrom: adaptedPatchBounds origin x
				to: adaptedPatchBounds corner x)
				@
					(Cormas
						simpleRandomFrom: adaptedPatchBounds origin y
						to: adaptedPatchBounds corner y)].
	^adaptedPatchBounds perform: positionName