package inventory.service;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inventory.dao.CategoryDAO;
import inventory.model.Category;

@Service
public class CategoryService {

	private static final Logger logger = Logger.getLogger(CategoryService.class);
	
	@Autowired
	private CategoryDAO<Category> categoryDAO;
	
	public void saveCategory(Category category) {
		logger.info("Insert category: "+category.toString());
		category.setActiveFlag(1);
		category.setCreateDate(new Date());
		category.setUpdateDate(new Date());
		categoryDAO.save(category);
	}
	
	public void updateCategory(Category category) {
		logger.info("Update category: "+category.toString());
		category.setUpdateDate(new Date());
		categoryDAO.update(category);
	}
	
	public void deleteCategory(Category category) {
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
	
	public List<Category> getAllCategory(){
		logger.info("Show all category");
		return categoryDAO.findAll();
	}
	
	public Category findByIdCategory(int id) {
		logger.info("Find by ID: "+ id);
		return categoryDAO.findById(Category.class, id);
	}
}
