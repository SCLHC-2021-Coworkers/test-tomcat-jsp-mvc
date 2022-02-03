package util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppInitListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		DbUtil.getInstance().closeConn();
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//
	}

}
