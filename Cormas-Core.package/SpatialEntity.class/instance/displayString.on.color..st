- obsolete
displayString: aString on: aGC color: aColor
	
	self halt	"aString size > 1
		ifTrue: [x := self center x - ((self imageLinkedWith: aGC medium) component width / 2)]
		ifFalse: [x := self center x - ((self imageLinkedWith: aGC medium) component width / 4)].
	y := self center y + ((self imageLinkedWith: aGC medium) component height / 4).
	aGC paint: (ColorValue perform: aColor).
	aGC displayString: aString at: x @ y"