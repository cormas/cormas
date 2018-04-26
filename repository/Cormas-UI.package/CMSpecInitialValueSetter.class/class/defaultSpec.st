specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ : column |
			column 
				newRow: [ : r |	r add: #initialValueLabel ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #numberRadioButton; add: #numberTextField ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #randomRadioButton; add: #randomTextField ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #booleanRadioButton; add: #booleanList ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #stringRadioButton; add: #stringTextField ] height: self inputTextHeight;
				newRow: [ : r |	r add: #collectionRadioButton; add: #collectionList ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #arrayRadioButton; add: #arrayTextField ] height: self inputTextHeight + 4;
				newRow: [ : r |	r add: #newEntityRadioButton; add: #newEntityTextField ] height: self inputTextHeight;
				newRow: [ : r |	r add: #noValueRadioButton ] height: self inputTextHeight + 4;
					
				newRow: [ : r |	 ] 	] 			
		yourself