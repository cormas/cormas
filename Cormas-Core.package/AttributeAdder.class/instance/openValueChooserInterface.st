defaultParameters
openValueChooserInterface
	
	| aCAV |
	aCAV := ClassAttributeValue new.
	aCAV targetClass: targetClass.	"dialogValue := SimpleDialog new. 
	dialogValue openFor: aCAV interface: #valueChooserWindow."
	aCAV openDialogInterface: #valueChooserWindow.
	^aCAV