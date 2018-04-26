specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :c | 
			c 
				add: #menuToolbar height: self toolbarHeight;
				add: #simWindow ];
		yourself