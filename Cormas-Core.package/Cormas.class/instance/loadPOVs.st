model saving&loading POV
loadPOVs
	
	| povType |
	self cormasModelClass environment values
		do:
			[:entity | 
			(entity class organization categories includes: #'pov symbols')
				ifTrue:
					[(entity class organization listAtCategoryNamed: #'pov symbols')
						do:
							[:selector | 
							povType := selector readStream upTo: $_.
							povType = 'BitmapPOV'
								ifTrue: [self loadBitmapPOV: selector ofClass: entity].
							povType = 'ArcPOV'
								ifTrue: [self loadArcPOV: selector ofClass: entity].
							povType = 'VectorialPOV'
								ifTrue: [self loadVectorialPOV: selector ofClass: entity].
							povType = 'SpatialEntityPOV'
								ifTrue: [self loadSpatialEntityPOV: selector ofClass: entity]]]].
	self updateGUI.
	self cormasModelClass visualStateIsOpen: false