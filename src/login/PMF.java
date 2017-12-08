package login;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

// �?ータストアを利用するためのヘルパクラス
// 永続化マネージャを管�?
public final class PMF {
    private static final PersistenceManagerFactory pmfInstance =
        JDOHelper.getPersistenceManagerFactory("transactions-optional");
    private PMF() {}
    public static PersistenceManagerFactory get() {
        return pmfInstance;
    }
}
