package ${packageName}.ui.${className?lower_case}

import ${packageName}.ui.core.BasePresenter
import ${packageName}.ui.core.BaseView

interface ${className}Contract {

  interface View : BaseView  {

  }

  interface Presenter : BasePresenter<View> {

  }
}

