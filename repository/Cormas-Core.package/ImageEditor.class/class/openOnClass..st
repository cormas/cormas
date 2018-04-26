new
openOnClass: aClass
	
	| editor |
	editor := self new.
	editor targetClass: aClass.
	self openOn: editor.
	^editor