package ${packageName}.ui.${className?lower_case};

import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.support.design.widget.Snackbar;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import ${packageName}.R;
import ${packageName}.ui.core.BaseFragment;
import butterknife.ButterKnife;
import butterknife.BindView;
import javax.inject.Inject;

public class ${className}Fragment extends BaseFragment implements ${className}Contract.View {

    @Inject ${className}Presenter presenter;

    @BindView(R.id.root_viewgroup) View rootView;

    @Nullable @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container,
        @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_${className?lower_case}, container, false);
     	init(view);
        return view;
    }

    private void init(View view) {
 	ButterKnife.bind(this, view);
        getUiComponent().inject(this);
        presenter.attach(this);
    }

    @Override public void onDestroy() {
        presenter.detach();
        super.onDestroy();
    }

    @Override public void showProgress() {
        if (isAdded() && progress != null && !progress.isShowing()) progress.show();
    }

    @Override public void hideProgress() {
        if (isAdded() && progress != null && progress.isShowing()) progress.dismiss();
    }

    @Override public void showMessage(String message) {
        if (isAdded()) Snackbar.make(rootView, message, Snackbar.LENGTH_LONG).show();
    }
}
