actions
actionGo
	
	modeleObs isInitialized ifFalse: [^self].
	cycle value
		timesRepeat:
			["(self builder componentAt: #vueObs) widget update: #invalidate."
			"	compteur value: compteur value + 1."
			modeleObs actionUnTour
				ifFalse:
					["self halt."
					^self]]