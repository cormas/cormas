+ utilities - mathematics
sin: x min: min max: max phase: phase period: period
	"return the sinus function of x, according to min value, max value, phase and period.
example: Environment updateTemperature: time 
	temperatureMin= -10 	temperatureMax = 20	period = 24
 	self temperature: self temperatureMin + Cormas sin: time min: -10 max: 20 phase: 0 period: 24"
	
	| delta omega |
	delta := max - min.
	omega := 2 * Float pi / period.
	^delta / 2 + (delta / 2 * (omega * (x + phase)) sin)