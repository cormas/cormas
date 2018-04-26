accessing
addTranslationsForENPart3
	" Private - See superimplementor's comment "

	^ (self translatorClass forLanguage: #EN) translationMap 
		at: #tDistributeAsServer 			put: 'Distribute (act as a server)';
		at: #tDistributeAsClient  			put: 'Distribute (act as a client)';
		at: #tAboutModel 						put: 'About this model';
		at: #tHowToRunModel 					put: 'How to run this model';
		at: #tChangeModelComments 			put: 'Change model Comments';
		yourself