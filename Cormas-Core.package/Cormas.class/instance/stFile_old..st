model saving&loading ST
stFile_old: fileName
	"Save the model as ST file."
	
	| fileManager selectedThings |
	Notice
		show: 'Saving Model as ST file...'
		while:
			[selectedThings := OrderedCollection new.
			selectedThings
				add: self cormasModelClass environment;
				addAll: self cormasModelClass environment.
			selectedThings := SystemUtils sortForLoading: selectedThings.
			fileManager := SourceCodeStream write: fileName encoding: #Source.
			[fileManager timeStamp.
			fileManager deferInitializations.
			selectedThings
				do:
					[:thing | 
					thing fileOutSourceOn: fileManager.
					fileManager cr].
			fileManager finishInitializations.
			fileManager cr] ensure: [fileManager close]]