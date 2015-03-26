api
altHalt
	"Halt if the Alt key is down"
	
	InputState default altDown ifFalse: [^self].
	self halt