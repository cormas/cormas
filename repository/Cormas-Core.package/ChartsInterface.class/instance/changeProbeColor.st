menus
changeProbeColor
	
	| dialog isGlobal targetClass |
	isGlobal := self levelClassName = cormasModel class name.
	dialog := MultiColorChooser new.
	isGlobal
		ifTrue: [dialog setElementColorDictionary: self colorForGlobalProbes]
		ifFalse: [dialog setElementColorDictionary: self colorForLocalProbes].
	self chartsList selections isEmpty
		ifFalse:
			[dialog listElements selection: self chartsList selections first].
	dialog open.
	self updateChartsDisplay.
	isGlobal
		ifTrue:
			[self colorForGlobalProbes
				keysAndValuesDo: [:k :v | cormasModel setColor: v forProbe: k]]
		ifFalse:
			[self colorForLocalProbes
				keysAndValuesDo:
					[:k :v | 
					targetClass := levelClassName class.
					targetClass setColor: v forProbe: k]]