+ common-pool resources
receiveRequestAbout: anAttribute qty: qty from: aRequester
	"Purpose: stores the request (a quantity of an attribute) made by a requester
Arguments: anAttribute = <Symbol>
			qty = <Number>
			aRequester = <Entity>
Example: self receiveRequestAbout: #surfaceWater qty: 2 from: aFarmer"
	
	self request addLast: (Array with: anAttribute with: qty with: aRequester)