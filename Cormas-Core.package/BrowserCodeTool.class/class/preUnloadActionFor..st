parcel load/unload/save
preUnloadActionFor: aParcel
	
	self allInstances do: [:each | ChangeSet removeDependent: each]