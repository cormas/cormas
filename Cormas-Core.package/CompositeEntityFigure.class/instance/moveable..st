attribute accessing
moveable: aBoolean
	
	self components do: [:fig | fig moveable: aBoolean].
	super moveable: aBoolean