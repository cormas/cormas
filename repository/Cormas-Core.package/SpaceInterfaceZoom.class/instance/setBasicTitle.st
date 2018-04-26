drawing description
setBasicTitle
	"Set the title of the grid window"
	
	| pov |
	pov := self activeSpatialEntity name asString , ' -> '
		, (self povMethodDicoAt: self activeSpatialEntity) asString.
	basicTitle := 'Zoom ' , pov