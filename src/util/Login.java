package util;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.*;
import javax.servlet.http.*;

import entity.Cart;
import entity.Member;

/**
 * login servlet
 * @author t15cs023
 *
 */

@SuppressWarnings("serial")
public class Login  extends HttpServlet{
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	//ユーザー名をrequestから取ってくる
    	String uname =  req.getParameter("uname");
    	//パスワードをrequestから取ってくる
    	String pass = req.getParameter("pass");
    	//エラーコードを保存するString型変数を用意する
    	String msg = "";
    	//ユーザーを認証し、flagに保存する
    	boolean flag = auth(uname,pass);
    	if(flag) {
    		//今のsessionを取ってくる
    		HttpSession session = req.getSession();
    		
    		/* ここから */
    		PersistenceManager pm = PMF.get().getPersistenceManager();
    		Query query = pm.newQuery(Member.class);
    		query.setFilter("username == findName");
    		query.declareParameters("String findName");
    		List<Member> m = (List<Member>) query.execute(uname);
    		Long uid = m.get(0).getId();
    		Member mem = pm.getObjectById(Member.class, uid);
    		/* ここまで */
    		/* ログインしようとしているユーザーオブジェクトをDBから取ってくる */
    		
    		/* ログインする度にまだチェックアウトされていないかを確認する
    		 * チェックアウトされていないカートがなければ、新しく生成する
    		 */ 
    		if(mem.getUsertype() == 1) {
	    		query = pm.newQuery(Cart.class);
	    		query.setFilter("uid == findUID");
	    		query.declareParameters("Long findUID");
	    		List<Cart> carts = (List<Cart>)query.execute(uid);
	    		for(int i = 0; i < carts.size(); i++) {
	    			Cart c = carts.get(i);
	    			if(c.getCheckedOut())
	    				carts.remove(i);
	    		}
	    		if(carts.size() == 0) {
	    			Cart c = new Cart(uid);
	    			pm.makePersistent(c);
	    		}
    		}
    		pm.close();
    		//sessionの中身に変数的なものを生成し、それにユーザー名と名前を保存する(後で必要なので)
    		session.setAttribute("first", mem.getFirstname());
    		session.setAttribute("username", uname);
    		session.setAttribute("usertype", mem.getUsertype());
    		/*
    		 * ページの遷移先を決める
    		 */
    		switch(mem.getUsertype()) {
    		case 0:
    			resp.sendRedirect("/adminPage");
    			break;
    		case 1:
    			resp.sendRedirect("/mainPage");
    			break;
    		case 2:
    			resp.sendRedirect("/breadPage");
    			break;
    		default:
    			resp.sendRedirect("/mainPage");
    		}
    	}
    	else {
    		//認証失敗したため、エラーメッセージを先程生成したmsgに保存し、msgとする
    		msg = "Username or password is incorrect. Please try again.";
            req.setAttribute("msg", msg);
            //もう一度ログインしてもらうためにログインページにリダイレクトする
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
    	}
    }

    /**
     * ユーザーを認証するための関数
     * @param uname 入力されたユーザー名
     * @param pass 入力されたパスワード
     * @return 認証成功すればtrue、でないとfalse
     */
	private boolean auth(String uname, String pass) {
		/* 最初にユーザーが存在するかを確認する */
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery(Member.class);
		query.setFilter("username == findName");
		query.declareParameters("String findName");
		List<Member> m = (List<Member>) query.execute(uname);
		/* そんざいしない場合の処理 */
		if(m.size() == 0) {
			pm.close();
			return false;
		}
		/* ユーザーが存在すれば、ユーザー名がユニークなため、m.get(0)で実行できる */
		Long uid = m.get(0).getId();
		Member mem = pm.getObjectById(Member.class, uid);
		pm.close();
		/* ここでMemberクラスのauthenticate関数でパスワードが正しいかを確認する */
		return mem.authenticate(pass);
	}
}
