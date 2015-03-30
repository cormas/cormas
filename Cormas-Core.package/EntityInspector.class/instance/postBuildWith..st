private-resize dataset
postBuildWith: aBuilder
	
	aBuilder window whenAny: #(#bounds) send: #windowHasResized to: self.	"self ratioColumns onChangeSend: #columnsRatioChange to: self."
	^nil