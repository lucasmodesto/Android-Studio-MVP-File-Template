package ${packageName}.ui.${className?lower_case}

import javax.inject.Inject
import ${packageName}.ui.core.Presenter

class ${className}Presenter @Inject constructor() : Presenter<${className}Contract.View>(), ${className}Contract.Presenter {

}

