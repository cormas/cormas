ParameterInterface allows to set and change the values of the parameters from an interface. Its main interface (a grid of 3 columns) is opened from Simulation menu of Cormas.
There are 2 types of default values of the parameters:
 - the InitialValues that are set at the initialisation of a simulation
 - the DefaultValues that are predefined in the model.
If the user changes the value of a parameter (xxx for instance) to test its impacts, the InitialValue (originaly equals to the defaultValue) is changed: the reader accessor (#xxx) of the attribute is compiled with the new value assigned by user. To return back to the defaultValue, the reader accessor is recompiled using the default value that is stored into #xxx_default method (in '- default value' protocol at the class level).
ParameterInterface can be customised by hidding attributes (menu Settings).

Instance Variables:
	hiddenParametersInterface	<DefaultAttributesSetter>	description of hiddenParametersInterface

