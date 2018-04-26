initialize-release
initialize
	
	| unController |
	modeleObs := ModeleObs new.
	modeleObs addDependent: self.
	vueObs := VueObs new.
	vueObs model: modeleObs.
	modeleObs view: vueObs.	"hhhhhhhhhhhhhhhhhhhhhhh"
	unController := ControllerObs new.
	unController model: modeleObs.
	unController performer: self.
	vueObs controller: unController.
	compteur := 0 asValue.
	cycle := 10 asValue.
	lienHolder := true asValue.
	lienHolder onChangeSend: #lienHolderChanged to: self.
	interieurHolder := true asValue.
	interieurHolder onChangeSend: #interieurChanged to: self.
	aHolder := 10 asValue.
	bHolder := 10 asValue.
	extentHolder := 10 asValue.
	aHolder onChangeSend: #ellipseChanged to: self.
	bHolder onChangeSend: #ellipseChanged to: self.
	extentHolder onChangeSend: #ellipseChanged to: self.
	aSlider := RangeAdaptor on: aHolder start: 0 stop: 100 grid: 1.
	bSlider := RangeAdaptor on: bHolder start: 0 stop: 100 grid: 1.
	vueEllipse := VueEllipse new.
	changedOK := true.
	quitter := false.
	^self