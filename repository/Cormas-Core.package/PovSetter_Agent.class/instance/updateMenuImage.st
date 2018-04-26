image
updateMenuImage
	
	| menu |
	menu := (self builder componentAt: #imageOS) widget controller menu.
	imageOS model isStroked
		ifTrue:
			[(menu menuItemAt: 1)
				beOn;
				enable.
			(menu menuItemAt: 2)
				beOff;
				enable]
		ifFalse:
			[(menu menuItemAt: 1)
				beOff;
				enable.
			(menu menuItemAt: 2)
				beOn;
				enable].
	(menu menuItemAt: 3) enable.
	(menu menuItemAt: 4) enable.
	(self builder componentAt: #tailleSlider) enable