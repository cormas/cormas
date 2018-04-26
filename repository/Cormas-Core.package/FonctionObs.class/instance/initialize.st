initialize-release
initialize
	
	| tmp win |
	msgObs := List new.
	level := 1.
	oneLevel := true.
	higherLevels := true.
	observateur := InterfaceObs new.	"observateur openInterface: #windowSpec."
	tmp := observateur allButOpenInterface: #windowSpec.
	win := tmp window.
	win openIn: (380 @ 20 extent: win minimumSize).	"adaptor := observateur modeleObs adaptor."
	degreMax := 5.
	listeCanaux := OrderedCollection new.
	observateur modeleObs fonction: self.
	^self