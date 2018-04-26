initialization
initializeLabels
	" Private - See superimplementor's comment "

	self setterAccessorCheckbox label: self translator tSetterAccessor.
	self getterAccessorCheckbox label: self translator tGetterAccessor.
	self notifyObsCheckbox label: self translator tNotifyObs.
	self toolbar
		firstButtonLabel: self translator tCancel;
		secondButtonLabel: self translator tOk.

