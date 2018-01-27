SimManager is an auxiliary class of CormasModel. Its purpose is to support CormasModel in the management of ONE simulation.
Thus, it is a crucial for triggering: 1 step, 1 run or 1 complete analysis.
SimManager is also responsible of the the Replays (forward or backward).
(1 instance of CormasModel is always linked with 1 instance of SimManager)

Instance Variables:
	buttonsForwardAreOn	<Boolean>	description of buttonsForwardAreOn
	cormasModel	<CormasModel>	description of cormasModel
	deviationChoice	<ValueModel>	description of deviationChoice
	dontAsk	<ValueHolder>	description of dontAsk
	enableBackward	<Boolean>	description of enableBackward
	enableBackwardValue	<ValueModel>	description of enableBackwardValue
	finalStep	<ValueModel>	description of finalStep
	fixRandomSeed	<ValueModel>	description of fixRandomSeed
	listControle	<SelectionInList>	description of listControle
	listInit	<SelectionInList>	description of listInit
	listProbes	<MultiSelectionInList>	description of listProbes
	nextStep	<ValueHolder>	description of nextStep
	process	<Process>	description of process
	randomSeed	<ValueModel>	description of randomSeed
	releaseRandomSeed	<ValueModel>	description of releaseRandomSeed
	simFolder	<Filename>	description of simFolder
	simName	<String>	description of simName
	simNumero	<SmallInteger>	description of simNumero
	traceSize	<SmallInteger>	description of traceSize

