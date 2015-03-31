examples
open
	"Open an empty drawing editor"
	"   self open   "
	
	| editor |
	editor := self new.
	editor open.
	^editor