"
Provide icons for CORMAS project.

Updating this class:

IconFactory 	
	syncDirectory: 'c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\' 
	intoClass: CMIcons

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMIcons,
	#superclass : #Object,
	#classVars : [
		'icons'
	],
	#category : 'Cormas-UI-Core'
}

{ #category : #'accessing - icons' }
CMIcons class >> defineScenarioIcon [
	"Private - Generated method"
	^ self icons
		at: #defineScenarioIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self defineScenarioIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> defineScenarioIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\defineScenario.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAADZUlEQVRIie2XTW/cRBjH/894bI/tfU3YzaIoNNFWpQFxpaQUOPElKjgg8SW48DWQEBL3
XpAq9YA4VLxUiooEIkUpGylhQ1Ul7LJOst6XsR3PcNh2syjJ2gslUhH/kyWP5zf/55nn8QwN
h30AQrj499Xa22UXgJnU/7znm8dTR/z6+Wf+N3ctzyVixBiIni6SH8t+7eb7letvM5Z13em8
lQ8+PPzxe9ELXNviuYJhWjyf57bFvXzj5weqUM4OQ8Z4xu+8G4BFUiZhmMSRiqIkimT3UBPJ
fAGA1jojL90fAO/+ehfoEp+LQgCGaREQyFCt1B3HAUBEGXkp/pJeL/74o+qwzy0nJur2ByoK
434vCaOjXte48ooQIiNppBR/9Okn7MDPWXbNsh8NiGktI+kAkhnHceLU67ZtPzNe+NWX/MEP
yBVMzsuWNeRmmxgNezySx4yp5cvFYnEUz2fD41/cAggAATbnL5j2fr7QOjww/BY0saurswYT
KfnrtAFAawAGkS6Vgldfk9euR44TS+m9fHXWYCLT/hztPa0fX1mtLy8DOJybY1LmCgXXnfkv
lsrT0Jo8T85XzEuXarUaANu2wzB0PW9WWBrPzSGXh+sBGBRL5XJZCGFZlhBCKTVTW8nGgwae
5o9zLoRt20QkhNBaZ6/xSU1fIwFP8uf0e3958bdgqbwTWZ0/TN8/r08qpaJeD3H8j3ljAJHz
3dcqCE4jtdYqCKxsLXsaL8nlQXSCDAJ257Zu/KKHQz1SHCvfR6fDiWDbMM3xt4PBYGbeb2tv
Qesn9ed68DwYHFsNfe9b3F/Hxk/Y2aZuF0kCIkxkNEmSra2tM+ectj8v33yv3W7NHx3AOVXX
SQKlTqxrPX5WSjUajfNaXUr+dl5f88vzOJ2bibxOOpNSbmxsRFFUrVbPnHCaPynltbW1e0lS
a+6sBN2zB42cEQHY399vNptCiKWlpfNa3TTeKCZv3rixznm703kpOKqNrdBJaWqlfm+3H/t+
fzCoVqsLCwuO45wXT8p4f9jc3Ox0OrLfnwM8xizOtWnGjA209qU0TbNYLFYqlcXFxSmTtPZ2
s/JG2t7eDoJASpkkCQDDMIQQQohSqTRq5dPV2tvNdF4aq16vzzT+tP7r5/kLvz+sP9x7Y/XF
R82HFwCzbfdP0Jdp7VuU8wkAAAAASUVORK5CYII='
]

{ #category : #'accessing - icons' }
CMIcons class >> doesNotUnderstand: aMessage [
	" Redirect message to the answer an icon provided by the system "

	^ self iconNamed: aMessage selector
]

{ #category : #'accessing - icons' }
CMIcons class >> exec1StepIcon [
	"Private - Generated method"
	^ self icons
		at: #exec1StepIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self exec1StepIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> exec1StepIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\exec1Step.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAADeklEQVRIie3W32scVRQH8HPm7kxmdhIzc4fd2Uk29keo3aTapVRsRUTog6I+6B8gCL70
TUWwguBPSh8EQRGKKL4IvgoW+6Ai+m6xkqQ0atomJmazbbKdZHdndmZn7vFhtstSaybGTVHp
eRqGe+9nzvcMw+B3P84dnXAymQHY+apdW0LfbwKAqmZvg3e1siDdBqa37nh3vP+eF7ru+ePP
1c6dI6Id94QQ9coyglj8+PTsyTe8xcU+qrfwwjD0PQ8A9dBj85d/fvu1+U8+ihqNnfIAII7i
5EKF2GIQnv9h5sTzK1+dFXG8I163iJAhDDGWU7W1s2dmTrzkTk/9k3hT308BAIiYkSR7cMhE
Wvjwg1/eOeVXKttTUzxEJAIiAkQgyGpakXPNrc2++epvn30a+V4/PVkIIgQARAAAgk5DhjG8
Z3w8mpmefvmF6vffkhA3bSSi2PdFEPz5zMwmXluSFCREIAIgwoQFIIKMohScAo+tlS+/WP3m
6+Izz95VmkgWkBCzp97yLs1Jg/r4i68M7d3b3ZjSHwAQIREgIiB2B4YIQIIANE0fL03a3Fw4
/d7c++8GtZoQYunM5/785ckjD+66e/evJ19vuW7vpNO/Z4hARACEiEmi1LnfeWozlx/bV6pf
mHIvXgiCoH7lCjdM7/dF2liXVLW5utrrbZYnQKcrCQEIKBlmAiIAERAErdbKpbmG58GjT4pd
e4IgwPLhtamf2gprxkSaHul6GIaqqqZ7shCEyQIERESEnkEIilcry2vXqt7+yeBA2crnFU0D
ABwZCY495l6cEoLEE08RoizLW+qvLUly532hpBtIhom44V6vVqvhaNF7/GnNtp1cjnNumiYA
xHHcuu/g9eKYqqqFQsEwDMbYVvMEupEnACAAYijE8tJSqGXXHz6GI6OO4wwPDzuO091hWRZj
zLZtRVGy2aymab3npeSJGXaDgiiK3WbTj6KNg4fEPRPcNG3b7pW6ZRiGYRi3PDMtTyJEEELU
g6AR1P19+1sHyjrnSVB/degmldIfZFhL0EbYDm3HO3T/gF0Y5Tyfz3PO/66U7rUlqcmykabW
Dx+h4li3p5tG0h9PCLGuaI1yOS7dyznP5XK6rm8jwC15suOIB442irtV09z2qLbqybI8oOvZ
hx4ZlKRSqdQXZjOPMWZZlmVZ/ZWS+nf8f/5/vD8A6LR8GZzlmI8AAAAASUVORK5CYII='
]

{ #category : #'GT-InspectorExtensions' }
CMIcons class >> gtInspectorIconsIn: composite [
	<gtInspectorPresentationOrder: 0>
	<script: 'self inspect'>
	composite table
		title: 'Icons';
		display: [ (self class selectorsInCategory: 'accessing - icons') sorted
				collect: [ :each | each -> (self perform: each) ] ];
		column: 'Icon' evaluated: #value width: 50;
		column: 'Selector' evaluated: #key
]

{ #category : #accessing }
CMIcons class >> icons [
	^ icons ifNil: [ icons := Dictionary new ]
]

{ #category : #testing }
CMIcons class >> isMetacelloConfig [

	^ false
]

{ #category : #'accessing - icons' }
CMIcons class >> replay1StoredStepDisabledIcon [
	"Private - Generated method"
	^ self icons
		at: #replay1StoredStepDisabledIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self replay1StoredStepDisabledIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> replay1StoredStepDisabledIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\replay1StoredStepDisabled.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAACLUlEQVRIie3WQYujMBQH8MQafVgU46W2h1IvpUu/wH77/QYLc2thDxWWtlbcBlttNET3
EJDi2O224wzsMv/TIxh/vCQG8bfvP75+Geu6id4/v+Kf+HLJEEIA1gd4h12ofQBznU/vP/Wq
qqrrundP7xzlnEsphRC2bQ8Ggx697v4456pI0zTLsh4b7faklKqo65pzHkVRnue9qN2eEEII
0dQIIcZYFEWc8zeqN88LIaRVcM73+71S+/eaNI0qOM/z7XabJMlzjd73mv6alGUZx/F6vWaM
Pap2fw9/k6qqNpuNbduTyQQAMMZqPM/zMAwNwwiCQNPa/TzvqZxOp9VqRSn1fR8AOOcvLy/n
87mqKiHEfD5vkQ/sX1O0UhRFkiSMMYSQlLIoCjXOGCvLsrXgN73WMWnSzL9+UXMHcc7V2mqa
ptpt1vmO9/qYqJFmPsaYc348HqWUtm0DgIIBQNd1QojjOKbZ/k25v3+d6ymljOMYIaR2znEc
y7IQQgAwnU5d10UIua5rGMbDHiFESaooy5IxlmUZpdTzvNlsdv0wAACA53m33vbY+WSMMcYA
IAgCSiml9KHp3V5zWV8nTdMkSYQQvu+7ruu6rtqwHjwVtYYY46IowjC8XC6U0tFo5DjOcDh8
QrrjEUKKotjtdofDwXEc3/dbW9WnRwhRF4dpmuPxeLFYvF266WGMMcZJkvi+36P0J8+yrOVy
2a+k0nG/YIyfO3tPeu+aT+/f9n4DW40aAwDjCQQAAAAASUVORK5CYII='
]

{ #category : #'accessing - icons' }
CMIcons class >> replay1StoredStepIcon [
	"Private - Generated method"
	^ self icons
		at: #replay1StoredStepIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self replay1StoredStepIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> replay1StoredStepIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\replay1StoredStep.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAADP0lEQVRIie2X32/TVhTHz7Ed24mTOI4TJ07aEJoGURpUEBLbNPY4bQ/8XXvYJPayFyQ0
bRoIXoAX0IZAlD2U8bsgppGioYm2LC3tmqaN08Q/7uHBAaoq4KZhPPU8Xdvn3I++53yvroyT
D/7+dMwUBAn+/1hZmseNDQsAZDnyEXgva8+5j4DZHLu8Xd7gPObR9YuPGitNx3Y/LE/o+ba+
vPbXvdkn9+cqRwuffTWGiCGxd2a/0VufZbU4RJ5FZh4s/PjN1erD+Q8ltDfPdR0AQERkksBF
/vh15twPv8//szw4NcAvBCBwobCksrZ06ae7v529v1a3BqEG+ZOIABBRkuVkwlit2adPTN6Z
fOrY7s6oAS5ARCAfCoAYi6tRVX32aOnJndljxw+UxnP9+ii4nwCAgP4jIwgJgmGYqXRu6vLM
+ZNTi3MrfQkN0gfgK/TXHAIQAZCiRGLx0Zbz8sKp23vHUl8cPyi+FsoY+/nba3JE3n8kf/jz
0pYGBOkjIgJExNdaAREAiQiREtFcZaJi1fGX7yanp54Rkes5Z76/ERLCWSN/60q1Or31IAX5
BRERyHcNAOsyyf9CBDzPF4p7Kocqf96cu3v9aaNuWet21sx5HphZszo963pOHzy/f/786K3q
LszPWKgtPn74OJbmsyXFYR1i3vzzF8u1ldpCLZoMtdvtzRsGzI+IAMG3S3d+b5WD1Wy++HeO
472hCSFlyrwISDjxZbp6s15fW1ezUmE8LopiH7zu5Ih8z7DuuUDH7iwsLrVall7k9WFZ07Tx
AxW/ZL3ZYMc6HctTdUWNa4qi9Kev20/s6mOMLf+31FitJ/L83oqkpzVd14vFop/v2O5oqRyL
qq5ny2JU1ZQtG27jvEO3nwRgWdbaej2scSOfyKquGIZRGN6z2fH+emg4964NtzU/InJcp7XR
EEKUP8jFUlI2mx0tld8Ath/B+oio4zRtZ0MfEdIFKZlMpnQjkzF2AAvgEQAju9NuJ3J8oSzH
4lHTNPO5oUHu3ndWegwIW2EVh8tSIh3VNC2TycSi8QEv+t7FYliIxPnUCBdPi5lMpjy6D3bU
ve3yBF488rUJACndeI/ZdhC7/yu7vH7iFX9pU74N5rEHAAAAAElFTkSuQmCC'
]

{ #category : #'accessing - icons' }
CMIcons class >> replayAStoredSimIcon [
	"Private - Generated method"
	^ self icons
		at: #replayAStoredSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self replayAStoredSimIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> replayAStoredSimIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\replayAStoredSim.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAADkElEQVRIie2Xz28bRRTHv292x147WdZeJ0CapJWbpBWoErkgIXHnxIU/gP+REzd+SIgK
cqhUaKjUljqmLU5Daq2dtXd3fj0O219q4l8l5IB42sNod+Z93nf2zZsZyrIRgCCo49+3o15X
XADmdfufd77mz+xhjJ3hwvfOk/fj1/u3b3Y8QUwkBBFICEB4IDjrPv/y483t1fPktW+s3Pm5
66NeD5dkxQ+Cii/9oF71fPFHp3NykgIL8Gb/v8tXL7V3I4MsSzOtTJEr5xgMa9x4NA5jOT8M
8+gDUJjMCsXWk6oCwJOGKM/zcfT+wlVihj5j7N4391DUgsg6VnmRGWWtMaow6eiktVFZW19b
iDdD3/1fev3DLJDLcUs/s301oEJ5UvnWunE63txeDDab1/n12JNCSgmKineKYZGbPFNFhWGi
leq169cW5U2bz++/2gcDDIIIglqzGVdjJlmMs6HlPN6oLgo7m/dygR8/SRlctj3Pq9dq4aqI
2gWEzrP8sy8+fQvexPnc+/YeAKudX/EAgOGFxdbmFWbuhcnw0L0FbBrvWS8FwMymsAD8KsJW
ZXd3F8Ad/zezpc6ZV6SGyhYRAPZ0CQNw46MPMUddPdMm5ou1jgEiAjMAv/JmZAuV6VejJn1g
doDHzCAQQJbOGLw4cqI+ueRZxQAIxIxixIu6npdXRh2u+AC0tloZENjRrR8eGmNPP/+UV9p7
l2ug55qscgDSvtrfe3y6pzH2+M+T5K9RmuTZSOnClHF0Op00yd8UM4lXD2vRpUF6RAAYrLUF
MB6oW98dLDWCpWXp+cJZ51hIiaD+otYwg0gI8eDBfSnlciOYV1+z2Vzdqvo1R0QEKuuMVhbg
YqyGSZEmhSpsmb1GGaDsIgB0uwfj8bjZbJ52O5HXaDTiuNnacuy7Mkufz57mlzrKZAKIAa2s
1RZw3e5Bt/uo1VxpNBqn3U7bH9rttrXWucPRUwdXe/GajXYAfFnWOQKYQARorQ8e/54Mkq32
1c0rG2f6nLEfbW9vM/MT0VNDQyoEXi04o62seKVUY9Vx0j9OjqIonAKbzQOws7Pj+363+0jr
p1ZXHQXWVpmqLIRORw5ac3YySqrV2vr6WqvViuN4ijea877S7/cHg8FgMEiSoXPGWgtACOF5
MorCKIqkV2lGK6cT8nU76nXnOi8BiON4euBz2n/9/nDh95Wf7vY++WDt7u2bFwBrvbv+N6rE
zPN7BOzPAAAAAElFTkSuQmCC'
]

{ #category : #'accessing - icons' }
CMIcons class >> replayRunForwardIcon [
	"Private - Generated method"
	^ self icons
		at: #replayRunForwardIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self replayStoredSimIconContents base64Decoded readStream ]
]

{ #category : #'accessing - icons' }
CMIcons class >> replaySimBackwardDisabledIcon [
	"Private - Generated method"
	^ self icons
		at: #replaySimBackwardDisabledIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self replaySimBackwardDisabledIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> replaySimBackwardDisabledIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\replaySimBackwardDisabled.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAACsElEQVRIie2WwW7jIBBAAQeDban40kRtD00vvfX/f6FS/yCn9tTUVghOtck4CNjDrBzX
TuKk0karVec0xgxvZpgB6GbzazQS5FIyIoSMRtHFeOxipB/eD+/f54063957QgillFKKIyGE
EEJ75HQJIQCA915KGUXRF14IwRjz/PxMKZ1Op4+Pj4wx59zLy4v3Pk3Tp6cntDmRVNc1AOCn
tVYpRSnd5dN7v9lsMAgA2G63qIQQCCHOuUY/JaaqqtbrNY5wzp1zaLuLz1qLK1JKAcA5RwjZ
brfee0qptdZaOwhzzn1+fgIA57yd/8b2y/613ccZCGsScDysqqqaDB2Sbr30Z2PEx0nr9doY
Y62N4/g8Xn/1I/ZYFFpr3Oy2ILvRD/L2LroX6Zwry9IYwznv1y3nvK03hTrM2yuLxaIsS9QH
+7Id39nni/d+Pp8XRdHvjXZMh8a7vMHSwK2q67qu62awP/NQ83R5feO2B5RSzrkQIo7j5XKp
tW5POKVBz84nYyxJktvb24eHB8bY+/v7crlELzs10ujH6nOw/yilUso4jqWUV1dXRVFord/e
3sbjsVJq0N1v1idjTErJOU+SJM9zrXVRFKvVajwep2mKMQnx55l5rB8GT5O2RFEkpcSIlVJl
Wc5ms+vr65ubGyHE3qWG83kc305vlmVKqY+Pj9lsNplMJpNJf/6oY4xKp5MGryFMb7OpZVku
Fgut9d3dXZ7nB+slTdM8zwEgyzLMfhRFSZJUVZVlGWMDxcwYE0I0mzqfz19fX5VS0+l0F9Jm
80vKlBDivQeA1WqFt7mUUkoJAMYY51wURXmeSymPI5t84OVujDHGEELu7++VUoyxHQ+ReHxw
zhljlFK0xL9CiLOeMLgaAABA4+sX3t8Q730IAb0n3+6/06Wz6//7e/fSvN8RO59T9mboZQAA
AABJRU5ErkJggg=='
]

{ #category : #'accessing - icons' }
CMIcons class >> replaySimBackwardIcon [
	"Private - Generated method"
	^ self icons
		at: #replaySimBackwardIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self replaySimBackwardIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> replaySimBackwardIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\replaySimBackward.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAADyElEQVRIie1Xz28bVRCeZ6+dtbP2PhO7BOOkKUpQJVCBgBAHOAJ/Af8B/wUCISFx4V4B
h0rtkRNSoRJCIJVbpAY1ggtKCKhxGsetnRC72ey++dHDOuv1xj9SqTISYuTD2/Hs+943883z
WBmDMEVTIjJNvNQ0wf7He+pmJZ4RaVy0lT7nvol9LCuNSJaVnrY+k/yelsX5heTCRSr6OnSF
i6GP41OdMMtKRx8A+O76Ws8fjwCAa5//mLJS6OOHH78f+r/85HvbsQHgvQ9eXVy58EQsv7l6
+2HdV2LNXbSSeKGtXH5Rl9zdnb1ut6O1tqz0TC77xpuvA0Cnc3R+pPVftu78vG1bjpUWMkSI
w/GImFiY2fM8rTUAMAOiAIB5dHxOsKsf3dR6Ppct+L4feiJVJvEYiQwKcxQKAuHphCbUj4i/
/uzWM+78XLlKxACQzWRPPD8eM4QfGiLqN4mAoCEAGN96N6+vHTWpVr1kAjLGKFBKgW8CAACl
AEbxIyZiZk4cYhQeIv1xt772w2Zt4aIuITMLSHhKEMhmsiccCPV3S95nhISBGUidAAYGAxPH
CBedw0dffXrrwTYvXXoBAAAUACilTt8LGUjkGcIPmRCJYieSYZccIt344qeFxaVXVl9jFgJz
Ctd/TSk4e3Wd1QubAON4SiCsX2S3v/2t0+Irq6toEAMUkR4BARXxUhBKUsWKB2fzycTMzDyg
FyKiWIYvv/Xs7r1d4weqn70eIIuAAqWUisgqABmNZ5CCAIUHCAUBBgHGYvyX3i3c79zdWP81
PLuIqNPiiYCIhKoJQn3GbJg+kQZ+MwSoN1NlQkettgAAtt2YcVt//rVhGT3/XLUnSxko4uT+
Y2JCRhzQS7wdI8habWFra7NVaj1otjd/P6zMVe2ZnOpn8Xz9B4oxMBQXpAj2+GUTscvLK1rr
UqmkS83Ddn37DtQWl8b3XxLP92gma9FgvzMxjLByuTJrF1zXbTabVvb+cete++90qViBZP+N
vF/oxPOFB/Lp+8myxy3n2DlnfnZ2Vmu9v7+fn2s93NzHY3smk5vcf0ScAsVxwQjQaH6ROU7B
cQrFYlFr7TiNw4PO3kY3LcVE/yXxis8LoZ/JWJlMT42VpZx34qUgrSu5iaiuq11Xa60bjYar
D/5pdXfWJQ35kXgvv33B87x8Pm/bdui58k714OBAKVUszU7EC61crpTLlXp9p+22LXvPayEf
97TWm8/CYQ3OzDkTPeOt2+202+2joyPbtpeXV/rzYDQ/PdFQdH5UAHCcwr8wf/7X/z9MG+8x
GStQUmP6FUgAAAAASUVORK5CYII='
]

{ #category : #'accessing - icons' }
CMIcons class >> replayStepForwardIcon [
	"Private - Generated method"
	^ self icons
		at: #replayStepForwardIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self replay1StoredStepIconContents base64Decoded readStream ]
]

{ #category : #'accessing - icons' }
CMIcons class >> replayStoredSimDisabledIcon [
	"Private - Generated method"
	^ self icons
		at: #replayStoredSimDisabledIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self replayStoredSimDisabledIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> replayStoredSimDisabledIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\replayStoredSimDisabled.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAACeElEQVRIie2WTW+jMBCGxybEDlUCbYREe4p6af9A1f//D3ruoaLSNsGJRB2qojFe8B4s
eQnkc6vNYbfviY+xn3mHGYBo/RPOpXz1YzAYeGfjAQA9J+yb9837Cs8Y87d5A3eEiHVdU0o5
54SQc/B831dKKaU454yxk6hPT09lWVJKHx4ePM9rmub5+TlNU2PM4+Pj1dWVDftdT0R0gLIs
1+s1Ih5Z4c/Pz6ZpAMAY8/HxAQBVVSGivVsUxRZ/HSEiIjLGJpOJ5x1452mtq6oCgKZpLLiu
a8sjhNR17SJ39qfv+wCglBJCSCn3G7WMNlhrba8YY9zxPn/tICllWZZhGAZB8MVW2jkP1p9T
VVWr1Wo+n+9/qJ1VANDJj+6515dSKk1TIYTrhY7aVbHqJHfavNsAKWWaplmW9QP+3F87U7dL
OyDP88Vi4Tqlv2qrhwP9uUuIWFUVIcR24/E66n3dyVpKmee57/uMsU5aB+u5MQ9t7516aq2N
Me/v7+v1OgiC29vb2WyGiJRuZHywnjvnzzLcaVmWy+XS9/2bm5v7+3t7kXPeX7Vrwy28rfOg
lMqyTCkVx/F0Op1MJnu26/vbx+vIGJNlmRAiSZLr6+soijjnfU9tnebPiRAihBBCcM7v7u4u
Ly8558PhsPO0+jrNnxvnt7c3AEiSJI7ji4uLY0h2+XA4dKf2mBDSNr3B01q/vLwURRFFUZIk
4/GYc37wYwQA9q9AShmGoS04YywMw6IoOOdBEGzhMcbSNKWUzmazKIqiKDqIcbL5xXHseZ7l
EUKm0+loNKKUjsdjF0ncfCCilNJ2xJEFPFXLxSs5wz9Zm/df/e/+g7xfTKFX1x7LBeIAAAAA
SUVORK5CYII='
]

{ #category : #'accessing - icons' }
CMIcons class >> replayStoredSimIcon [
	"Private - Generated method"
	^ self icons
		at: #replayStoredSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self replayStoredSimIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> replayStoredSimIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\replayStoredSim.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAAEDklEQVRIie2Xy28bVRTGvzMPe1w/64kfiePETiMSSNK0yqJLUNmw4PEHoP4LLMqCBRJb
RCSWEUJCAlUsEC8hhFg0URFCVGVBhQJqEaJqRRMpJVES1Y4fM/fcw2Ic2+MmIWwiFjkr++re
+zvfd869M0O+r3CCQSJykjzjJGGnvFPefwyr++vDd5aV77945dLwuHsSPN9T7br51Qe3xqZy
z748l0jFjr/LnZ8frnx2O56KmSZdef150zIALL35jROPtPbar159LuMmg5k9P0XktcUXTMTX
79WuLd74aeWuUqwUH4f356/rT81MzszPNmrter0RrMrmszPzs7mC++CPv7sz++onsvTGdSKy
DeeMk1q9ufbR28v3724cB+l5PsS0rQgIjUYjGCTAtiJCRncEA/0igAAEEJnxWCbqpL/78rcv
3v/xX3laa9asfAVAKbWfv1a+EtGsexmHeASCiABEJBDHjg4NFb2G/d5b3y5/fru51w4c7iru
l65ZmHUoewGzFoHo3hU9cB6EiCCACIEEMIjSyUS5PP7oQfPa4sovN+93SUqxZZm9zVmz4tDd
r4UVSyiHg/wML4GADMPM5/Pj1XN3bq1//O6NtXubT+pjZuWp/vUiojwlOgS0+v9Qp3gBWwgw
CAIBQESRaLQyMVGv1a5/uuoWE5dfmUtmz3QTVYp9X/Un7Pvs+0qHn3eD94vIfgGJJDwOCBFS
6dT5+fNRI/HJ0g/ff73akSiAiA5LAaC1HrBsgEcgIgJEICBAC4xAb9BEAiKQgajjGIaxtVFr
Nbyut8rv2Nutq/JZ6xAv5GfgYaBP0DNCpAMD0Gy21n5/6OvW6Eyk8rQbXEMCaBbV92oS6Fa+
Ej6yfiIC2lcKGAGfAIA1P1rf2N3eyoyaxZJVHHGnpqa7GSlmzwu9ComI5w3WL8Tr1C2YCxFA
S3AosbuzvbW1mchR9VI0k00VCoVqtdq/UjMrn/s311qUz3Ikr9svPX2tZmP38bYdQ/mCHU2Y
5bHS9PQ0ngitMdAvIqK1Ppon1OkOEojPqraz46nW0DkjnY/k8u7s7FzfGQ8FK1YI+6lFeepo
HgX1E9HtdrPZamTKRrnqZN3MwsLCgZjO1gAzexI6fyLi+QrG4f0iEBAp7XneXixpTVyMnnWT
uVxufLxyBCwIrTTA6BMvItpjskPTBvpTWPZsG+VnrFjaLo+V0qlsLu8e5mE3Ehl786/HjDZY
DLNzXtvtFtCGL+ls79Hd4zGzgipOWmeHnVzedbP54ZFC7+SGbudeBOOTF9140VdKpVJJg0wA
lmUuvDRUr+8lEvF0zjmAd+HySJvrsbhTLBYrlcrAvodJDMYLhUIsFtNa25aTy7tBEqVSiZlN
0xwdLfcsPP1+OOX9j3n/AB/xMtWzEZ9LAAAAAElFTkSuQmCC'
]

{ #category : #'accessing - reset' }
CMIcons class >> resetIcons [
	<script>
	^ icons := nil
]

{ #category : #'accessing - icons' }
CMIcons class >> run1StepBackwardDisabledIcon [
	"Private - Generated method"
	^ self icons
		at: #run1StepBackwardDisabledIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self run1StepBackwardDisabledIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> run1StepBackwardDisabledIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\run1StepBackwardDisabled.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAACV0lEQVRIie2W346iMBjF2zLQD8gIaPDPJHM7yb7Bvv2+wWbuZ03cuFGEjC0XBAqx3Ysv
IUQdR0ecbDZzLogWw6/nnLZCf/z89f3b7O6Ok9trm/2hZVkQQgC8T+Cl69/sEzBdffG+eP8C
zxhzdPyud5LWWimltQYAy7JuyDPGlGWplKKU4ojnee1nVD95GmOqqkqSpCzLdrCu68NUr/Vn
jFFKCSGMMZTSuq455+hJa334+6t4u90uTVOlFCHEcZz2ekIf5wkhpJR79byri3nGmDzPhRBo
CwAIIbZtX8XTWq/Xa8bYbDbrkpRSSZJIKduSUE3TYJLY32U8rfXz83OWZbZt53n+9PTEGNvt
dsvlUkp5evoX94cmttstfpVS1nVNCFksFl1be7Wdn+eR/aeUcl0XH+o4TlVVhBAAcBwHOyMH
x1XTNB/nEUJ830crCCaEcM4ZY0VRFEVB3vZX1/XpFbufJ6UUACaTCS68OI4BgHMeRREA3N/f
Z1kmhHBdNwzDrr92/+HGP5eHVqIoCoKAUkopRaOYJwB4npfneZIkSZKEYYjTOl9HePh0bKg7
U8YYAIzH48FgEATBZrMRQlRV1aV+ZD+01KODlmV5nmdZFkb6+vq6Wq2Gw2Ecx7i+Lvb3rrrx
DgaDNE2FEC8vL9PpNI7j/nkojNe2bdd1gyAQQuDRM51Ou0upNx7KsiwAiKIIqVmWzefz0Wj0
+Ph4tJEe/t8xXs45APi+H4ahlHKz2Tw8PNyE16ViqWEY4vsLY/vnSc/vS1gq7vpDWP+8lvrm
rVvwTuh/5/0FtIoIuC7S8nYAAAAASUVORK5CYII='
]

{ #category : #'accessing - icons' }
CMIcons class >> run1StepBackwardIcon [
	"Private - Generated method"
	^ self icons
		at: #run1StepBackwardIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self run1StepBackwardIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> run1StepBackwardIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\run1StepBackward.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAADQUlEQVRIie2XT28TRxTA37N3tf//22S8ioQpUlQHisShqKd+DL5EP0kP/QK9VRVXhFq1
9EDbIEoroRZUgwnISbFbIzu7XttZO7G9O7vTw4YoCsYJVpID8I7zZvXb38y8t7P468ONzyol
jhPg9KPnt3A83gEAUZTPgOe1m7kzwByMD7wPvDcEpQmlyRnxppPotx9raZIeQnInTkpT9uRB
8/7tGjB0iPbJtQtH8LI34rj8ArDWpv/zzb8noxhjAfJ0d3d8aMJsvwVgYW937bvqyxdBHiQE
ARAZUBrHx+K9VUQRfXDnWfWPpiSqqmTTKI2TaZZiKTuad3w5SpN6tXXvh5rAy45NGGNxRBHn
PbK4X7sZrN2q7gypZSwJghBNaUIpABw2Oj7v4MGhNNn33gnHa98/+W8jKDrnrGWFxkmaJIDA
GADAXL038ChNOv/2f//pad8bXv/ic6uo7VP/ult/dG/TKRRXVlbSFGgUAwBki4iAiGyu4Ix6
pzTZDkY3v76vys4Scb/96pdBMASA+uOX33x5Z7Pa/fjSKimV8vkD28xYto6MsfmCs/2eV1uW
YyHjBIHTTb1R75yH9PaNPy9dvaxrWhwnNKZ7GEQAYIDw6py89XpSGgsK9IN+GufTNB2OQkHO
TaaTC1ec57WnxF1eIsX9yZhRXyki4PzzMrt/2iXZXVW2w+44Ci9+qkl6HnNsuaJ8dE0aTraq
jx5v93oAAIiMMUBEBEDcU5sLnOEniqIkSeVVU7WBE7FQsHVdt207S8m6P9ja9TfaftcvFgnP
83uGjAEAA7ZI/RFCeJ4vFIYAYBiGZVnZICHEMAxP92QrCFpR60VTUTRdsxARjtq5eTwAcBzH
cZzXx13XdV230WiYZtcq9b36qNUKDdMURYXB0fWwYH8pl8vlcnl9fV3V+n1v5G0Ou14oy1oO
+UXq4ZhRqVQ6nU5gBKrV7bfHW/UQEg4Zf1o8ACCEiKKoKIphDNRC4DemvUbM5QRgs5v+CXyP
TNM0TXMwGBiGoeu+7W57/0Rhh+Es5IndJzKqruue5qlGb+DvtGuxU1JPi5eF4ziSJFmWFZiB
ez4yCod/S07+viTLsizLhJCZ2Xfovvte8v4HgLdn1doyx+wAAAAASUVORK5CYII='
]

{ #category : #'accessing - icons' }
CMIcons class >> runAllSimIcon [
	"Private - Generated method"
	^ self icons
		at: #runAllSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self runAllSimIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> runAllSimIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\runAllSim.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAACUAAAAjCAIAAACcpVRJAAAACXBIWXMAAA7EAAAOxAGVKw4b
AAAECElEQVRIie2Xy28bVRTGz5mx49px7NhOMnYSUrsUGlpSkgYhhLrIDrFng4AFEis2bUFU
FWLBQ1SIPwAWoaoQaxYskCoBO4TEYxNoVAitFKpCIYmTOHE8nrn3no/F+DVOHBWJZoFyV/ad
O+fnc77vnBmzUpoOcDGAg+RZBwk75P2/eH65LMbcV16oH366eA6uKp2/kCwes2z7fvAinV/g
6Vhl7dYH7yWnZiaefzGWyd57oLVvv/l9/qNoZpBj8VPvvm9FIt7qyvU3Xo8OJFVla/bKp8Gx
UD0BioIyysfiwuKlV//4/DNR/j3y1n/8/ujUYydOn1Hra1YkQkTrN26k886J02cyY+OtYyGe
wIDIYiQgQ7a1+eW166+dL//w3f6iBlf9uk8EImJqCOS6tUZ8blN2+RMAmJls5lxfNBPlPz/5
+NfLb+/cvt2LGigNo6G1BWntG61JxIKQtG/s5jEzkQSfCBSL9o2mBxNbld8uv7V8dV5vb++T
KETDhKY/SGA0pG3Jbh6ImBkgAoiZALKsZKJ/YmyMby79fPHc3Wtf9EpUtBGlwlsiSgG98wvq
2civlTSRZdtDuVyxdLzy9VeLly5sLCx0UUEEY4xSoeeNwCjVmV+oHwIMM5iJgEaKRCAwQMx9
fX3FY6Xq9vadKx+ujE9MvPBSzHEokBAQpcSrE3UARcSrYx/9iAhgBGUN6hlsMlNzNCTT6cnp
2UHgl3feXL4635oMAETCSQc76K0fU7OWACiQMDBRI/nGKeZo7IhlW+5ff7uu24iutfgh/QAR
X5G0TdtdTwDMQMAIXNO8QI0ik1d3795ccrVxn5pLT8/E4/EOXng+CMT399WPuOGXIFlm4gaL
iMWYldU7G+Vy9eQpPTmVHR7OZlszD8Yo43td+Rnf69Svm8dM1PZLwzXMBObNjc3V8qo/frT2
zNnEyMgDjlMqlTpiE2kt7JNpZwMR8X2SttV35xe0RFMqZmKuufX1tVV/IF2Ze9rO50fz+XQ6
XSgU9rivQ6rWDqh3PdHhDiLSWpdrriuyPfMEHnwoNzjoOE4qlerv798NE626/Ekion2yoj15
ge2ZCZAtras7tdrkSe/R6cFcLpfLFYvF3eUQY4KWEG00NHH7wQlAez5i7Z09/EnMLmhLiRp1
ajOPxx2nMDyczWYzmcxuGDXnNRFBaYimWKIdzQh8j6Kx3jyLN+2ETiYqs09ahbFCD6n2oDoj
1VtLVTvS6jZ7aMTzfS96hDqaJMRjrbbsaHV2Vh5+JJvJ9JJqzxU5O7d2fFJrPTAw0PwFTv3l
V3Z2djojhHnPPlcFxZLJfD6/p1S9Vr1edxwnHo+LSKv9gwjGGLvjVSj0vrS8vExEqVSqo4v/
43X4f+WQ92/WP219ONyBCw7CAAAAAElFTkSuQmCC'
]

{ #category : #'accessing - icons' }
CMIcons class >> runSimIcon [
	"Private - Generated method"
	^ self icons
		at: #runSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self runAllSimIconContents base64Decoded readStream ]
]

{ #category : #'accessing - icons' }
CMIcons class >> runStepByStepSimIcon [
	"Private - Generated method"
	^ self icons
		at: #runStepByStepSimIcon
		ifAbsentPut: [ Form
				fromBinaryStream: self exec1StepIconContents base64Decoded readStream ]

]

{ #category : #'accessing - icons' }
CMIcons class >> smallCormasLogoIcon [
	"Private - Generated method"
	^ self icons
		at: #smallCormasLogoIcon
		ifAbsentPut: [ Form
				fromBinaryStream: (self smallCormasLogoIconContents base64Decoded readStream) ]
]

{ #category : #'private - contents' }
CMIcons class >> smallCormasLogoIconContents [
	"Private - Method generated with the content of the file File @ c:\MySmalltalkProjects\CORMAS\CORMAS_Pharo6_GitHub\icons\smallCormasLogo.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAACXBIWXMAAAsTAAALEwEAmpwY
AAACVElEQVQokW1SS08TYRS93/2mTKelA33wbEVag4ihqKAujJpoohs1JhqWLkzcGWNc6daV
8Se4k+hODFGDuIDozoQgwYokdQoUrYUW+p5SmOl81wVgi/Hs7sk5Oecmh8F+sBaFDfqg0UaG
xRJlEcmARfsE9QdePchuBIHXSPFomlbL9Rqppj7bwYZDqFdhbAV/lYXERMBBa5v/VOB7coYP
wswusacR80sK9arP7XIgrzp5NbcFdaV2E7CnCdyy7Xuhspjr7+y6fuSkLNnSvm3tXOWru5ye
iovJ30BUl9DbLJ9o8X3MhJKOJ8qVQ2uu9pT96IpqL4FwU+p8kxlspJkNIMK/z3cWsCXLHyoX
uQF386P3sqOiSl1RWXu7EEgSDPlwOAQAuwa0qK2IN1nYz9WXxuwPI71objyvTPtRPZxUY89m
bJuCXQ4wr30vYbnUYLJWQ9lm1lg5ssO9qXwzmTjjCFXWdDGRAM4g7EEAwAMuMkVuKZNTzVWr
aFjmjqFimWlLV7wKAFAsDwDMKUnYrbLHQ+xVPPp+IXLJ1+vsHsXbmsgAURA9Lsn+KZCCKFCb
AgC0vsWpZOCFTsnvMsaXY/FEoUMEmafH8nZw1XDB54HMlBFLJ7L8Th/JKF5oHAhYs0zHPVg0
t6PZaCo5Xpz/wDStfytxSswFS5GJeX4taA16YDJJs+sSAIh3K/x0K93qkfu8YrHAvLJtoD3W
wOdQz48smLkKBp0Y16uvl2rjY34n3g9Dm1LbQKwoRqL0UwcAkDmTkMrm/rXaEI95od0BgkAr
CK0A/8MfsroIJBuY++QAAAAASUVORK5CYII='
]
