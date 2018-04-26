editor
openBitmapImageEditor
	
	| editor |
	editor := ImageEditor openOnClass: self class.
	editor observer: self.
	editor loadCurrentImage