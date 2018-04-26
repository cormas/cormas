- accessing
hasRandomAttribute: anAttributeName classVariable: boolean value: aString
	"' Answer if anAttributeName defined at level (#instance or #class) is already defined with the same value as aString.
randomAttributes = #(#bioma #instance #randomFloat 0 1). "
	
	| level anArray otherString include |
	(self isRandomAttribute: anAttributeName classVariable: boolean)
		ifFalse: [^false].
	level := boolean
		ifTrue: [#class]
		ifFalse: [#instance].
	anArray := self randomAttributes
		detect:
			[:line | (line at: 1) = anAttributeName and: [(line at: 2) = level]].
	otherString := (anArray at: 3) asString.
	otherString = 'randomFloat'
		ifTrue: [include := false]
		ifFalse: [include := true].
	include
		ifTrue: [otherString := otherString , ': [']
		ifFalse: [otherString := otherString , ': ]'].
	otherString := otherString , (anArray at: 4) asString.
	otherString := otherString , ' ; '.
	otherString := otherString , (anArray at: 5) asString.
	include
		ifTrue: [otherString := otherString , ']']
		ifFalse: [otherString := otherString , '['].
	^otherString = aString