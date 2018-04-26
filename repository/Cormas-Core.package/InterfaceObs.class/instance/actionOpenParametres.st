actions
actionOpenParametres
	
	| tmp |
	modeleObs isInitialized ifFalse: [^self].
	tmp := AgentObs new.
	self deplacement value: tmp Deplacement.
	dialogParametres := SimpleDialog new.
	dBuilder := dialogParametres builder.
	vueEllipse rrr: 1.	"modeleObs adaptor imageEtDico geometric radius floor"
	dBuilder aspectAt: #vueEllipse put: vueEllipse.
	dialogParametres openFor: self interface: #ecranParametres.
	tmp Deplacement: deplacement value.
	vueEllipse interieur: true.
	tmp A: vueEllipse a.
	tmp B: vueEllipse b.
	vueEllipse interieur: false.
	tmp AA: vueEllipse a.
	tmp BB: vueEllipse b.
	tmp Eint: vueEllipse e.
	tmp Eext: vueEllipse f