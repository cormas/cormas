attribute accessing
fillColor: aColorValue
	"self paintPreferences setBackgroundColor: aColorValue."
	
	aColorValue ifNil: [^nil].
	self container ifNil: [^nil].
	self container container lookPreferences setBackgroundColor: aColorValue.
	super fillColor: aColorValue