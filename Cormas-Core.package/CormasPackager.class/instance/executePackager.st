packager facility
executePackager
	"execute the runtime packager. This is the final step.
	Hack 1 : the runtimePackager needs to be opened in order to work properly. We provide it the current builder.
	Hack 2 : the final steps are done by the special window controller class RuntimeStartUpController, we change the current controller on the fly.
	"
	
	runtimePackager interactWithUser: false.
	runtimePackager builder: self builder.	"runtimePackager traceMessages."
	self builder window controller: RuntimeStartupController value new.
	runtimePackager stripSystem