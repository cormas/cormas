The root class of the entities of the models.
The Id of each instance of the subclass is defined at the level of the class (it is not an OID) and reset at each simulation initialisation.


Subclasses must implement the following messages:
	Instance protocol:
		init
			initId
	Class protocol:
		accessing
			CurrentId


Instance Variables:
	id	<Integer>  The Id of each instance of the subclass is defined at the level of the class (it is not an OID) and reset at each simulation initialisation.
	flag	<Boolean>  Used to perform some processes
	request	<OrderedCollection>  Each element is an array made of three items: <Symbol> <Number> <Entity>. The first item is the name ot the common-pool resource stored by the entity, the second one is a quantity of CPR, the last one is the requester (an instance of Entity) of that amount of CPR


Class Instance Variables:
	isGeneric	<Boolean>  comment
	activePov	<Symbol>  The current pov. ex: #pov
	colorsDict	<Dictionary>  a Dictionary with the ColorValue of the activePov.
				ex: Dictionary (#alive->(ColorValue red: 0.0 green: 0.670004 blue: 0.0) 
									    #dead->ColorValue black )
	image	<Image>  of the entity
	pdvDict	<Dictionary>  ex: Dictionary (#pov->OrderedCollection () )
	activeProbes	<OrderedCollection>  ex: OrderedCollection (#isAlive)
