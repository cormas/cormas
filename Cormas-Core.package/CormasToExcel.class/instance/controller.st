accessing
controller
	"Answer the Excel Application controller"
	
	controller notNil ifTrue: [^controller].
	^controller := ExcelApplicationController new