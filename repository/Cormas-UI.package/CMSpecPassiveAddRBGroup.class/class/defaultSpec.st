specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :row |
			row 
				add: #buttonObject;
				add: #buttonLocatedObject;
				add: #buttonNetworkNode;
				add: #buttonNetworkArc;
				add: #buttonFullNetwork;
				add: #buttonMessage ];
		yourself