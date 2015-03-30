accessing
locateCreatedEntitiesOption
	
	self locateCreatedEntities value = #locateCreatedEntities_Rand
		ifTrue: [^#random].
	self locateCreatedEntities value = #locateCreatedEntities_No
		ifTrue: [^#no].
	self locateCreatedEntities value = #locateCreatedEntities_Contrained
		ifTrue: [^#contrained].
	self locateCreatedEntities value = #locateCreatedEntities_SpaceView
		ifTrue: [^#manually]