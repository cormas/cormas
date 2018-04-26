accessing - entities pov
povsAndPatchesOfArcEntity: aClass forSelector: povSelector andInfo: aInfoName
	"direct access to the pov for arc entities  (added for remote access)"
	
	| i aPov data aEntityReference aPovSpec povsAndPatches aStartPatchEntityReference aEndPatchEntityReference |
	data := self spaceModel getPovsDataOfArcEntity: aClass forSelector:
			povSelector andInfo: aInfoName.
	povsAndPatches := OrderedCollection new.
	i := 0.
	data
		do:
			[:r | 
			aEntityReference := r at: 1.
			aPovSpec := r at: 2.
			aStartPatchEntityReference := r at: 3.
			aEndPatchEntityReference := r at: 4.
			i := i + 1.
			aPov := aClass createEntityPOVwithSpec: aPovSpec.
			aPov entityReference: aEntityReference.
			povsAndPatches
				add:
					(Array with: aPov with: aStartPatchEntityReference with:
							aEndPatchEntityReference)].
	^povsAndPatches