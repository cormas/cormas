global variables
browseReferencesToGlobal
	
	| binding |
	binding := self selectedVariableBinding.
	self navigator browseGlobalReferencesTo: binding