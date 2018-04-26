private
addButtonAsDependent: aSpecWrapper for: aToolbar
	"If my indication, enablement, hidden, or labelImage is a ValueModel add a button view spec or toolbar as a dependent.  Answer the action required to remove this dependency"
	
	^(self addEnablementDependent: aSpecWrapper)
		, (self realAdornment addIndicationDependent: aSpecWrapper)
		, (self realAdornment addLabelImageDependent: aSpecWrapper)
		, (self addHiddenDependent: aToolbar)