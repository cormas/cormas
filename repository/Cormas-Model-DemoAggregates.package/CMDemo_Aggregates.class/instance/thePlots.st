accessing
thePlots

	^ thePlots 
		ifNil: [ thePlots := IndexedSet new ]