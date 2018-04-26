accessing - entities pov
povsAndPatchesOfOccupantEntity: aClass forSelector: povSelector andInfo: aInfoName
	"direct access to the pov for occupant entities  (added for remote access)"
	
	| i aPov data aEntityReference aPovSpec povsAndPatches aPatchEntityReference |
	data := self spaceModel getPovsDataOfOccupantEntity: aClass forSelector:
			povSelector andInfo: aInfoName.
	povsAndPatches := OrderedCollection new.
	i := 0.
	data
		do:
			[:r | 
			aEntityReference := r at: 1.
			aPovSpec := r at: 2.
			aPatchEntityReference := r at: 3.
			i := i + 1.
			aPov := aClass createEntityPOVwithSpec: aPovSpec.
			aPov entityReference: aEntityReference.
			povsAndPatches add: aPov -> aPatchEntityReference].
	^povsAndPatches