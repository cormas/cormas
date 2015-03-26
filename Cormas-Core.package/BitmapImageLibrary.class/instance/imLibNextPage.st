actions
imLibNextPage
	
	self class imLibPage: self class imLibPage + 1.
	self closeAndUnschedule.
	self open	"Interface: #bitmapLibrary"