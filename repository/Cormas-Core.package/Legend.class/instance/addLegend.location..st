actions
addLegend: classMethod location: pos
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