- binary storage
dumpOrganization
	"Purpose: [Backward] Ask for filename.bos destination and register the complete organization"
	
	| name fileName |
	name := Dialog request: 'Save the whole organization on File '
		initialAnswer: 'filename.bos'.
	name = '' ifTrue: [^nil].	"name := 'test.bos'.  "
	fileName := (Cormas dumpPath: self class name) construct: name.
	fileName exists
		ifTrue:
			[(Dialog confirm: 'File already exists !!! Use it anyway ???')
				ifFalse: [^nil]].
	self dumpOrganizationOnFile: fileName