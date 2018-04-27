accessing
addTranslationsForESPart3
	" Private - See superimplementor's comment "

	^ (self translatorClass forLanguage: #ES) translationMap 
		at: #tDistributeAsServer 			put: 'Distribuir (actar como servidor)';
		at: #tDistributeAsClient  			put: 'Distribuir (actuar como cliente)';
		at: #tAboutModel 						put: 'Sobre este modelo';
		at: #tHowToRunModel 					put: 'Como ejecutar este modelo';
		at: #tChangeModelComments 			put: 'Modificar comentarios del modelo';
		at: #tWhichOpeningLocation 			put: 'Seleccione la ubicacion del elemento';
		yourself
