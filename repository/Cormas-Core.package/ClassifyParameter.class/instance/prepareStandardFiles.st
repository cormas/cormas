initialize-release
prepareStandardFiles
	
	standardAnalysis := SimpleStochasticAnalysis newOn: self cormasModel.
	standardAnalysis allAttributsList: self allAttributesList.
	standardAnalysis probeFormat: probeFormat.
	standardAnalysis listControle: listControle.
	standardAnalysis fixRandomSeed: fixRandomSeed.
	standardAnalysis listProbes: listProbes.
	standardAnalysis randomSeed: randomSeed.
	standardAnalysis nbOfRepeat: nbOfRepeat.
	standardAnalysis listInit: listInit.
	standardAnalysis fileFormat: #csv asValue.
	standardAnalysis finalStep: finalStep.
	standardAnalysis releaseRandomSeed: releaseRandomSeed.
	standardAnalysis prepareFiles