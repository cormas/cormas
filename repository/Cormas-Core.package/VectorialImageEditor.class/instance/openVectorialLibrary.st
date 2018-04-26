actions
openVectorialLibrary
	
	| lib |
	VectorialImageLibrary imLibPage: 1.
	lib := VectorialImageLibrary new.
	lib observer: self.
	lib open