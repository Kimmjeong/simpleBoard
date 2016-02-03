package com.hanains.mysite.http.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanains.http.HttpUtil;
import com.hanains.http.action.Action;
import com.hanains.mysite.dao.BoardDao;
import com.hanains.mysite.vo.BoardVo;

public class ModifyAction implements Action {
	
	private String bname;
	
	public ModifyAction() {}
	public ModifyAction(String bname) {
		this.bname=bname;
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Long no=Long.parseLong(request.getParameter("no"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		BoardVo vo=new BoardVo();
		vo.setNo(no);
		vo.setTitle(title);
		vo.setContent(content);
		
		BoardDao dao=new BoardDao();
		dao.update(vo);
		
		request.setAttribute("bname", bname);
		HttpUtil.redirect(response, "/simpleBoard/"+bname+"?a=view?no="+no);
	}

}
