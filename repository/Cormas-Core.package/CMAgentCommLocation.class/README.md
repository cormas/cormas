AgentCommLocation is a class which subclass instances need to have the functionalities of AgentComm and AgentLocation

Instance Variables:
	acquaintances	<IndexedSet>	is a set of other communicating entities to communicate with.
	agentObs	<AgentObs>	is an instance of the interface agent (on the observer)
	channel	<Channel>	is used to receive, store and deliver messages processed by communication agents
	mailBox	<OrderedCollection>	an orderedCollection to store the received messages.

Methods

messageFromChannel: will receive as argument an instance of a subclass of Msg. It will be stored in the mailBox at last position.
nextMessage returns the first message in the mailBox and remove it from the mailBox.
sendMessage Synchronously: will ask the channel to store the message. It will be delivered at the end of the current time step.
sendmessageSynchrounously: will ask the channel to deliver the message immediately.

