interface opening
addCheckWidgetsIn: aBuilder
	"we build dynamically the label spec and its widget from checks.
	the checks widgets should are below the labelDescription.
	we adjust the window's height since the numbers of checks is variable"
	
	| position descriptionLabelWrapper |
	descriptionLabelWrapper := aBuilder componentAt: #labelDescription.
	position := descriptionLabelWrapper bounds bottomLeft + (0 @ 10).
	self checks
		do:
			[:each | 
			self addSpecForCheck: each in: aBuilder at: position.
			position := position + (0 @ 40)].
	aBuilder windowSpec bounds height: position y + 150