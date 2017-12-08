package login;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

/**
 * 新規登録のためのservlet
 * @author t15cs023
 *
 */

@SuppressWarnings("serial")
public class NewMember extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		/* 登録プロセスが通ったかを保存する */
		String result = "hi";
		/* 以下4行はそれぞれユーザー名、名前、苗字、パスワードを仮変数として保存しておく */
		String name = req.getParameter("username");
		String first = req.getParameter("first");
		String last = req.getParameter("last");
		String pass = req.getParameter("password");

		/* DBを持って来る */
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			/* ユーザー名はもう存在していないかを確認する */
			if(checkExists(name)) {
				/* 存在していなければ、新しいMemberを生成し、Memberのentityにレコードを追加する */
				Member membr = new Member(name, first, last, pass, 1);
				pm.makePersistent(membr);
				/* 登録を成功したことをresultに書き込む */
				result = "登録が成功しました!";
			}
			else {
				/* 登録を失敗した原因をresultに書き込む */
				result = "ほかのユーザー名でもう一度試してください.";
			}
		} finally {
			pm.close();
		}

		/* 結果をresults.jspで使うから、resultをstylesとしてrequestに保存する */
		req.setAttribute("styles", result);
		/* stylesをresults.jspにおくるために、以下の2行が必要 */
		RequestDispatcher view = req.getRequestDispatcher("/results");
		try {
			view.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * ユーザー名をすでに存在しているか確認する関数
	 * @param name ユーザーが入力したユーザー名
	 * @return 結果 存在する-false 存在しない-true 
	 */
	private boolean checkExists(String name) {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery(Member.class);
		query.setFilter("username == findName");
		query.declareParameters("String findName");
		List<Member> m = (List<Member>) query.execute(name);
		if(m.size() == 0) {
			pm.close();
			return true;
		}
		pm.close();
		return false;
	}
}
