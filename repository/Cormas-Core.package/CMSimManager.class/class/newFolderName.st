accessing
newFolderName
	"return a String for newFolder (starting at model's name"
	
	| i listComp str |
	self newFolder isString ifTrue: [^self newFolder].
	listComp := self newFolder components.
	i := listComp
		indexOf: 'Models'
		ifAbsent: [^self newFolder asString].
	str := '..'.
	(listComp
		copyFrom: i + 1
		to: listComp size) do: [:e | str := str , listComp first , e].
	^str