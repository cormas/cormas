deprecated
timeChangedOLD
	"	self addProbe: #alive ofClass: CMConwayModel."

	"self datasets removeLast."

	"	self datasets first elements last copy.
"

	self view removeAllElements.

	"self removeAllElements."
	self refreshHack.
	"a priori ca ne met pas les elements ds la vue"
	"	self view add.. to be continued
"
	self renderInHack.
	self view signalUpdate
	"RTElement on:6
"