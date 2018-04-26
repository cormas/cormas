private
removeSelector: aSelector from: aClass
	"remove a selector from aClass. Do nothing if aSelector is absent for aClass"
	
	aClass removeSelector: aSelector	"No need for check"