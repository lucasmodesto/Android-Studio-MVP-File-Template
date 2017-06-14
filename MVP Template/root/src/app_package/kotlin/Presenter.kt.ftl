package ${packageName}.ui.${className?lower_case}

<#if di == "dagger">
import javax.inject.Inject
</#if>

class ${className}Presenter <#if di == "dagger">@Inject</#if> constructor() : ${className}Contract.Presenter() {

}

