- binary storage
restoreOrganization
	"Purpose: [Backward] Ask for filename.bos destination and Restore the complete state of the organization by reading the BOSS file contents"
	
	| name |
	name := Dialog request: 'Restore the whole organization from File '
		initialAnswer: 'filename.bos'.
	name = '' ifTrue: [^false].	"name := 'test.bos'.  "
	^self
		restoreOrganizationFromFile:
			((Cormas dumpPath: self class name) construct: name)