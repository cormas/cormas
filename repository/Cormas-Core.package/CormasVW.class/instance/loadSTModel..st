model saving&loading ST
loadSTModel: aModelName
	"aModelName = <String>"
	
	| stFileName |
	"Recherche le fichier correspondant a la version choisie"
	stFileName := (self getFilenameFromDirectory: aModelName extension: 'st')
		ifNil: [^nil].	"Si un modele de meme nom est deja charge, on nettoie"
	self removeOldSTModel: aModelName.	"File in"	"Chargement du code des classes du modele"
	Notice
		show: self loadingModel
		while:
			["Test if the model was running on VW3 and should be convert into VW7"
			[(stFileName asFilename withEncoding: #Source) fileIn]
				on: ClassBuilder nilSuperclassSignal
				do:
					[:ex | 
					(self
						confirm:
							(UserMessage defaultString: 'convert the model to VW7 ?' key: #convertModel))
						ifFalse: [^nil]
						ifTrue:
							[^self convertFrom2001To2002: aModelName fromFile: stFileName]]].
	self
		cormasModelClass:
			((Models at: aModelName asSymbol) at: aModelName asSymbol).	"Test if the model should be convert to VW7.3 format (Add Package)"
	(self cormasModelClass class findSelector: #creationDate)
		ifNil: [self convertToVW73].	"Test if the model should be convert to Cormas2010.06 format (Add 'isAbstract' information)"
	((self cormasModelClass class findSelector: #cormasCompatibleVersion)
		isNil
		or:
			[(self cormasModelClass cormasCompatibleVersion at: 1) * 100
				+ (self cormasModelClass cormasCompatibleVersion at: 2) < 201006])
		ifTrue: [self convertToCormas201006].
	self cormasModelClass version = 'v-0'
		ifTrue: [self setModelVersionEqualTo: stFileName asFilename].	"Chargement eventuel des etats visuels des classes du modele"
	self cormasModelClass initialize.
	self isPOVsymbolsSavedAsClassMethods
		ifTrue: [self loadPOVs]
		ifFalse:
			[self loadEV_file.
			self savePOVasClassMethods].
	self cormasModel: self cormasModelClass new.
	self resetSimulation