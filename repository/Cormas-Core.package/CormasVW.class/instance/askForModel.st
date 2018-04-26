model saving&loading
askForModel
	"Return a Model name. Ask a model directory (Removes the blanks and set the first character as uppercase of the Directory name)"
	
	| choosenDirectoryModelName |
	(self cormasModelClass notNil
		and: [self cormasModelClass visualStateIsOpen notNil])
		ifTrue:
			[self cormasModelClass visualStateIsOpen
				ifTrue: [self visualStateWin closeRequest].
			self closeModel].	"Selection dans la liste des modeles importables"
	choosenDirectoryModelName := self selectModelDirectory.
	choosenDirectoryModelName ifNil: [^nil].
	choosenDirectoryModelName := self checkDirectoryName:
			choosenDirectoryModelName.	"removes the blanks and set the first character as uppercase"
	choosenDirectoryModelName ifNil: [^nil].
	^choosenDirectoryModelName