new
newWith: cormasModel filename: nameWithoutExtension
	
	| fileName instance |
	fileName := self getFileName: nameWithoutExtension forModel: cormasModel.
	fileName ifNil: [^nil].
	instance := self new.
	instance cormasModel: cormasModel.
	instance filename: fileName.
	^instance