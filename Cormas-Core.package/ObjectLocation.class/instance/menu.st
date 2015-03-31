- deprecated
menu
	
	| aMenuBuilder |
	self halt.
	aMenuBuilder := MenuBuilder new.
	aMenuBuilder add: 'Edition' -> [self inspect].
	^aMenuBuilder menu