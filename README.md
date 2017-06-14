# Android-Studio-MVP-Template
File template to generate View (Activity / Fragment) , Contract (View and Presenter Interface) and Presenter classes.

* This template was designed to be used together with [Dagger2-MVP-File-Template](https://github.com/lucasmodesto/Android-Studio-Dagger-2-File-Template)

# Template Files
- View
  - Activity
  
```
  public class SampleActivity extends BaseActivity implements SampleContract.View {

    @Inject SamplePresenter presenter;

    @BindView(R.id.root_viewgroup) View rootView;

    @Override protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sample);
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

```

- Contract

```
public interface SampleContract {

    interface View extends BaseView {

    }

    interface Presenter extends BasePresenter<View> {

    }
}
```

- Presenter

```
public class SamplePresenter extends Presenter<SampleContract.View> implements SampleContract.Presenter {

    @Inject public SamplePresenter() {
    }
}

```
# Usage 
You need to copy "Project Template" folder into the following path:

```
/ANDROID_STUDIO_HOME/plugins/android/lib/templates/other/
```

Then it's necessary to restart Android Studio. After that, right-click on app folder and go to:
new -> other -> MVP Template

Optionally you can generate the classes in Kotlin language by selecting "Generate files in Kotlin".

