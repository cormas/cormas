run_private
closeWorkbook_old
	"Close the workbook and save the file"
	"["
	
	self workbook
		close: self shouldSaveToFile
		fileName: fileName
		routeWorkbook: nil	"self workbook release.
	self workbook: nil.
	self release"	"]
		on: COMDispatchError do: [:ex |
		ex exceptionInfo wCode = 1004 ifFalse: [ex pass]]"