package util;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Bread;

@SuppressWarnings("serial")
public class NewBread extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		/* 登録プロセスが通ったかを保存する */
		String result = "";
		/* 以下4行はそれぞれユーザー名、名前、苗字、パスワードを仮変数として保存しておく */
		String productname = req.getParameter("productname");
		String desc = req.getParameter("desc");
		int price = Integer.parseInt(req.getParameter("price"));
		int category = 0;
		if(req.getParameter("genre").equals("惣菜パン")) {
			category = 0;
		}
		else if(req.getParameter("genre").equals("菓子パン")) {
			category = 1;
		}
		else if(req.getParameter("genre").equals("調理パン")) {
			category = 2;
		}
		else if(req.getParameter("genre").equals("食パン")) {
			category = 3;
		}
		/* DBを持って来る */
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			/* ユーザー名はもう存在していないかを確認する */
			if(checkExists(productname)) {
				/* 存在していなければ、新しいMemberを生成し、Memberのentityにレコードを追加する */
				Bread bread = new Bread(productname, desc, category, price);
				pm.makePersistent(bread);
				/* 登録を成功したことをresultに書き込む */
				result = "登録が成功しました!";
			}
			else {
				/* 登録を失敗した原因をresultに書き込む */
				result = "ほかの商品名でもう一度試してください.";
			}
		} finally {
			pm.close();
		}

		/* 結果をresults.jspで使うから、resultをstylesとしてrequestに保存する */
		req.setAttribute("styles", result);
		/* stylesをresults.jspにおくるために、以下の2行が必要 */
		RequestDispatcher view = req.getRequestDispatcher("/resultsbread");
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
		Query query = pm.newQuery(Bread.class);
		query.setFilter("productname == findName");
		query.declareParameters("String findName");
		List<Bread> b = (List<Bread>) query.execute(name);
		if(b.size() == 0) {
			pm.close();
			return true;
		}
		pm.close();
		return false;
	}
}
