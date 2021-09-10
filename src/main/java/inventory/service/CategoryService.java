package inventory.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import inventory.dao.CategoryDAO;
import inventory.model.Category;

@Service
public class CategoryService {

	private static final Logger logger = Logger.getLogger(CategoryService.class);
	
	@Autowired
	private CategoryDAO<Category> categoryDAO;
	
	public void saveCategory(Category category) throws Exception{
		logger.info("Insert category: "+category.toString());
		category.setActiveFlag(1);
		category.setCreateDate(new Date());
		category.setUpdateDate(new Date());
		categoryDAO.save(category);
	}
	
	public void updateCategory(Category category) throws Exception{
		logger.info("Update category: "+category.toString());
		category.setUpdateDate(new Date());
		categoryDAO.update(category);
	}
	
	public void deleteCategory(Category category) throws Exception{
		category.setActiveFlag(0);
		category.setUpdateDate(new Date());
		logger.info("Delete category: "+category.toString());
		categoryDAO.update(category);
	}
	
	public List<Category> findCategory(String property, Object value){
		logger.info("=======================Find by category start========================== ");
		logger.info("Property: "+ property+"/tValue: "+value.toString());
		return categoryDAO.findByProperty(property, value);
	}
	
	public List<Category> getAllCategory(Category category){
		logger.info("Show all category");
		StringBuilder query = new StringBuilder();
		Map<String, Object> mapParams = new HashMap<String, Object>();
		if(category!= null) {
			if(category.getId() != null && category.getId() != 0) {
				query.append(" and model.id=:id ");
				mapParams.put("id", category.getId());
			}
			if(category.getCode() != null && !StringUtils.isEmpty(category.getCode())) {
				query.append(" and model.code=:code ");
				mapParams.put("code", category.getCode());
			}
			if(category.getName() != null && !StringUtils.isEmpty(category.getName())) {
				query.append(" and model.name=:name ");
				mapParams.put("name", category.getName());
			}
		}
		return categoryDAO.findAll(query.toString(), mapParams);
	}
	
	public Category findByIdCategory(int id) {
		logger.info("Find by ID: "+ id);
		return categoryDAO.findById(Category.class, id);
	}
}
