initialize-release
initialize
	
	super initialize.
	self class current: self.
	"self menuHolder: self class mainMenu asValue.
	self defineObservation value: #openPovSetterGUI.
	self defineObservation onChangeSend: #defObservationChanged to: self.
	self listSocialEntities selectionIndexHolder onChangeSend:
			#listAgentsChanged to: self.
	self listSpatialEntities selectionIndexHolder onChangeSend:
			#listEntitesSpatialesChanged to: self.
	self listPassiveEntities selectionIndexHolder onChangeSend:
			#listEntitesPassivesChanged to: self."
	cycle isNil ifFalse: [cycle:= NewValueHolder value: 0]