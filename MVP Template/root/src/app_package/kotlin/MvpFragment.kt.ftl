package ${packageName}.ui.${className?lower_case}

import android.app.ProgressDialog
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.support.design.widget.Snackbar
import android.view.ViewGroup
import android.widget.Toast
import ${packageName}.R
import ${packageName}.ui.core.BaseFragment
<#if di == "dagger">
import javax.inject.Inject
</#if>
<#if di == "kodein">
import com.github.salomonbrys.kodein.instance
</#if>
import kotlinx.android.synthetic.main.fragment_${className?lower_case}.*

class ${className}Fragment : BaseFragment(), ${className}Contract.View {

  <#if di == "dagger">  
  @Inject lateinit var presenter: ${className}Presenter
  </#if>
  <#if di =="kodein">
  val presenter: ${className}Presenter by injector.instance()
  </#if>

  override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?,
      savedInstanceState: Bundle?): View? {
    return inflater!!.inflate(R.layout.fragment_${className?lower_case}, container, false)
  }

   override fun onViewCreated(view: View?, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        init()
    }

    private fun init() {
     <#if di == "dagger">
     uiComponent.inject(this)
     </#if>
     presenter.attach(this)
  }

  override fun onDestroy() {
    presenter.detach()
    super.onDestroy()
  }

  override fun showMessage(message: Any) {
        when (message) {
            is String -> Snackbar.make(root_viewgroup, message, Snackbar.LENGTH_LONG).show()
            is Int -> Snackbar.make(root_viewgroup, getString(message), Snackbar.LENGTH_LONG).show()
        }
    }
}


