write in class
write: stringArray inMethod: selector inClass: aClass
	
	| class s |
	class := aClass class.
	s := WriteStream on: String new.
	s
		nextPutAll: selector;
		cr.
	s
		tab;
		crtab;
		nextPutAll: '^#('.
	stringArray do: [:mn | s nextPutAll: '#' , mn , ' '].
	s nextPutAll: ')'.
	class
		compile: s contents
		classified: #manipulation