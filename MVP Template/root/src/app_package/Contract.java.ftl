package ${packageName}.ui.${className?lower_case};

import ${packageName}.ui.core.BasePresenter;
import ${packageName}.ui.core.BaseView;
import ${packageName}.ui.core.MvpPresenter;
 
public interface ${className}Contract{
	
	interface View extends BaseView {
 
	}
 
	abstract class Presenter extends MvpPresenter<View> {

  	}
}
