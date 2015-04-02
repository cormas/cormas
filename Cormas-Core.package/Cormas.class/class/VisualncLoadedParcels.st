util_parcels
VisualncLoadedParcels
	"return a collection with the name of the default loaded parcels"
	
	| coll |
	coll := OrderedCollection new.
	coll
		add: 'Non-Commercialization';
		add: 'SLesson';
		add: 'SUnitUI';
		add: 'SUnitTests';
		add: 'SUnit';
		add: 'SUnitPreload';
		add: 'UIPainter';
		add: 'RBSmalllintUI';
		add: 'RBSmalllint';
		add: 'RBBrowserUI';
		add: 'RBRefactoringUI';
		add: 'RBRefactorings';
		add: 'RBChangeObjects';
		add: 'RBBaseUI';
		add: 'RBParser';
		add: 'RBEnvironments';
		add: 'RBBrowserNamespace';
		add: 'Refactory';
		add: 'ImmutabilityCompatibility';
		add: 'NetNamespace';
		add: 'URISupport';
		add: 'XML-source';
		add: 'XML'.
	^coll