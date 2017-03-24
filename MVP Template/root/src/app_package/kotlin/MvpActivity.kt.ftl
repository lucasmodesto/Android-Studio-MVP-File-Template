package ${packageName}.ui.${className?lower_case}

import android.app.ProgressDialog
import android.os.Bundle
import android.widget.Toast
import ${packageName}.R
import android.support.design.widget.Snackbar
import ${packageName}.ui.core.BaseActivity
import javax.inject.Inject
import kotlinx.android.synthetic.main.${className?lower_case}.*

class ${className}Activity : BaseActivity(), ${className}Contract.View {

  @Inject lateinit var presenter: ${className}Presenter

  private var progress: ProgressDialog? = null

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    setContentView(R.layout.activity_${className?lower_case})
    init()
  }

  private fun init() {
    progress = getDefaultProgress
    uiComponent.inject(this)
    presenter.attach(this)
 }

  override fun onDestroy() {
    presenter.detach()
    super.onDestroy()
  }

  override fun showProgress() {
    progress?.show()
  }

  override fun hideProgress() {
    progress?.dismiss()
  }

  override fun showMessage(message: String) {
    Snackbar.make(root_viewgroup, message, Snackbar.LENGTH_SHORT).show()
  }
}
