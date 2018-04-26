model saving&loading ST
stFile: fileName
	"Save the model as ST file.
fileName = <Filename> or <String>"
	
	| fileManager pkg |
	Notice
		show: 'Saving Model as ST file...'
		while:
			[pkg := self cormasModelClass package.
			fileManager := SourceCodeStream
				write: fileName asString
				encoding: #Source.
			[fileManager timeStamp.
			fileManager deferInitializations.
			pkg fileOutOn: fileManager.
			fileManager finishInitializations.
			fileManager cr] ensure: [fileManager close]]