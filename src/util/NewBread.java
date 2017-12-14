package util;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.*;
import entity.Bread;
import imageutil.ImageEntity;
import imageutil.ImageUtil;

@SuppressWarnings("serial")
public class NewBread extends HttpServlet {
	Logger logger = Logger.getLogger(NewBread.class.getName());
    public static class TemporalImage {
        byte [] bytes;
        String name;
        public TemporalImage(byte[] bytes, String name) {
            super();
            this.bytes = bytes;
            this.name = name;
        }
    }
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		Map<String, Object> map = readMultiform(req);
		/* 登録プロセスが通ったかを保存する */
		String result = "";
		/* 以下4行はそれぞれ商品名、説明文、短歌、カテゴリーを仮変数として保存しておく */
		String productname = (String)map.get("productname");
		String desc = (String)map.get("desc");
		String price = (String)map.get("price");
		int priceint = Integer.parseInt(price);
		String genre = (String)map.get("genre");
		int category = 0;
		if(genre.equals("惣菜パン")) {
			category = 0;
		}
		else if(genre.equals("菓子パン")) {
			category = 1;
		}
		else if(genre.equals("調理パン")) {
			category = 2;
		}
		else if(genre.equals("食パン")) {
			category = 3;
		}
		TemporalImage tempImages = null;
		for (String key: map.keySet()) {
			if (key.startsWith("upfile"))
				tempImages = (TemporalImage)map.get(key);
		}
		/* DBを持って来る */
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			/* 商品名は存在していないかを確認する */
			if(checkExists(productname)) {
				/* 存在していなければ、新しいBreadを生成し、Breadのentityにレコードを追加する */
				Bread bread = new Bread(productname, desc, category, priceint);
				pm.makePersistent(bread);
				if(tempImages != null) {
					logger.info("adding image");
					bread.setImage(new ImageEntity(tempImages.bytes, tempImages.name));
				}
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

		/* 結果をresultsbread.jspで使うから、resultをstylesとしてrequestに保存する */
		req.setAttribute("styles", result);
		/* stylesをresultsbread.jspにおくるために、以下の2行が必要 */
		RequestDispatcher view = req.getRequestDispatcher("/resultsbread");
		try {
			view.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}
	
	private Map<String, Object> readMultiform(HttpServletRequest req) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            ServletFileUpload upload = new ServletFileUpload();
            FileItemIterator iterator = upload.getItemIterator(req);
            while (iterator.hasNext()) {
                FileItemStream item = iterator.next();
                InputStream stream = item.openStream();
                if (item.isFormField()) {  /* フォームデータ */
                    logger.fine("Got a form field: " + item.getFieldName());
                    map.put(item.getFieldName(), 
                            new String(ImageUtil.readBytes(stream), 
                                       Charset.forName("UTF-8")));
                } else {                   /* ファイルアップロード */
                    logger.fine("Got an uploaded file: "
                              + item.getFieldName() + ", name = "
                              + item.getName());
                    byte [] bytes = ImageUtil.readBytes(stream);
                    if (bytes.length == 0)
                        continue;
                    map.put(item.getFieldName(), 
                                new TemporalImage(bytes, item.getName()));
                }
            }        
            return map;
        } catch (FileUploadException e) {
            throw new IOException(e);
        }
	}

	/**
	 * 商品名をすでに存在しているか確認する関数
	 * @param name パン屋が入力した商品名
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
