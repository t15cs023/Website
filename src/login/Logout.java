package login;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;
/**
 * Logout servlet 
 * @author t15cs023
 *
 */

@SuppressWarnings("serial")
public class Logout  extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	/* 今のセッションを取ってくる */
    	HttpSession session = req.getSession();
    	/* ログアウトのための操作をする */
    	session.removeAttribute("username");
    	session.invalidate();
    	/* それが終わればログインページにリダイレクトする */
    	resp.sendRedirect("/");
    }
}
