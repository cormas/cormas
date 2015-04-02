model saving&loading
loadModelFromParcel
	"load a model by asking the user to choose a model name.
	Load a Parcel or call loadSTModel if no .PCL exist"
	
	| choosenDirectoryModelName fileName |
	choosenDirectoryModelName := self askForModel.
	choosenDirectoryModelName ifNil: [^nil].	"Call loadSTModel if no .PCL exist"
	((self class modelPath: choosenDirectoryModelName asSymbol)
		directoryContents select: [:fn | '*.pcl' match: fn]) isEmpty
		ifTrue: [^self loadSTModel: choosenDirectoryModelName].	"Recherche le fichier correspondant a la version choisie"
	fileName := (self getFilenameFromDirectory: choosenDirectoryModelName
		extension: 'pcl') ifNil: [^nil].	"File in"	"Chargement du code des classes du modele"
	self
		loadModel: choosenDirectoryModelName
		FromParcel: fileName asFilename.	"Chargement eventuel des etats visuels des classes du modele"
	self isPOVsymbolsSavedAsClassMethods
		ifTrue: [self loadPOVs]
		ifFalse:
			[self loadEV_file.
			self savePOVasClassMethods].
	self resetSimulation