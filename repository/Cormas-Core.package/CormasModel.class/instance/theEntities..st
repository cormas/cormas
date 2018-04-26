accessing - entities
theEntities: aClass
	"Returns a indexedSet of all the instances of aClass collected by cormasModel."
	
	| collec getter |
	aClass isAbstract ifTrue: [^OrderedCollection new].
	getter := self getterForEntityClass: aClass.
	collec := self perform: getter.	"If theXXXs method does not return an Indexedset, theXXXs is dynamically rebuilt as :
	theXXXs
		^theXXXs ifNil:[theXXXs := IndexedSet new]"
	collec
		ifNil:
			[self class createReaderAccessor: aClass.
			collec := self perform: getter].
	^collec