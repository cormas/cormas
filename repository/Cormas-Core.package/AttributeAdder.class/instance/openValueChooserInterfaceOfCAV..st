defaultParameters
openValueChooserInterfaceOfCAV: aCAV
	"dialogValue := SimpleDialog new.
	dialogValue openFor: aCAV interface: #valueChooserWindow.	"
	"	aCAV openDialogInterface: #valueChooserWindow."
	
	aCAV openDialogInterface: #valueChooserWindow.
	aCAV acceptValue