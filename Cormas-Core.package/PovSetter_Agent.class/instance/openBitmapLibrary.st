image library
openBitmapLibrary
	
	| lib |
	BitmapImageLibrary imLibPage: 1.
	lib := BitmapImageLibrary new.
	lib observer: self.
	lib open