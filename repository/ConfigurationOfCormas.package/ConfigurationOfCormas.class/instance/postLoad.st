doits
postLoad
	" Private - Execute post install actions "

	self closePharoWelcomeWindow.
	(Smalltalk at: #PFProjectApplication) applicationClass: (Smalltalk at: #CMApplicationProject).
	(Smalltalk at: #FDMorphicUIManager) new beDefault.
	"TaskbarMorph showTaskbar: false."
	self unloadPackages.
