package ${packageName}.ui.${className?lower_case}

import android.app.ProgressDialog
import android.os.Bundle
import android.widget.Toast
import ${packageName}.R
import android.support.design.widget.Snackbar
import ${packageName}.ui.core.BaseActivity
<#if di == "dagger">
import javax.inject.Inject
</#if>
<#if di == "kodein">
import com.github.salomonbrys.kodein.instance
</#if>
import kotlinx.android.synthetic.main.activity_${className?lower_case}.*

class ${className}Activity : BaseActivity(), ${className}Contract.View {

  <#if di == "dagger">
  @Inject lateinit var presenter: ${className}Presenter
  </#if>
  <#if di == "kodein">  
  val presenter: ${className}Presenter by injector.instance()
  </#if>  

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_${className?lower_case})
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
