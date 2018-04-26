specs
defaultSpec

    <spec>
    ^ SpecLayout composed
		newColumn: [ : c | 
			c
				add: #methodsLabeledList;
				newRow: [ : r | r add: #finalStepLabeledTextInput left: 350 ] height: self toolbarHeight;
				add: #randomnessCheckbox height: self toolbarHeight;
				add: #toolbar height: self toolbarHeight ]