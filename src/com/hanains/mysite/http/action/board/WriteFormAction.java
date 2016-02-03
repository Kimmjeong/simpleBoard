package com.hanains.mysite.http.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hanains.http.HttpUtil;
import com.hanains.http.action.Action;
import com.hanains.mysite.vo.UserVo;

public class WriteFormAction implements Action {
	
	private String bname;
	
	public WriteFormAction() {}
	public WriteFormAction(String bname) {
		this.bname=bname;
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession();
		
		if(session.getAttribute("authUser") == null){ // 로그인 안했을 시
			HttpUtil.redirect(response, "/simpleBoard/user?a=loginform");
			return;
		}
		
		String groupNo=request.getParameter("groupNo");
		String orderNo=request.getParameter("orderNo");
		String depth=request.getParameter("depth");
		
		request.setAttribute("groupNo", groupNo); // 그룹번호
		request.setAttribute("orderNo", orderNo); // 그룹내순서
		request.setAttribute("depth", depth); // 글의 깊이
		
		request.setAttribute("bname", bname);
		
		HttpUtil.forwarding(request, response, "/WEB-INF/views/board/write.jsp");
	}

}
