run_private
closeWorkbook
	"Close the workbook and save the file"
	
	[self workbook
		close: self shouldSaveToFile
		fileName: fileName
		routeWorkbook: nil]
		on: COMDispatchError
		do: [:ex | ex exceptionInfo wCode = 1004 ifFalse: [ex pass]].
	self workbook release.
	self release