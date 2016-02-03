package com.hanains.mysite.http.action.board;

import com.hanains.http.action.Action;
import com.hanains.http.action.ActionFactory;

public class BoardActionFactory extends ActionFactory {

	private String bname;
	
	public BoardActionFactory() {}
	public BoardActionFactory(String bname) {
		this.bname=bname;
	}
	
	@Override
	public Action getAction(String actionName) {

		Action action=null;
		
		if("writeform".equals(actionName)){
			action=new WriteFormAction(bname);
		} else if("write".equals(actionName)){
			action=new WriteAction(bname);
		} else if("view".equals(actionName)){
			action=new ViewAction(bname);
		} else if("delete".equals(actionName)){
			action=new DeleteAction(bname);
		} else if("modifyform".equals(actionName)){
			action=new ModifyFormAction(bname);
		} else if("modify".equals(actionName)){
			action=new ModifyAction(bname);
		} else {
			action=new ListAction(bname);
		}
		
		return action;
	}

}
