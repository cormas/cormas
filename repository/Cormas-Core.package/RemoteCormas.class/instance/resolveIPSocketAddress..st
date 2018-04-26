networking
resolveIPSocketAddress: anIPSocketAddress
	
	| ns distant |
	distant := openTalkClient activeBrokerAt: anIPSocketAddress.
	ns := distant namingService.
	remoteCormas := ns resolve: 'Cormas.current'