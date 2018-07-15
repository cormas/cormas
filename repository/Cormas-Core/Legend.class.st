Class {
	#name : #Legend,
	#superclass : #Model,
	#instVars : [
		'legendes',
		'isOpen',
		'yWin',
		'xWin',
		'currentWinPos',
		'mainInterface',
		'povDict'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #actions }
Legend >> addLegend: classMethod location: pos [
	"classMethod = an Array ex:#(Plant 'pov') pos = <Point>"
	
	| class legend legendList l max plusGrandeString widths winWidth color tempStr |
	max := 0.
	widths := Array new: 2.
	legendList := OrderedCollection new.	"legendList = OrderedCollection (#AnnualCrop '' #Fallow '' #Pasture '' #TreeCrop '' #Forest '' #OldAnnualCrop '') "
	class := classMethod first.
	self
		prepareLegend: class
		pov: (classMethod at: 2).
	(self
		povDictAt: class
		at: (classMethod at: 2))
		do:
			[:symbol | 
			tempStr := symbol.
			(class colorsDict includesKey: symbol)
				ifFalse: [tempStr := tempStr , ' (undefined)'].
			legendList add: tempStr.
			max < tempStr size
				ifTrue:
					[max := tempStr size.
					plusGrandeString := tempStr].
			legendList add: ''].
	legend := LegendWin new.
	legend init: classMethod.
	legend legendes: self.
	legend affectLegend: legendList.
	legend ouvrirVue.
	(legend builder componentAt: #pdvMethod) widget
		labelString: (classMethod at: 2).
	self mainInterface builder window beMaster.
	(legend builder window)
		application: self mainInterface builder window application;
		beSlave.
	legend builder window label: 'legend: ' , classMethod first name asString.
	legendes add: legend.
	l := 0.	"** on met la couleur de fond dans tableInterface **"	"class setLegendImage: legend."
	(self
		povDictAt: class
		at: (classMethod at: 2))
		do:
			[:symbol | 
			l := l + 1.
			(class colorsDict includesKey: symbol)
				ifTrue: [color := class colorsDict at: symbol]
				ifFalse: [color := ColorValue white].
			legend tableInterface
				backgroundColorAtIndex: 2 @ l
				put: color].	"** on essaie de regler la taille de la fenetre  ;o)  **"
	widths
		at: 1
		put:
			(legend builder window graphicsContext widthOfString: plusGrandeString) + 3.
	widths at: 2 put: 30.
	legend tableInterface columnWidths: widths.
	legend tableInterface rowHeights: 1.
	winWidth := (legend builder window graphicsContext
		widthOfString: 'legend: ' , (classMethod at: 2)) max: 30 + widths first.
	winWidth := winWidth + 40.	"on rajoute la largeur des boutons"
	legend builder window
		displayBox: (pos extent: winWidth @ (60 + (legendList size * 10))).
	((self mainInterface menuHolder value atNameKey: #tools) submenu
		atNameKey: #activateLegend) isOn
		ifTrue:
			[legend builder window openIn: legend builder window displayBox.
			legend isOpened: true]
		ifFalse: [legend isOpened: false]
]

{ #category : #'accessing method dictionary' }
Legend >> findMethod: method forClass: aClass [
	"Answer an Array with the class and selector for this method,
	or nil if the method is not found."
	
	| sel |
	sel := aClass
		compiledMethodAt: method
		ifAbsent: [nil].
	sel == nil ifFalse: [^Array with: aClass with: sel].
	^aClass superclass == nil
		ifTrue: [nil]
		ifFalse:
			[self
				findMethod: method
				forClass: aClass superclass]
]

{ #category : #initialisation }
Legend >> init [
	"comment stating purpose of message"
	
	legendes := OrderedCollection new.
	isOpen := false.
	currentWinPos := 360 @ 10
]

{ #category : #acces }
Legend >> isOpen [
	
	^isOpen ifNil: [isOpen := false]
]

{ #category : #acces }
Legend >> legendes [
	"comment stating purpose of message"
	
	^legendes
]

{ #category : #acces }
Legend >> legendes: x [
	"comment stating purpose of message"
	
	legendes := x
]

{ #category : #acces }
Legend >> mainInterface [
	
	^mainInterface
]

{ #category : #acces }
Legend >> mainInterface: x [
	
	mainInterface := x
]

{ #category : #actions }
Legend >> majLegendes: classMethod [
	"classMethod = an Array ex:#(Plant 'pov')"
	
	| classe methode found posFound |
	classe := classMethod first.
	methode := classMethod at: 2.
	found := legendes
		detect: [:leg | leg classe = classe]
		ifNone: [nil].
	found
		ifNotNil:
			[found methode = methode
				ifFalse:
					[methode = 'nil'
						ifFalse:
							[posFound := found builder window displayBox origin.
							self removeLegend: found.
							self addLegend: classMethod location: posFound]
						ifTrue:
							[found builder window displayBox origin = currentWinPos
								ifTrue:
									[currentWinPos := (currentWinPos x - 10) @ (currentWinPos y - 30)].
							self removeLegend: found]]]
		ifNil:
			[methode = 'nil'
				ifFalse:
					[isOpen
						ifTrue:
							[currentWinPos := (currentWinPos x + 10) @ (currentWinPos y + 30)].
					self addLegend: classMethod location: currentWinPos]]
]

{ #category : #accessing }
Legend >> povDict [
	
	^povDict ifNil: [povDict := Dictionary new]
]

{ #category : #accessing }
Legend >> povDict: anObject [
	
	povDict := anObject
]

{ #category : #accessing }
Legend >> povDictAt: aClass [
	
	^self povDict
		at: aClass
		ifAbsentPut: [Dictionary new]
]

{ #category : #accessing }
Legend >> povDictAt: aClass at: aPovName [
	
	^(self povDictAt: aClass)
		at: aPovName
		ifAbsent: [Array new]
]

{ #category : #accessing }
Legend >> povDictAt: aClass at: aPovName put: listSymbolito [
	
	^(self povDictAt: aClass) at: aPovName put: listSymbolito
]

{ #category : #actions }
Legend >> prepareLegend: aClass pov: aSelectorName [
	"fill the povDict dictionary for aClass and the symbols associated to aSelectorName.
ex : listSymbolito = OrderedCollection (#A #B #C #B)"
	
	| aText listSymbolito list1 symbolito count cond cr method |
	method := (self
		findMethod: aSelectorName asSymbol
		forClass: aClass) at: 2.
	aText := method mclass sourceCodeAt: aSelectorName asSymbol.	"JFL : the following old code doesn't work in a runtime image
	aText := ((self findMethod: (aSelectorName asSymbol) forClass: aClass) at: 2) getSource."
	listSymbolito := OrderedCollection new.
	list1 := aText string tokensBasedOn: $^.
	list1 removeAllSuchThat: [:str | str first ~= $#].
	list1
		do:
			[:subString | 
			symbolito := String new.
			count := 1.
			cond := true.
			[cond]
				whileTrue:
					[count := count + 1.
					cr := subString at: count.
					symbolito := symbolito , (String with: cr).
					count = subString size ifTrue: [cond := false].
					cond
						ifTrue:
							[(subString at: count + 1) isLetter not ifTrue: [cond := false]]].
			listSymbolito add: symbolito asSymbol].
	self povDictAt: aClass at: aSelectorName put: listSymbolito
]

{ #category : #actions }
Legend >> removeLegend: aLegendWin [
	"comment stating purpose of message"
	
	aLegendWin closeRequest
]

{ #category : #acces }
Legend >> supervisor: x [
	"comment stating purpose of message"
	
	mainInterface := x
]
