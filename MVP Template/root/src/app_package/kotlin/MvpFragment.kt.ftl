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
import javax.inject.Inject
import kotlinx.android.synthetic.main.${className?lower_case}.*

class ${className}Fragment : BaseFragment(), ${className}Contract.View {

  @Inject lateinit var presenter: ${className}Presenter

  private var progress: ProgressDialog? = null

  override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?,
      savedInstanceState: Bundle?): View? {
    init()
    return inflater!!.inflate(R.layout.fragment_${className?lower_case}, container, false)
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
    if (isAdded) progress?.show()
  }

  override fun hideProgress() {
    if (isAdded) progress?.dismiss()
  }

  override fun showMessage(message: String) {
    Snackbar.make(root_viewgroup, message, Snackbar.LENGTH_LONG).show()
  }
}

