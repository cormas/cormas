transforming
calculateNewPositionOnPatchBounds: patchBounds
	"return the position Point where the POV should be placed"
	
	| positionName adaptedPatchBounds diagonal origin |
	positionName := self model position.	"	positionName = #topLeft ifTrue: [^patchBounds topLeft]."
	diagonal := self bounds extent * self model sizeRatio.
	origin := 0 @ 0.
	Dev todo:
			'trop p√©nible cet histoire de placement d un bitmap. A revoir....'.	"	(diagonal x > patchBounds extent x) ifTrue:[origin x: diagonal x - 5].
	(diagonal y > patchBounds extent y) ifTrue:[origin y: diagonal y - 5]."	"Point when the fig is on a border (positionName starts with #border_) "
	(positionName copyFrom: 1 to: 6) = 'border'
		ifTrue:
			[^(patchBounds translatedBy: diagonal / -2)
				perform:
					(positionName
						copyFrom: 8
						to: positionName size) asSymbol].	"otherwise, into the cell"
	adaptedPatchBounds := patchBounds insetOriginBy: origin cornerBy: diagonal.	"adaptedPatchBounds := patchBounds translatedBy: diagonal / -2."
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