accessing
addClient: aClient
	
	| aList |
	aList := self clients list.
	(aList includes: aClient) ifFalse: [aList add: aClient]