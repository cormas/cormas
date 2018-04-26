- obsolete
changedWithNewComponents: aCollecOfComponents
	"the shape of the aggregate has changed, then new POVs must be created"
	
	self halt.	"not used anymore"	" 'la notifictaion direct aux povs a √©t√© remplac√© par une notifictaion via le spaceModel '"	"Ancienne m√©thode : self povs do: [: aPov | aPov addAll: aCollecOfComponents]."
	self currentSimulation spaceModel dispatchOneCompoundSpatialEntity: self