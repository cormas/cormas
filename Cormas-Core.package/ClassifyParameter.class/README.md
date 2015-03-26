ClassifyParameter allows to conduct OAT ("One-Factor-At-A-Time") sensitivity analysis by modifying parameters' values. It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing its initial value (+/- 5, 10, 15 or 20 %). 
ClassifyParameter run 2 sessions of analysis: one with standard specifications of the parameters, then one with the new values of the parameters. Then it calculates the Sensitivity of each parameter in order to sort them as a sensitivity gradient.

Instance Variables:
	percent	<ValueModel>	description of percent
	plusMinus	<ValueModel>	description of plusMinus
	standardAnalysis	<SensitivityAnalysisAbstract>	description of standardAnalysis

