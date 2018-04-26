main menu
openModel
	
	| tmp aModel |
	tmp := (CormasModel subclasses select: [:m | m subclasses isEmpty])
		asSortedCollection: [:a :b | a name < b name].
	tmp
		remove: CormasModelGameInterface
		ifAbsent: [nil].
	tmp isEmpty
		ifTrue:
			[self alert_NoModel.
			^self].
	aModel := Dialog
		choose: self chooseModel
		fromList: tmp
		values: tmp
		lines: 8
		cancel: [^nil].
	self cormasModelClass notNil
		ifTrue:
			[self cormasModelClass visualStateIsOpen
				ifTrue: [self visualStateWin closeRequest].
			self closeModel].
	self openModel: aModel