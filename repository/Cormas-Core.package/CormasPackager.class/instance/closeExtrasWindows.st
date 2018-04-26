actions
closeExtrasWindows
	"close all undesired windows"
	
	| controllers |
	WindowManager allInstancesDo: [:each | each purgeDeadWindows].
	controllers := ScheduledControllers scheduledControllers
		reject: [:controller | self shouldLeaveOpened: controller].
	controllers do: [:each | each closeAndUnschedule]