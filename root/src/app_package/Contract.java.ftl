package ${packageName}.ui.${className?lower_case};

import ${packageName}.ui.core.BasePresenter;
import ${packageName}.ui.core.BaseView;
 
public interface ${className}Contract{
	
	interface View extends BaseView {
 
	}
 
	interface Presenter extends BasePresenter<View> {
 
	}
}
