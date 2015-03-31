private - init
initializeView
	
	| aView |
	"self release."
	aView := SpaceView new.
	aView model: self.
	aView controller: SpaceController new.
	aView controller performer: self.
	aView contextualMenu