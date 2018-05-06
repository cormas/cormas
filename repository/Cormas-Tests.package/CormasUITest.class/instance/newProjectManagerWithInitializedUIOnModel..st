create CMProjet
newProjectManagerWithInitializedUIOnModel: modelName
	| pWindow aProject simWindow |
	pWindow := CMSpecProjectWindow new.
	aProject := pWindow projectManager.
	simWindow := pWindow simWindow simWindow.
	simWindow
		translator: (CMTranslator newForLanguage: #EN);
		initialize.
	aProject openImageProject: modelName.
		aProject updateNewProject: 'CM' , modelName asString , 'Model'.
	^ aProject