- accessing - methods & classes
availablePov
	"Purpose: returns the list of available pov methods
	Return value: <OrderedCollection>"
	
	| collec |
	collec := OrderedCollection new.
	self withAllSuperclassesDo: [ : cl | 
		collec addAll: (cl organization listAtCategoryNamed: #pov).
		collec addAll: (cl organization listAtCategoryNamed: 'star pov' asSymbol)].
	(self includesBehavior: CMSpatialEntitySet)
		ifTrue: [ collec addFirst: #delimitors ].
	collec addFirst: #nil.
	^ collec