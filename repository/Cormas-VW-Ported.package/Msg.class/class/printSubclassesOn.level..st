accessing class hierarchy
printSubclassesOn: aStream level: level
	"As part of the algorithm for printing a description of the receiver, print the
	subclass on the file stream, aStream, indenting level times."
	
	| subs |
	level isZero
		ifFalse:
			[aStream cr.
			2 * level timesRepeat: [aStream space]].	"aStream print: self name asString."
	aStream nextPutAll: self name asString.	"aStream space; nextPut: $(.
	self instVarNames
		do: [:aName | aStream print: aName]
		separatedBy: [aStream space].
	aStream nextPut: $)."
	subs := self subclasses.	"self == Class ifTrue:
		[aStream crtab: level+1; nextPutAll: (#AllTheMetaclasses << #dialogs >> '... all the Metaclasses ...') asString.
		subs := subs reject: [:sub | sub isMeta]]."	"Print subclasses in alphabetical order"
	(subs
		asSortedStrings:
			[:p :x :y | 
			| collation |
			(collation := p
				collate: x name
				to: y name) < 0
				or:
					[collation = 0
						and:
							[x == y
								or:
									[(p
										collate: x printString
										to: y printString) <= 0]]]])
		do:
			[:sub | 
			sub
				printSubclassesOn: aStream
				level: level + 1]