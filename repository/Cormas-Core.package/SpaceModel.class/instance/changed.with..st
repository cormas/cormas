private - notification
changed: anAspectSymbol with: aParameter
	"All changes are redirected to cormasModel which can buffer them"
	
	self cormasModel registerSpaceModelChange: anAspectSymbol with: aParameter