labeling-access character
accessCharacterPosition: anIndex
	"Set the index position of the access character in the label (or labelText if there is one).  The access character is the character that is underlined in the windows look & feel.
	Note:  If no access characters are specified in the MenuItems in a menu, then the UILookPolicy can (and will if appropriate) choose its own access characters for the MenuItems in the Menu."
	
	| str s1 s2 |
	str := self filteredLabel.
	anIndex == nil ifTrue: [^self label: str].
	s1 := str
		copyFrom: 1
		to: anIndex - 1.
	(s1 includes: $&) ifTrue: [s1 := s1 copyReplaceAll: '&' with: '&&'].
	s2 := str
		copyFrom: anIndex
		to: str size.
	(s2 includes: $&) ifTrue: [s2 := s2 copyReplaceAll: '&' with: '&&'].
	self rawLabel: s1 , '&' , s2