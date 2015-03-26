new
newWith: cormasModel
	"Create a new instance of DataSaver (ask for file destination).
cormasModel : an instance of <CormasModel>"
	
	| fileName instance |
	fileName := self requestForFilename: cormasModel.
	fileName ifNil: [^nil].
	instance := self new.
	instance cormasModel: cormasModel.
	instance filename: fileName.
	^instance