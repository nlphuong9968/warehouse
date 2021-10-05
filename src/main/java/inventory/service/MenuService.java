package inventory.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import inventory.dao.MenuDAO;
import inventory.model.Menu;
import inventory.model.Paging;

@Service
public class MenuService {

	@Autowired
	MenuDAO<Menu> menuDAO;
	
	private static final Logger log = Logger.getLogger(MenuService.class);
	
	public List<Menu> getLisMenu(Paging paging, Menu menu){
		log.info("Show all menu");
		StringBuilder queryStr = new StringBuilder();
		Map<String, Object> mapParams = new HashMap<String, Object>();
		if(menu!=null) {
			if(!StringUtils.isEmpty(menu.getUrl())) {
				queryStr.append(" and model.url like :url ");
				mapParams.put("url", "%"+menu.getUrl()+"%");
			}
		}
		return menuDAO.findAll(queryStr.toString(), mapParams, paging);
	}
}
