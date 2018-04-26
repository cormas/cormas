accessing
addTranslationsForESPart2
	" See superimplementor's comment "

	^ (self translatorClass forLanguage: #ES) translationMap 
		at: #tInitialValueChooser 			put: 'Selector de valor inicial';
		at: #tSetterAccessor 					put: 'Accesor de escritura';
		at: #tGetterAccessor 					put: 'Accesor de lectura';
		at: #tNotifyObs 						put: 'Notificar observadores cuando haya cambios';
		at: #tInitialValueLabel				put: 'Ingrese un valor inicial para el atributo';
		at: #tNumber 							put: 'Number';
		at: #tRandom 							put: 'Random';
		at: #tBoolean 							put: 'Boolean';
		at: #tStringSymbol 					put: 'String / Symbol';
		at: #tArray 								put: 'Array';
		at: #tNewEntity 						put: 'Nueva Entidad';							
		at: #tCollectionEmpty 				put: 'Collection (vacía)';
		at: #tNoValue 							put: 'Sin valor u otra instancia (a ser configurada en #init)';
		at: #tFillArray							put: 'Complete el Array con valores';
		at: #tSimulate 							put: 'simular';
		at: #tReplay 							put: 'reiniciar';
		at: #tCurrentStep 						put: 'paso actual';
		at: #tInitialize 						put: 'Inicializar';
		at: #tBackwardLabel 					put: 'Reversa';
		at: #tForwardLabel 					put: 'Adelantar';
		at: #tFinalStep 	 					put: 'paso final';
		at: #tChange 							put: 'Cambiar';
		at: #tSimCloseHelp 					put: 'Cerrar la interface de simulación';
		at: #tSimStepHelp 						put: 'Tiempo actual';	
		at: #tSimFinalStepHelp 				put: 'Ingrese el paso final';
		at: #tSelectMethod 					put: 'Seleccione un método de ';
		at: #tFinalStepChoice 				put: 'Paso final:';
		at: #tInitializeRandomness 			put: 'Inicializar aleatoriedad';
		at: #tMissingInitMethods 			put: 'El modelo no define ningún método de inicialización !';
		at: #tMissingControlMethods 		put: 'El modelo no define ningún método de control !';
		at: #tNoStoredSim 						put: 'El directorio "Dump" no contiene ninguna simulación';
		at: #tNoStoredSimFolder				put: ' el directorio no contiene ninguna simulación';
		at: #tReplayStartStep 				put: 'La repetición comenzará en el paso ';								
		at: #tChooseDumpDir					put: 'Seleccione un directorio de ''Volcado''';
		at: #tCreatePoVAtt 					put: '¿Crear PoV en qué atributo?';
		at: #tFoundPoVValues 					put: 'CORMAS encontró los siguientes valores para el atributo ';
		at: #tAddSymbols 						put: '¿Desea crear los símbolos asociados a estos valores?';	
		at: #tEnterNewSymbol 					put: 'Ingrese un nuevo símbolo';
		at: #tSelectEntity 					put: 'Debe seleccionar una entidad';
		at: #tNoMoreMethods 					put: 'No se pueden agregar más métodos a esta lista';
		at: #tNoMorePoVMethods				put: 'No se pueden agregar más pov a esta lista';
		at: #tNoMoreEntities 					put: 'No se pueden agregar más entidades a esta lista';
		at: #tNoMoreInfo 						put: 'No se pueden agregar más info a esta lista';
		at: #tPoVMethods 						put: 'Métodos POV';
		at: #tAgentTracksSize 				put: 'Choose the size of the agents tracks';
		at: #tSpaceNotAllowed 				put: 'Los espacios no están permitidos para nombres de Habitus. ¿Quiere reemplazarlos con el caracter ''_''?';
		at: #tConfigTitle 						put: 'Por favor, ingrese el título para la configuración';
		at: #tOneInfo 							put: 'Only one info can be set as default';
		at: #tInfoDefault 						put: 'This info is already set as default';
		at: #tPoVDefault 						put: 'This pov is already set as default';
		at: #tMustSelectEntity 				put: 'Se debe seleccionar una entidad';
		at: #tEntitiesToCreate 				put: 'Entidades a ser creadas';
		at: #tManipulationEntities			put: 'Manipulation Entities';
		at: #tObservedEntities 				put: 'Entidades Observadas';
		at: #tChooseConfig 					put: 'Seleccione una configuración';
		at: #tNoInfoSelected 					put: 'No se seleccionó ningún info';
		at: #tNoAttribSelected 				put: 'No se seleccionó ningún atributo';
		at: #tNoEntitySelected 				put: 'No se seleccionó ninguna entidad';
		at: #tNoMethodSelected 				put: 'No se seleccionó ningún método';
		at: #tNoPoVSelected 					put: 'No se seleccionó ningún POV';
		at: #tOnePoV 							put: 'Solo un POV puede ser seleccionado por omisión';
		at: #tHabitusTitle 					put: 'Habitus de Bourdieu';
		at: #tHabitusText 						put: 'L''habitus est un système de disposition acquises par l''apprentissage implicite ou explicite qui fonctionne comme un système de schèmes générateurs. L''habitus est générateur de stratégies qui peuvent être objectivement conformes aux intérêts objectifs de leurs auteurs sans en avoir été expressément conçues à cette fin. (Bourdieu 1972)
Autre définition : L''habitus est un ensemble de manière d''être, d''agir et de penser propre à un individu, fruit d''un apprentissage particulier lié à son groupe d''appartenance, qui diffère selon sa classe sociale, sa disposition en capital, et sa place occupée dans l''espace social. L''habitus structure les comportements et les actions de l''individu, et à la fois, structure les positions dans l''espace social.';
		at: #tSelectPoVSymbol 				put: 'Por favor, seleccione un Symbol de PoV';
		at: #tSymbolAlreadyExists 			put: 'El Symbol ya existe !!!';
		at: #tSelectSymbol 					put: 'Seleccione un símbolo !!!';
		at: #tPoVDefinition 					put: 'Definición del PoV';
		at: #tPoVListMethods 					put: 'Métodos que responden un Color ó Symbol';
		at: #tPoVListSymbols 					put: 'Símbolos Asociados';
		at: #tPoVInfoDisplayed				put: 'Información a visualizar';
		at: #tPoVListInfo 						put: 'Métodos que responden un String';
		at: #tPoVSetColor 						put: 'Configurar el Color';
		yourself