util_export
saveAsST
	"A kernel.st, a VisualLauncher and a Locale.st are created in kernel directory."
	"Cormas saveAsST"
	
	| defaultFileName fileName fileManager path vL |
	defaultFileName := (Cormas cormasPath construct: 'Kernel')
		construct: 'Kernel-v.' , self versionAsString , '.st'.
	fileName := Dialog
		requestNewFileName: (UserMessage defaultString: '' key: #export) asString
		default: defaultFileName.
	fileName = '' ifTrue: [^nil].	"update version name and comments"
	self
		setDescriptionFor: 'kernelFileName'
		withText:
			(fileName asArrayOfSubstringsSeparatedBy: Filename separator) last.	"save kernel file"
	fileManager := SourceCodeStream write: fileName encoding: #Source.
	[fileManager timeStamp.
	fileManager deferInitializations.
	self
		selectedThingsWithOrder:
			[:definedObjects | 
			definedObjects
				do:
					[:thing | 
					thing fileOutSourceOn: fileManager.
					fileManager cr]]
		onSelection: Kernel asNameSpace.
	fileManager finishInitializations.
	fileManager cr] ensure: [fileManager close].	"directoryName := self cormasPath , Cormas pathSeparator, directoryName.
	directoryName asFilename exists ifFalse: [directoryName asFilename makeDirectory]."	"export VisualLauncher"
	path := self cormasPath construct: 'Kernel'.
	vL := (path construct: 'VisualLauncher.st') asFilename.
	fileManager := SourceCodeStream write: vL encoding: #Source.
	[fileManager timeStamp.
	VisualLauncher fileOutSourceOn: fileManager]
		valueNowOrOnUnwindDo: [fileManager close]