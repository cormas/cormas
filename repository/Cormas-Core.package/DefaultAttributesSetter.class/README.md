DefaultAttributesSetter is the root class that allows to set and change the values of the parameters.
There are 2 types of default values of the parameters:
 - the InitialValues that are set at the initialisation of a simulation
 - the DefaultValues that are predefined in the model.
If the user changes the value of a parameter (xxx for instance) to test its impacts, the InitialValue (originaly equals to the defaultValue) is changed: the reader accessor (#xxx) of the attribute is compiled with the new value assigned by user. To return back to the defaultValue, the reader accessor is recompiled using the default value that is stored into #xxx_default method (in '- default value' protocol at the class level).

Instance Variables:
	classAttribValue_List	<SelectionInListSortAware>	description of classAttribValue_List
	cormasModel	<CormasModel>	description of cormasModel
	defaultValueHolder	<ValueModel>	description of defaultValueHolder
	dialogValue	<SimpleDialog>	description of dialogValue
	getterAccessor	<ValueModel>	description of getterAccessor
	selectedRow	<ValueModel>	description of selectedRow
	setterAccessor	<ValueModel>	description of setterAccessor

