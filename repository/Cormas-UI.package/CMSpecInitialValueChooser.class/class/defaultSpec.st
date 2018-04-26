specs
defaultSpec

    <spec>
    ^ SpecLayout composed
			newColumn: [ : c | 
				c 
					newRow: [ : r | r add: #setterAccessorCheckbox ] origin: 0 @ 0 corner: 0 @ 0.1;
					newRow: [ : r | r 
						add: #getterAccessorCheckbox;
						add: #notifyObsCheckbox ] origin: 0 @ 0.35 corner: 0 @ 0.5 ]
			origin: 0.05 @ 0.03 corner: 0.95 @ 0.4;
			newColumn: [ : c | c add: #initialRBGroup ]
			origin: 0.05 @ 0.15 corner: 0.95 @ 1;
			newRow: [ : r | r add: #toolbar ] origin: 0 @ 0.9 corner: 1 @ 1;
			yourself.