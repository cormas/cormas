probes
removeProbe
	
	| victims probedMethod |
	probedMethod := self selectedMethod.
	victims := self probesToActUpon.
	victims do: [:each | self basicRemoveProbe: each].	"The following is necessary because apparently the method cache is not completely flushed."
	ObjectMemory garbageCollect.
	PDPManager changedMethodFrom: probedMethod to: probedMethod by: self