initialize-release
reinitializeAt: unX
	
	| tmp largeurOpt hauteurOpt origine etendue unController |
	level := 1.
	oneLevel := true.
	higherLevels := true.	"observateur openInterface: #windowSpec."
	tmp := observateur allButOpenInterface: #windowSpec.
	window := tmp window.
	largeurOpt := Screen default bounds width - (20 + unX + 10).
	hauteurOpt := (Screen default bounds height - 40) / 2.
	origine := (unX + 20) @ (hauteurOpt + 50).
	etendue := largeurOpt @ (hauteurOpt - 40).
	window openIn: (origine extent: etendue).
	unController := ControllerObs new.
	unController model: observateur modeleObs.
	unController performer: observateur.
	observateur vueObs controller: unController.
	unController initializeMenuCustom.	"adaptor := observateur modeleObs adaptor."
	degreMax := 5.
	^self