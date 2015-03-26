CormasModel is one of the main class of Cormas. It is the super class of your model class.

When you create a new model in Cormas (ex: MyModel), a sub class of CormasModel is created; its name is the name of your model. 
For example:
CormasNS.Models.MyModel defineClass: #MyModel
	superclass: #{CormasNS.Kernel.CormasModel}
	indexedType: #none
	private: false
	instanceVariableNames: ''
	classInstanceVariableNames: ''
	imports: ''
	category: 'MyModelCategory'  
This class allows to initiate a simulation and to schedule it.
Your subclass will contain attributs like 'theCells' for example which are OrderedCollections storing the instances of your entities.

Instance Variables
	activeControl	<Symbol>	it memorizes the name of the control method that have been selected by the user (ex: #stepSynchronously)
	activeInit	<Symbol>	it memorizes the name of the control method that have been selected by the user (ex: #init)
	channel	<Channel>	a channel for messages communication
	data	<Dictionary of Dictionaries>	It stocks the values of the probes selected by the user.
			The key of the first Dictionary is the name of the class contzining the probes. This key 			points to another Dictionary. Each key of this second dictionary is the name of the probe; 			it points to a List of values of the probe.
			(ex: 
			Dictionary (#Conway->Dictionary (#alive->List () 
											 #dead->List () ) 
					    #Cell->Dictionary (#isAlive->Dictionary () ) )
	periodicity	<Integer>	It may be used into the step method by calling 'testPeriod' : it tests if the timeStep is at the begining of the periodicity
	simManager	<SimulationsManager>	see description of SimManager
	spaceModel	<SpaceModel>	see description of SpaceModel
	timeStep	<Integer>	describes the current time step

