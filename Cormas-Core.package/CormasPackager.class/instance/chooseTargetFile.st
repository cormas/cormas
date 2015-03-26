actions
chooseTargetFile
	"ask the user for choosing a target file name"
	
	| dialog target directory filename result |
	target := self targetFile.
	directory := target directory.
	directory ensureDirectory.
	filename := target tail.
	dialog := SaveFileDialog new.
	dialog
		addFileFilter: 'Executable (*.exe)' pattern: '*.exe';
		fileCondition: #new;
		defaultDirectory: directory;
		defaultFilename: filename.
	result := dialog select.
	result isNil ifTrue: [^self].
	result extension = '.exe'
		ifFalse: [result := result directory / (result tail , '.exe')].
	self targetFileVM value: result asString.
	self userHasChoosedTargetFile: true