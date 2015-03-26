procedures
transmit: aMsg
	"will immediately deliver the message to the receiver of the message. "
	
	aMsg receiver messageFromChannel: aMsg.
	listeFonctionObs do: [:fobs | fobs message: aMsg]