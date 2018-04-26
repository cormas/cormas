aspects
setChanged
	"add the 'self changed' instruction of  setter accessor of the attribute targeted by the selected row"
	
	| aCAV |
	aCAV := self selectedRow value.
	aCAV isNil ifTrue: [^self cormas warn: 'Please, select a row.'].
	(self class
		isChangedPerformedForAttribut: aCAV targetAttribute
		ofClass: aCAV targetClass)
		ifFalse:
			[(self cormas confirm:
					'Do you want to update the space window and the other observers each time the value of this attribute is changed ?')
				ifTrue:
					[self class
						silentlyDefineSetterMethodWithObserverNotification:
							aCAV targetAttribute
						ofClass: aCAV targetClass
						protocol: 'accessing']]
		ifTrue:
			[(self cormas confirm:
					'Do you want to remove the update of the space window and the other observers when the value of this attribute is changed ?')
				ifTrue:
					[self class
						silentlyDefineSetterMethod: aCAV targetAttribute
						ofClass: aCAV targetClass
						protocol: 'accessing']]