model observation
openPovSetterGUI
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self cormasModel class cellClass isNil
		ifTrue: [^self alert_DefineAttribute].
	self visualStateWin isNil
		ifTrue:
			[| setter |
			setter := PovSetterNotebook new openOn: self cormasModelClass.
			setter cormas: self.
			setter majorKeys selectionIndexHolder value: 1.
			self visualStateWin: setter builder window]
		ifFalse:
			[(self visualStateWin)
				raise;
				expand]