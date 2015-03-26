help
mainHelp
	"self new mainHelp"
	
	| text |
	"Classify Parameter Analysis allows to conduct OAT (One-Factor-At-A-Time) sensitivity analysis by modifying parameters' values. It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing a little its initial value  (+/- 5, 10, 15 or 20 %). 
It runs 2 sessions of analysis: one with standard specifications of the parameters, then one with the new values of the parameters. Then it calculates the Sensitivity of each parameter in order to sort them as a sensitivity gradient."
	text := 'Purpose for Classify Parameter Analysis: \ \' withCRs asText
		emphasizeAllWith: #bold.
	text := text
		,
			'Classify Parameter Analysis allows to conduct OAT (One-Factor-At-A-Time) sensitivity analysis by modifying parameters'' values. 
It means that the parameter sets are not crossed during analysis. 
Each studied parameter may be analysed by changing a little its initial value  (+/- 5, 10, 15 or 20 %). 
It runs 2 sessions of analysis: one with standard specifications of the parameters, then one with the new values of the parameters. 
Then it calculates the Sensitivity of each parameter in order to sort them as a sensitivity gradient.'
				asText.	"	 "
	text := text
		,
			'
Each parameter can be modified from its default value by selecting +/- and a delta (5, 10, 15 or 20 %). 
By clicking on ''Set'' button,' asText.
	text := text
		,
			('New value' asText emphasizeAllWith:
					#(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			' are automatically set. But they can be modified manually.

Before running the Analysis, check if the new values are corrects.

At the end of the process, the Classifier calculates the Sensitivity of the probes according 
to each parameter from the following formula:
'.
	text := text
		,
			('	Sensib (prob.j) = ln(average(prob_j.modif)) - ln (average(prob_j.standard)) / ln (j.modif) - ln(J.stand).'
				asText emphasizeAllWith: #(#bold #italic #color #-> #ColorValue #red)).
	text := text ,
			'.\For each parameter'' value, N simulations can be repeated and the calculus uses the average of the probe.'.
	text := text ,
			'\Several files are stored. The main output file is called globalSensitivityOf_XX.csv.\'.
	Dialog warn: text withCRs asText