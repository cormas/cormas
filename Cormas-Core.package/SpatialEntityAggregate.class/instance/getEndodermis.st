- accessing
getEndodermis
	"Returns a collection of collections of cells belonging to the 'endodermis skin' of the aggregate"
	
	| collections |
	collections := self getSkins removeFirst.
	^collections