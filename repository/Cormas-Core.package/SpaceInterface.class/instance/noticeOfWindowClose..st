interface closing
noticeOfWindowClose: aWindow
	"The ApplicationWindow aWindow is in the process of closing. 
	You have been notified."
	
	self changed: #windowClosed