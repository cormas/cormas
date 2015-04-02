version
convertFrom2001To2002: aModelName fromFile: stFileName
	"aModelName = <String>   stFileName = <String>"
	"4- Conversion 2001 - 2002"
	
	| evFileName |
	(Converter2001To2002 convertModel: aModelName for: self) isNil
		ifTrue: [^nil].	"5- Chargement du code des classes du modele: FILE_IN"
	Cursor wait
		showWhile: [(stFileName asFilename withEncoding: #Source) fileIn].	"6- Chargement eventuel des etats visuels des classes du modele"
	Cursor wait
		showWhile:
			[self
				cormasModelClass:
					((Models at: aModelName asSymbol) at: aModelName asSymbol).
			evFileName := (self class modelPath: aModelName asSymbol)
				construct: aModelName , '.ev'.
			evFileName asFilename exists
				ifTrue:
					[self readVSFile: evFileName.
					self cormasModelClass initializeWithVS]
				ifFalse: [self cormasModelClass initialize].
			self setModelVersionEqualTo: stFileName asFilename.
			self updateGUI.
			self cormasModelClass visualStateIsOpen: false.
			self adjustOrganizationTo2002.
			self cormasModel: self cormasModelClass new.
			self resetSimulation.	"7- Sauvegarde du fichier avec son ancien nom"
			self exportModelWithoutChoice]