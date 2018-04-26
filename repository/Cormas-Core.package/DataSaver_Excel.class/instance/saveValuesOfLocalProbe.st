+ save
saveValuesOfLocalProbe
	"Add the value of a probe to each sheet (probeFile type) at time 'time' "
	
	| sheetNumber aCollection |
	excel
		createSheetsFromProbes:
			(List withAll: (self probes keys collect: [:s | s asString])).
	sheetNumber := 1.
	self probes
		keysAndValuesDo:
			[:probe :dicoID | 
			self
				saveTimeStepsLabeled: 'Time : ' , probe asString
				OnSheet: probe asString.
			dicoID
				keysAndValuesDo:
					[:id :coll | 
					aCollection := self getCollectionOfNumbers: coll.
					aCollection addFirst: 'id_' , id printString.
					self
						saveCollectionWithLabel: aCollection
						onSheet: probe asString].
			self excel formatSheet: probe asString.
			sheetNumber := sheetNumber + 1].
	self excel isVisible: true.	"self excel createChartFromSheet: self excel sheets first."
	self excel saveFile.
	COMSessionManager shutdownImage.
	excel := nil	"self excel closeApplication"