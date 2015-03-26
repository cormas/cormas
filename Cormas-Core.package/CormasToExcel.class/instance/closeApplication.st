run
closeApplication
	"Close the Excel application and save the worksheet a the given 
	fileName at the pathName"
	
	[self closeWorkbook] ensure: [self workbook release].
	COMSessionManager shutdownImage	"terminateServer allOwnedInterfaces"