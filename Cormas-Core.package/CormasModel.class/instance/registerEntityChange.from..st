private - notification
registerEntityChange: aSymbol from: anEntityReference
	"report a change from anEntity (sent encapsulated in an entityReference). These changes can be delayed in order to make one remote call with many changes"
	
	^self registerEntityChange: aSymbol with: nil from: anEntityReference