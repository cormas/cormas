api
shareCormas: aCormas
	"
	CormasNS.Kernel.Cormas allInstances first share
	"
	
	Transcript
		cr;
		show: 'sharing cormas'.
	self server namingService rebind: 'Cormas.current' to: aCormas