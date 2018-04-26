- displaying
changed
	"an entityChange of type #valueChanged is sent to the cormasModel which delays it or not and then send it to the spaceModel which will then notify the spaceInterfaces (on the server or clients side)
The notification is sent not from self but from an entityReference of self which stores the class and id of the entity. The class and id will be sent has value passMode to the remote computers while the entity will be sent has reference passMode to the remote computers. The remote  computers are supposed to use has much as possible the class and id values instead of the enity reference in order to limit the messages from the client to the server"
	
"	^self isSituated
		ifTrue:
			[self currentSimulation
				registerEntityChange: #valueChanged
				with: (EntityReference on: self patch)
				from: (EntityReference on: self)]
		ifFalse:
			[self currentSimulation
				registerEntityChange: #valueChanged
				from: (EntityReference on: self)]"