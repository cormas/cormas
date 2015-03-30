submenu
submenu: aMenuOrNil
	"<aMenuOrNil> is either nil or an object (e.g., a Menu
	 or BlockClosure) that returns a Menu in response to
	 being sent the message #value."
	
	self realAdornment submenu: aMenuOrNil