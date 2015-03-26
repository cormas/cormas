description accessing
description
	
	| s |
	s := TextStream on: String new.
	self describePackagingOn: s.
	^s contents asParagraph