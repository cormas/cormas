actions
isSameServerAndClient
	"true if the broker specification and the client specification are same"
	
	^self brokerNameOrIP value = self serverNameOrIP value
		and: [self brokerPort value = self serverPort value]