+ utilities - code management
isTerminal: aClass
	"test efficiently if aClass is a terminal (or concrete) class (has no subclasses)
	use the getSubclasses which return nil or Array of subclasses without any copy.
	use the well known hack size = 0 for testing nil or empty collection

	self isTerminal: Object.
	self isTerminal: Fraction.

	Time microsecondsToRun: [10000 timesRepeat: [ Object subclasses isEmpty. Fraction subclasses isEmpty ]]
	Time microsecondsToRun: [10000 timesRepeat: [ CormasModel isTerminal: Object.  CormasModel isTerminal: Fraction ]]
	"
	
	^aClass subclasses size == 0