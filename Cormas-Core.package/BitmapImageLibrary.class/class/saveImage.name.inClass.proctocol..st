utils
saveImage: image name: imageName inClass: aClass proctocol: prAsString
	
	| class s |
	class := aClass class.
	s := WriteStream on: (String new: image bits size // 8).
	s
		nextPutAll: imageName;
		cr.
	s
		tab;
		crtab;
		nextPutAll: '<resource: #image>';
		crtab;
		nextPut: $^.
	s nextPutAll: image minimalStorageString.
	class
		compile: s contents
		classified: prAsString