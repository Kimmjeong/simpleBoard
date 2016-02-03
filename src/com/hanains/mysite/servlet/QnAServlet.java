package com.hanains.mysite.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanains.http.action.Action;
import com.hanains.http.action.ActionFactory;
import com.hanains.mysite.http.action.board.BoardActionFactory;

@WebServlet("/QnA")
public class QnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QnAServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionFactory actionfactory=new BoardActionFactory("QnA");
		
		String actionName=request.getParameter("a");
		Action action=actionfactory.getAction(actionName);
		
		action.execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
