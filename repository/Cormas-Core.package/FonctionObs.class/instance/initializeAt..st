initialize-release
initializeAt: unX
	
	| tmp largeurOpt hauteurOpt origine etendue |
	level := 1.
	oneLevel := true.
	higherLevels := true.
	observateur := InterfaceObs new.	"observateur openInterface: #windowSpec."
	tmp := observateur allButOpenInterface: #windowSpec.
	window := tmp window.
	largeurOpt := Screen default bounds width - (20 + unX + 10).
	hauteurOpt := (Screen default bounds height - 40) / 2.
	origine := (unX + 20) @ (hauteurOpt + 50).
	etendue := largeurOpt @ (hauteurOpt - 40).
	window openIn: (origine extent: etendue).	"adaptor := observateur modeleObs adaptor."
	degreMax := 5.
	listeCanaux := OrderedCollection new.
	observateur modeleObs fonction: self.
	^self