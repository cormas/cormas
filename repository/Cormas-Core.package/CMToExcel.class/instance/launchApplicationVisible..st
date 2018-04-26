run_private
launchApplicationVisible: aBoolean
	"Open a new Excel application. The application will be visible 
	according to aBoolean value"
	
	self addWorkbook.
	self isVisible: aBoolean