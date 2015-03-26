private - notification
registerEntityChange: aSymbol with: aParameter from: anEntity
	"report a change from anEntity. These changes can be delayed in order to make one remote call with many changes"
	
	self
		registerChange:
			(EntityChange newChange: aSymbol with: aParameter from: anEntity)