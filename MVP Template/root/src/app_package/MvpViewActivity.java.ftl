package ${packageName}.ui.${className?lower_case};
 
import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.annotation.NonNull;
import android.widget.Toast;
import android.view.View;
import ${packageName}.ui.core.BaseActivity;
import android.support.design.widget.Snackbar;
import ${packageName}.R;
import butterknife.ButterKnife;
import butterknife.BindView;
import javax.inject.Inject;

public class ${className}Activity extends BaseActivity implements ${className}Contract.View {

    @Inject ${className}Presenter presenter;

    @BindView(R.id.root_viewgroup) View rootView;

    @Override protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
	setContentView(R.layout.activity_${className?lower_case});
	init();
    }

    private void init() {
        getUiComponent().inject(this);
	    ButterKnife.bind(this);
        presenter.attach(this);
    }

    @Override protected void onDestroy() {
        presenter.detach();
        super.onDestroy();
    }

    @Override public void showProgress() {
        if (progress != null && !progress.isShowing()) progress.show();
    }

    @Override public void hideProgress() {
        if (progress != null && progress.isShowing()) progress.dismiss();
    }

    @Override public void showMessage(@NonNull String message) {
        Snackbar.make(rootView, message, Snackbar.LENGTH_LONG).show();
    }
}
