package ${packageName}.ui.${className?lower_case}

import ${packageName}.ui.core.BasePresenter
import ${packageName}.ui.core.BaseView
import ${packageName}.ui.core.MvpPresenter

interface ${className}Contract {

  interface View : BaseView  {

  }

  abstract class Presenter : MvpPresenter<View>() {

    }
}

