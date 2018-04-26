deplacement
bouger
	
	| F d |
	F := 0 @ 0.
	preferences
		keysAndValuesDo:
			[:unAgentObs :uneVal | F := F + (self Force: unAgentObs valeur: uneVal)].
	F := F + self AttractionCentre.
	d := F rrr rounded.	"min: Deplacement."
	d * 5 > self Deplacement
		ifTrue:
			[centre := centre + (d rounded * F unitVector).
			^true].
	^false