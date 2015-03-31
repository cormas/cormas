- initialize-release
initOcc
	
	self allOccupants do: [:a | a leave]	"self spaceModel cormasModel class occupantClasses isEmpty 
		ifFalse: 
			[self allOccupants do: [:a | a leave].
			theOccupants := Dictionary new.
			self spaceModel cormasModel class occupantClasses 
				do: [:e | theOccupants at: (e name) put: OrderedCollection new]]"