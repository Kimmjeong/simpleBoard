package com.hanains.mysite.http.action.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hanains.http.HttpUtil;
import com.hanains.http.action.Action;
import com.hanains.mysite.dao.BoardDao;
import com.hanains.mysite.vo.BoardVo;
import com.hanains.mysite.vo.UserVo;

public class WriteAction implements Action {
	
	private String bname;
	
	public WriteAction() {}
	public WriteAction(String bname) {
		this.bname=bname;
	}
	

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		HttpSession session=request.getSession();
		UserVo authUser=(UserVo) session.getAttribute("authUser");
		Long memberNo=authUser.getNo();
		
		BoardDao dao=new BoardDao();
		
		Long groupNo=0L;
		Long orderNo=0L;
		Long depth=0L;
		
		// 새글
		if (request.getParameter("groupNo").equals("") && request.getParameter("orderNo").equals("") && request.getParameter("depth").equals("")) {
			groupNo = dao.getGroupNo()+1;
			orderNo = 1L;
			depth = 0L;
			
		} else { // 답글
			
			Long parentOrderNo = Long.parseLong(request.getParameter("orderNo"));
			Long parentDepth = Long.parseLong(request.getParameter("depth"));
			
			groupNo = Long.parseLong(request.getParameter("groupNo"));
			orderNo = parentOrderNo + 1;
			depth = parentDepth + 1;
			
			dao.updateOrderNo(orderNo);
		}
		
		BoardVo vo=new BoardVo();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setMemberNo(memberNo);
		vo.setGroupNo(groupNo);
		vo.setOrderNo(orderNo);
		vo.setDepth(depth);
		
		System.out.println(dao.getBoardCode(bname));
		vo.setBcode(dao.getBoardCode(bname));
		
		dao.insert(vo);
		
		request.setAttribute("bname", bname);
		HttpUtil.redirect(response, "/simpleBoard/"+bname+"?a=list");
	}

}
