Class {
	#name : #InterfaceObs,
	#superclass : #UIApplicationModel,
	#instVars : [
		'modeleObs',
		'vueObs',
		'compteur',
		'cycle',
		'deplacement',
		'lienHolder',
		'aSlider',
		'bSlider',
		'vueEllipse',
		'aHolder',
		'bHolder',
		'extentHolder',
		'interieurHolder',
		'dBuilder',
		'changedOK',
		'quitter',
		'cercleCommHolder',
		'dialogPreferences',
		'dialogParametres'
	],
	#category : #'Cormas-Core-Observer'
}

{ #category : #'interface specs' }
InterfaceObs class >> ecranHierarchisation [
	"UIPainter new openOnClass: self andSelector: #ecranHierarchisation"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: 'Hierarchisation' 
			#bounds: #(#Rectangle 293 390 508 535)) 
		#component: #(#SpecCollection 
			#collection: #(#(#InputFieldSpec 
				#layout: #(#Rectangle 35 38 83 61) 
				#model: #levelHolder 
				#type: #number) #(#ActionButtonSpec 
				#layout: #(#Rectangle 145 32 195 67) 
				#model: #actionIncLevel 
				#label: '+' 
				#defaultable: true) #(#ActionButtonSpec 
				#layout: #(#Rectangle 94 32 144 67) 
				#model: #actionDecLevel 
				#label: '-' 
				#defaultable: true) #(#GroupBoxSpec 
				#layout: #(#Rectangle 12 9 208 136) 
				#label: 'Niveau') #(#CheckBoxSpec 
				#layout: #(#Point 35 74) 
				#name: #higherLevels 
				#model: #higherLevels 
				#label: 'Affichage Niveau >') #(#CheckBoxSpec 
				#layout: #(#Point 35 100) 
				#name: #oneLevel 
				#model: #oneLevel 
				#label: 'Unifier les Niveaux'))))
]

{ #category : #'interface specs' }
InterfaceObs class >> ecranParametres [
	"UIPainter new openOnClass: self andSelector: #ecranParametres"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Parametres' 
			#min: #(Point 20 20) 
			#max: #(Point 1324 968) 
			#bounds: #(Rectangle 559 416 944 650)) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 239 131) 
				#label: 'Movement') #(InputFieldSpec 
				#layout: #(Rectangle 329 132 369 154) 
				#model: #deplacement 
				#type: #number) #(SliderSpec 
				#layout: #(Rectangle 204 13 224 149) 
				#name: #bSlider 
				#model: #bSlider 
				#orientation: #vertical) #(SliderSpec 
				#layout: #(Rectangle 20 149 203 169) 
				#name: #aSlider 
				#model: #aSlider 
				#orientation: #horizontal) #(ArbitraryComponentSpec 
				#layout: #(Rectangle 20 13 204 149) 
				#name: #vueEllipse 
				#component: #vueEllipse) #(LabelSpec 
				#layout: #(Point 261 49) 
				#label: 'a :') #(InputFieldSpec 
				#layout: #(Rectangle 294 50 334 72) 
				#name: #a 
				#model: #aHolder 
				#type: #number) #(GroupBoxSpec 
				#layout: #(Rectangle 243 14 354 117)) #(LabelSpec 
				#layout: #(Point 262 77) 
				#label: 'b :') #(InputFieldSpec 
				#layout: #(Rectangle 294 77 334 99) 
				#name: #b 
				#model: #bHolder 
				#type: #number) #(CheckBoxSpec 
				#layout: #(Point 258 23) 
				#model: #interieurHolder 
				#label: 'Repulsion') #(LabelSpec 
				#layout: #(Point 241 161) 
				#label: 'Iterations') #(InputFieldSpec 
				#layout: #(Rectangle 329 155 369 180) 
				#model: #cycle 
				#type: #number) #(ActionButtonSpec 
				#layout: #(Rectangle 101 191 182 214) 
				#name: #ActionButton1 
				#model: #closeParametres 
				#label: 'Close' 
				#defaultable: true))))
]

{ #category : #'interface specs' }
InterfaceObs class >> ecranPreferences [
	"UIPainter new openOnClass: self andSelector: #ecranPreferences"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Preferences' 
			#min: #(Point 20 20) 
			#max: #(Point 1024 768) 
			#bounds: #(Rectangle 512 384 808 452)) 
		#component: #(SpecCollection 
			#collection: #(#(CheckBoxSpec 
				#layout: #(Point 21 14) 
				#model: #lienHolder 
				#label: 'Draw line') #(CheckBoxSpec 
				#layout: #(Point 21 38) 
				#model: #cercleCommHolder 
				#label: 'Circle for communicating agents') #(ActionButtonSpec 
				#layout: #(Rectangle 201 11 282 34) 
				#name: #ActionButton1 
				#model: #closePreferences 
				#label: 'Action' 
				#defaultable: true))))
]

{ #category : #resources }
InterfaceObs class >> mainMenu [
	"MenuEditor new openOnClass: self andSelector: #mainMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #settings 
			#defaultString: 'Settings') 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #changeParameters 
				#defaultString: 'Change parameters') 
			#value: #actionOpenParametres) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #graphicRepresentation 
				#defaultString: 'Graphic representation') 
			#value: #actionOpenPreferences)) #(2) nil)) #(MenuItem 
		#rawLabel: 'Actions' 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Circle position' 
			#value: #actionCircle) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #randomPositions 
				#defaultString: 'Random positions') 
			#value: #actionDistribuer) #(MenuItem 
			#rawLabel: #(UserMessage 
				#key: #updateGraph 
				#defaultString: 'Update graph') 
			#value: #actionGo)) #(3) nil))) #(2) nil) decodeAsLiteralArray
]

{ #category : #init }
InterfaceObs class >> new [
	
	^super new
]

{ #category : #'interface specs' }
InterfaceObs class >> win [
	"UIPainter new openOnClass: self andSelector: #win"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: 'Observateur Graphique' 
			#bounds: #(#Rectangle 371 327 795 753)) 
		#component: #(#SpecCollection 
			#collection: #(#(#ArbitraryComponentSpec 
				#layout: #(#LayoutFrame 0 0.0377359 0 0.0375587 0 0.962264 0 0.880282) 
				#name: #'1' 
				#component: #vueObs) #(#LabelSpec 
				#layout: #(#LayoutOrigin 0 0.417453 0 0.924883) 
				#label: 'Duree du Cycle') #(#LabelSpec 
				#layout: #(#LayoutOrigin 0 0.0518868 0 0.920188) 
				#label: 'Tour No') #(#InputFieldSpec 
				#layout: #(#LayoutFrame 0 0.653302 0 0.920188 0 0.78066 0 0.978873) 
				#model: #cycle 
				#type: #number) #(#InputFieldSpec 
				#layout: #(#LayoutFrame 0 0.195755 0 0.91784 0 0.323113 0 0.976526) 
				#model: #stepCounter 
				#type: #number))))
]

{ #category : #'interface specs' }
InterfaceObs class >> windowSpec [
	"UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(#FullSpec 
		#window: #(#WindowSpec 
			#label: #(#UserMessage 
				#key: #communicationobserver 
				#defaultString: 'Observateur Graphique') 
			#bounds: #(#Rectangle 128 146 552 572) 
			#flags: 4 
			#menu: #mainMenu 
			#isEventDriven: true) 
		#component: #(#SpecCollection 
			#collection: #(#(#ArbitraryComponentSpec 
				#layout: #(#LayoutFrame 0 0.0377359 0 0.0350877 0 0.964623 0 0.969925) 
				#name: #vueObs 
				#component: #vueObs))))
]

{ #category : #parametres }
InterfaceObs >> aHolder [
	"This method was generated by UIDefiner.  Any edits made here







	may be lost whenever methods are automatically defined.  The







	initialization provided below may have been preempted by an







	initialize method."
	
	^aHolder isNil
		ifTrue: [aHolder := 0 asValue]
		ifFalse: [aHolder]
]

{ #category : #parametres }
InterfaceObs >> aSlider [
	
	^aSlider
]

{ #category : #actions }
InterfaceObs >> actionCharger [
	
	modeleObs load
]

{ #category : #actions }
InterfaceObs >> actionCircle [
	
	modeleObs isInitialized ifFalse: [^self].
	compteur value: 0.
	modeleObs actionCircle
]

{ #category : #actions }
InterfaceObs >> actionDistribuer [
	
	modeleObs isInitialized ifFalse: [^self].
	compteur value: 0.
	modeleObs actionDistribuer
]

{ #category : #actions }
InterfaceObs >> actionGo [
	
	modeleObs isInitialized ifFalse: [^self].
	cycle value
		timesRepeat:
			["(self builder componentAt: #vueObs) widget update: #invalidate."
			"	compteur value: compteur value + 1."
			modeleObs actionUnTour
				ifFalse:
					[^self]]
]

{ #category : #actions }
InterfaceObs >> actionOpenHierarchie [
	
	modeleObs fonction actionOpenHierarchie
]

{ #category : #actions }
InterfaceObs >> actionOpenParametres [
	
	| tmp |
	modeleObs isInitialized ifFalse: [^self].
	tmp := AgentObs new.
	self deplacement value: tmp Deplacement.
	dialogParametres := SimpleDialog new.
	dBuilder := dialogParametres builder.
	vueEllipse rrr: 1.	"modeleObs adaptor imageEtDico geometric radius floor"
	dBuilder aspectAt: #vueEllipse put: vueEllipse.
	dialogParametres openFor: self interface: #ecranParametres.
	tmp Deplacement: deplacement value.
	vueEllipse interieur: true.
	tmp A: vueEllipse a.
	tmp B: vueEllipse b.
	vueEllipse interieur: false.
	tmp AA: vueEllipse a.
	tmp BB: vueEllipse b.
	tmp Eint: vueEllipse e.
	tmp Eext: vueEllipse f
]

{ #category : #actions }
InterfaceObs >> actionOpenPreferences [
	
	dialogPreferences := SimpleDialog new.
	dBuilder := dialogPreferences builder.
	dialogPreferences openFor: self interface: #ecranPreferences
]

{ #category : #actions }
InterfaceObs >> actionQuitter [
	
	quitter := true.
	self closeRequest.
	modeleObs removeData
]

{ #category : #parametres }
InterfaceObs >> bHolder [
	"This method was generated by UIDefiner.  Any edits made here







	may be lost whenever methods are automatically defined.  The







	initialization provided below may have been preempted by an







	initialize method."
	
	^bHolder isNil
		ifTrue: [bHolder := 0 asValue]
		ifFalse: [bHolder]
]

{ #category : #parametres }
InterfaceObs >> bSlider [
	
	^bSlider
]

{ #category : #preferences }
InterfaceObs >> cercleCommHolder [
	"This method was generated by UIDefiner.  Any edits made here



	may be lost whenever methods are automatically defined.  The



	initialization provided below may have been preempted by an



	initialize method."
	
	^cercleCommHolder isNil
		ifTrue: [cercleCommHolder := false asValue]
		ifFalse: [cercleCommHolder]
]

{ #category : #actions }
InterfaceObs >> closeParametres [
	"This stub method was generated by UIDefiner"
	
	^self dialogParametres close
]

{ #category : #actions }
InterfaceObs >> closePreferences [
	"This stub method was generated by UIDefiner"
	
	^self dialogPreferences close
]

{ #category : #aspects }
InterfaceObs >> cycle [
	"This method was generated by UIDefiner.  Any edits made here



	may be lost whenever methods are automatically defined.  The



	initialization provided below may have been preempted by an



	initialize method."
	
	^cycle isNil
		ifTrue: [cycle := 0 asValue]
		ifFalse: [cycle]
]

{ #category : #parametres }
InterfaceObs >> deplacement [
	"This method was generated by UIDefiner.  Any edits made here



	may be lost whenever methods are automatically defined.  The



	initialization provided below may have been preempted by an



	initialize method."
	
	^deplacement isNil
		ifTrue: [deplacement := 0 asValue]
		ifFalse: [deplacement]
]

{ #category : #accessing }
InterfaceObs >> dialogParametres [
	
	^dialogParametres
]

{ #category : #accessing }
InterfaceObs >> dialogParametres: anObject [
	
	dialogParametres := anObject
]

{ #category : #accessing }
InterfaceObs >> dialogPreferences [
	
	^dialogPreferences
]

{ #category : #accessing }
InterfaceObs >> dialogPreferences: anObject [
	
	dialogPreferences := anObject
]

{ #category : #parametres }
InterfaceObs >> ellipseChanged [
	
	changedOK
		ifTrue:
			[vueEllipse a: aHolder value.
			vueEllipse b: bHolder value.
			vueEllipse extent: extentHolder value.
			vueEllipse compute]
]

{ #category : #accessing }
InterfaceObs >> fonction: uneFD [
	
	modeleObs fonction: uneFD
]

{ #category : #'initialize-release' }
InterfaceObs >> initialize [
	
	| unController |
	modeleObs := ModeleObs new.
	modeleObs addDependent: self.
	vueObs := VueObs new.
	vueObs model: modeleObs.
	modeleObs view: vueObs.	"hhhhhhhhhhhhhhhhhhhhhhh"
	unController := ControllerObs new.
	unController model: modeleObs.
	unController performer: self.
	vueObs controller: unController.
	compteur := 0 asValue.
	cycle := 10 asValue.
	lienHolder := true asValue.
	lienHolder onChangeSend: #lienHolderChanged to: self.
	interieurHolder := true asValue.
	interieurHolder onChangeSend: #interieurChanged to: self.
	aHolder := 10 asValue.
	bHolder := 10 asValue.
	extentHolder := 10 asValue.
	aHolder onChangeSend: #ellipseChanged to: self.
	bHolder onChangeSend: #ellipseChanged to: self.
	extentHolder onChangeSend: #ellipseChanged to: self.
	aSlider := RangeAdaptor on: aHolder start: 0 stop: 100 grid: 1.
	bSlider := RangeAdaptor on: bHolder start: 0 stop: 100 grid: 1.
	vueEllipse := VueEllipse new.
	changedOK := true.
	quitter := false.
	^self
]

{ #category : #parametres }
InterfaceObs >> interieurChanged [
	
	changedOK := false.
	vueEllipse interieur: interieurHolder value.
	aHolder value: vueEllipse a.
	bHolder value: vueEllipse b.
	changedOK := true
]

{ #category : #parametres }
InterfaceObs >> interieurHolder [
	"This method was generated by UIDefiner.  Any edits made here



	may be lost whenever methods are automatically defined.  The



	initialization provided below may have been preempted by an



	initialize method."
	
	^interieurHolder isNil
		ifTrue: [interieurHolder := false asValue]
		ifFalse: [interieurHolder]
]

{ #category : #preferences }
InterfaceObs >> lienHolder [
	"This method was generated by UIDefiner.  Any edits made here



	may be lost whenever methods are automatically defined.  The



	initialization provided below may have been preempted by an



	initialize method."
	
	^lienHolder isNil
		ifTrue: [lienHolder := false asValue]
		ifFalse: [lienHolder]
]

{ #category : #preferences }
InterfaceObs >> lienHolderChanged [
	
	| unAgent |
	unAgent := AgentObs new.
	unAgent Lien: lienHolder value.
	vueObs invalidate
]

{ #category : #parametres }
InterfaceObs >> menuFonction [
	
	| mb |
	mb := MenuBuilder new.
	mb add: 'Editer' -> #specialEditFonction.
	mb add: 'Evaluer' -> #specialEvalFonction.
	mb line.
	mb addFindReplaceUndo.
	mb line line.
	mb addCopyCutPaste.
	^mb menu
]

{ #category : #accessing }
InterfaceObs >> modeleObs [
	
	^modeleObs
]

{ #category : #'initialize-release' }
InterfaceObs >> postBuildWith: aBuilder [
	
	super postBuildWith: aBuilder
]

{ #category : #'initialize-release' }
InterfaceObs >> requestForWindowClose [
	self flag:#TODO.
			"Mauvaise compréhension de #closeRequest, #requestForWindowClose et #noticeOfWindowClose:"
			"#requestForWindowClose est appel√©e lorsqu'on tente de fermer la fen√™tre pour demadne confirmation (retourner false pour emp√™cher la fermeture).
	#noticeOfWindowClose: est appel√©e pour notifier qu'une fen√™tre vient d'√™tre ferm√©e.
	#closeRequest permet de demander par programmation la fermeture de la fen√™tre (passe par les m√©thodes pr√©c√©dentes (peut donc √™tre annul√© par requestForWindowClose)"
	super requestForWindowClose & quitter not
		ifTrue: [ self actionQuitter ].
	^ super requestForWindowClose
]

{ #category : #aspects }
InterfaceObs >> stepCounter [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^compteur isNil
		ifTrue: [compteur := 0 asValue]
		ifFalse: [compteur]
]

{ #category : #update }
InterfaceObs >> update: unS with: unO [
	"	unS == #Model ifTrue: [vueObs invalidate]."
	
	unS == #OpenFenetre ifTrue: [unO inspect]
]

{ #category : #accessing }
InterfaceObs >> vueObs [
	
	^vueObs
]
