init entities
initializeTheEntity: aClass
	"Initialize the Entity classes of the model and creates the new collector (IndexedSet)"
	
	| entities |
	entities := self theEntities: aClass.
	entities reverseDo: [:anEntity | anEntity delete].
	aClass CurrentId: 0.
	aClass isAbstract ifTrue: [^OrderedCollection new: 0].
	^entities removeAll