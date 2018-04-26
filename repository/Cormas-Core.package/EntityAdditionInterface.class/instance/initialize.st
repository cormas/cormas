initialize-release
initialize
	
	super initialize.
	self cbComm onChangeSend: #cbSuperclassChanged to: self.
	self cbGroup onChangeSend: #cbSuperclassChanged to: self.
	self cbLocation onChangeSend: #cbSuperclassChanged to: self.
	self spatialEntitySuperclass onChangeSend: #crSpatialSuperclassChanged to:
			self.
	self passiveEntitySuperclass onChangeSend: #crPassiveSuperclassChanged to:
			self