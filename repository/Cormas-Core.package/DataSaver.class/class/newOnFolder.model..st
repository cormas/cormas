new
newOnFolder: folder model: cormasModel
	
	| instance |
	instance := self new.
	instance cormasModel: cormasModel.
	instance directory: folder.
	^instance