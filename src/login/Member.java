package login;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

/**
 * Memberクラス
 * @author t15cs023
 *
 */

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Member {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	//Memberクラスの主キー
	private Long id;

	@Persistent 
	//ユーザー名
	private String username;
	
	@Persistent
	//名前
	private String first;
	
	@Persistent
	//苗字
	private String last;
	
	@Persistent
	//パスワード
	private String password;
	
	@Persistent
	//ログイン後にユーザー種類を区別するflag
	private int usertype;
	
	/**
	 * Memberクラスのコンストラクタ
	 * @param username 
	 * @param first
	 * @param last
	 * @param password
	 * @param usertype
	 */
	public Member(String username,String first, String last, String password, int usertype) {
		this.username = username;
		this.first = first;
		this.last = last;
		this.password = password;
		this.usertype = usertype;
	}
	
	/**
	 * 入力されたパスワードが合っているかを確認するための関数
	 * @param pass 入力されたパスワード
	 * @return 結果 true-成功 false-失敗
	 */
	public boolean authenticate(String pass) {
		return pass.equals(this.password);
	}
	
	/**
	 * 主キーのgetter
	 * @return
	 */
	public Long getId() {
		return id;
	}
	
	/**
	 * ユーザー名のgetter
	 * @return
	 */
	public String getUsername() {
		return username;
	}
	
	/**
	 * ユーザータイプのgetter
	 * @return
	 */
	public int getUsertype() {
		return usertype;
	}
	
	/**
	 * 名前のgetter
	 * @return
	 */
	public String getFirstname() {
		return first;
	}
	
	/**
	 * 苗字のgetter
	 * @return
	 */
	public String getLastname() {
		return last;
	}
	
	/**
	 * パスワード変更するために、いつかに必要になるかもしれないから
	 * パスワードのsetter
	 * @param pass
	 */
	public void setPassword(String pass) {
		this.password = pass;
	}
	
}