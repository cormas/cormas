accessing
treesData
	"return the data to be plotted with the trees chart"

	^ (self theCMFireAutomataCells count: [ :c | c state = #tree ]) / self theCMFireAutomataCells size