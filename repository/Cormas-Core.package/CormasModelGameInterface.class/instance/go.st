actions
go
	
	self model decisionsSheetsReport add: self model decisionsSheets.
	self model runDecisionsSheets.
	self model repetitionDecisionsSheets: self validity value - 1.
	self accept value: true