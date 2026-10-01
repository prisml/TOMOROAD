package org.kosta.tomoroad.view;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.core.Ordered;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractCachingViewResolver;
import org.springframework.web.servlet.view.InternalResourceView;

/**
 * Spring 6부터 Tiles 연동이 제거되어, 기존 tiles-config.xml의 "*.tiles" 정의를
 * 레이아웃 JSP forward로 옮겼다. 레이아웃은 request의 "layout" 속성으로 조각 경로를 받는다.
 */
public class LayoutViewResolver extends AbstractCachingViewResolver implements Ordered {
	private static final String SUFFIX = ".tiles";
	private static final String VIEWS = "/WEB-INF/views/";
	private static final String TEMPLATES = VIEWS + "templates/";

	private int order = Ordered.LOWEST_PRECEDENCE;

	public void setOrder(int order) {
		this.order = order;
	}

	@Override
	public int getOrder() {
		return order;
	}

	@Override
	protected View loadView(String viewName, Locale locale) {
		if (!viewName.endsWith(SUFFIX)) {
			return null;
		}
		String[] path = viewName.substring(0, viewName.length() - SUFFIX.length()).split("/");
		Map<String, String> layout = new HashMap<String, String>();
		layout.put("header", TEMPLATES + "header.jsp");
		layout.put("footer", TEMPLATES + "footer.jsp");

		String template;
		if (path.length == 1) {
			// Tiles의 *.tiles 정의는 main을 항상 home.jsp로 고정했다
			template = "layout.jsp";
			layout.put("title", path[0]);
			layout.put("subtitle", path[0]);
			layout.put("main", VIEWS + "home.jsp");
		} else if (path.length == 2 && path[0].equals("mypage")) {
			template = "mypageLayout.jsp";
			layout.put("title", path[1]);
			layout.put("profile", TEMPLATES + "mypage_profile.jsp");
			layout.put("left", TEMPLATES + "mypage_left.jsp");
			layout.put("main", VIEWS + "mypage/" + path[1] + ".jsp");
		} else if (path.length == 2 && path[0].equals("memberpage")) {
			template = "memberLayout.jsp";
			layout.put("title", path[1]);
			layout.put("left", TEMPLATES + "member_left.jsp");
			layout.put("main", VIEWS + "member/" + path[1] + ".jsp");
		} else if (path.length == 2) {
			template = "layout.jsp";
			layout.put("title", path[1]);
			layout.put("subtitle", path[0]);
			layout.put("main", VIEWS + path[0] + "/" + path[1] + ".jsp");
		} else {
			return null;
		}

		InternalResourceView view = new InternalResourceView(TEMPLATES + template);
		view.addStaticAttribute("layout", layout);
		return (View) obtainApplicationContext().getAutowireCapableBeanFactory().initializeBean(view, viewName);
	}
}
