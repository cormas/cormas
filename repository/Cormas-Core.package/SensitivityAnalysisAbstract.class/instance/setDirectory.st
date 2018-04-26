save
setDirectory
	
	| directory day defaultName |
	day := Time dateAndTimeNow at: 1.
	defaultName := self defaultDirectoryName , day year printString , '.'
		, day monthIndex printString , '.' , day dayOfMonth printString.
	directory := DataSaver
		requestForDirectory: self cormasModel
		defaultName: defaultName.
	directory ifNil: [^nil].
	directory exists
		ifTrue:
			[self filesExist: true	"will be effectively checked later (when dataSaver will be set)"]
		ifFalse: [directory makeDirectory].
	^directory