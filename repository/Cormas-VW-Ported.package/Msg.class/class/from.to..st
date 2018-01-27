instance creation
from: unAgent to: unAutre
	"Purpose: Creates a message with a sender and a receiver. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: aSymbol = <anObject>
			anObject = <anObject>
Example: Msg topic: #comeHere content: aSpatialEntity)"
	
	^super new from: unAgent to: unAutre