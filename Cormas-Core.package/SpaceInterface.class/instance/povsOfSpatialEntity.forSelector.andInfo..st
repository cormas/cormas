accessing - entities pov
povsOfSpatialEntity: aClass forSelector: povSelector andInfo: aInfoName
	"direct access to the pov for occupant entities  (added for remote access)"
	
	| povs i aPov data aEntityReference aPovSpec componentsPovs |
	data := self spaceModel getPovsDataOfEntity: aClass forSelector:
			povSelector andInfo: aInfoName.
	povs := OrderedCollection new.
	aClass isElementary
		ifTrue:
			[i := 0.
			data
				do:
					[:d | 
					i := i + 1.
					self spaceModel elementaryEntitiesDefaultPovs size < i
						ifFalse:
							[aEntityReference := d key.
							aPovSpec := d value.
							aPov := aClass
								createEntityPOVwithSpec: aPovSpec
								defaultPov: (self spaceModel elementaryEntitiesDefaultPovs at: i).	"clientSpaceModel also defines it"
							aPov entityReference: aEntityReference.
							povs add: aPov]]]
		ifFalse:
			[data
				do:
					[:d | 
					aEntityReference := d key.
					aPovSpec := d value.
					componentsPovs := OrderedCollection new.
					aPovSpec elementaryComponentsId
						do:
							[:compId | 
							componentsPovs
								add: (self spaceModel elementaryEntitiesDefaultPovs at: compId)].	"clientSpaceModel also defines it"
					aPov := aClass createEntityPOVwithSpec: aPovSpec componentsPovs:
							componentsPovs.
					aPov entityReference: aEntityReference.
					povs add: aPov]].
	^povs