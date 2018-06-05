deprecated
refreshHack
	"hard method rebuilding all datasets at each refresh."

	probeNum := 1.
	cormasModel class allEntityClasses
		do: [ :c | c activeProbes do: [ :p | self updateProbe: p ofClass: c name ] ].
	cormasModel class activeProbes
		do: [ :p | self updateProbe: p ofClass: cormasModel class name ].


	"axisConfigurationX numberOfLabels: (axisConfigurationX  numberOfLabels +1) ."

	axisConfigurationX maxValue: axisConfigurationX maxValue + 1