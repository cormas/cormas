collector
collect: anEntity
	"this add anEntity to cormasModel collection (theXXXs).
This works but this is not the best way to do !
We suggest to use 'newAndCollect: aCollector' to create and collect an entity"
	
	| cormasForModel instOfCormasModel |
	cormasForModel := Cormas allInstances
		select: [:corm | corm cormasModelClass = anEntity modelClass].
	cormasForModel size = 1
		ifTrue:
			[instOfCormasModel := cormasForModel first cormasModel.
			anEntity collector: instOfCormasModel collector.
			instOfCormasModel collector collect: anEntity.
			^anEntity]
		ifFalse:
			[self inform: 'Only ONE simulation is possible']