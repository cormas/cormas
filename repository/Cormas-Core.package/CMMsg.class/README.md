Msg is an Object that will serve for communication. Any agents which needs to send a Msg will create an instance of a subclass of Msg and fulfil it. The message will have at least three attributes listed below. It is up to the modeller to create new instance variables to be used for the exchanges modelled.

Instance Variables:
	receiver	<LensAbsentee | Object>	description of receiver : it is an instance of a class inheriting from AgentComm or AgentCommLocation or GroupComm or GroupCommLocation. It means that the receiver has a mailbox and will be automatically registered by the channel.
	sender	<LensAbsentee | Object>	description of sender. Usually it is the instance of the entity sending the message. But the entity sending the message can leave it blank ( for anonymous message) or even fulfill it with another agent adress. 
	symbol	<Object>					content of the message to be fufilled to give some sense to the conversation. It can be anything. The undelying idea is to use it for meta-information on the conversation (indicating if it is a proposal, an acceptance, a denial, etc.).

Methods :
from: and from: to: are two methods to fulfill the sender and receiver attributes.

methods in the protocol pov are methods which output must be true or false. These pov methods are cretaed through Cormas interface (Model-> Define the observation->Communication). When selected at the interface of the observer it will be applied on each message transmitted by the channle. If the output is true a line betwwen the sender and the receiver will be displayed. By default always and never are proposed. They can be copied at the level of the subclass.

Class methods.

isObserved set the active pov.



