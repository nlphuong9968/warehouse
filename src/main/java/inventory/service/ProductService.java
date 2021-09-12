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
import inventory.dao.ProductInfoDAO;
import inventory.model.Category;
import inventory.model.Paging;
import inventory.model.ProductInfo;

@Service
public class ProductService {

	private static final Logger logger = Logger.getLogger(ProductService.class);
	
	@Autowired
	private CategoryDAO<Category> categoryDAO;
	
	@Autowired
	private ProductInfoDAO<ProductInfo> productInfoDAO;
	
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
	
	public List<Category> getAllCategory(Category category, Paging paging){
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
				query.append(" and model.name like :name ");
				mapParams.put("name", "%"+category.getName()+"%");
			}
		}
		return categoryDAO.findAll(query.toString(), mapParams, paging);
	}
	
	public Category findByIdCategory(int id) {
		logger.info("Find by ID: "+ id);
		return categoryDAO.findById(Category.class, id);
	}
	
	//ProductInfo
	public void saveProductInfo(ProductInfo productInfo) throws Exception{
		logger.info("Insert productInfo: "+productInfo.toString());
		productInfo.setActiveFlag(1);
		productInfo.setCreateDate(new Date());
		productInfo.setUpdateDate(new Date());
		productInfo.setImgUrl("/upload/"+productInfo.getMultipartFile().getOriginalFilename());
		productInfoDAO.save(productInfo);
	}
	
	public void updateProductInfo(ProductInfo productInfo) throws Exception{
		logger.info("Update productInfo: "+productInfo.toString());
		productInfo.setUpdateDate(new Date());
		productInfoDAO.update(productInfo);
	}
	
	public void deleteProductInfo(ProductInfo productInfo) throws Exception{
		productInfo.setActiveFlag(0);
		productInfo.setUpdateDate(new Date());
		logger.info("Delete productInfo: "+productInfo.toString());
		productInfoDAO.update(productInfo);
	}
	
	public List<ProductInfo> findProductInfo(String property, Object value){
		logger.info("=======================Find by productInfo start========================== ");
		logger.info("Property: "+ property+"/tValue: "+value.toString());
		return productInfoDAO.findByProperty(property, value);
	}
	
	public List<ProductInfo> getAllProductInfo(ProductInfo productInfo, Paging paging){
		logger.info("Show all productInfo");
		StringBuilder query = new StringBuilder();
		Map<String, Object> mapParams = new HashMap<String, Object>();
		if(productInfo!= null) {
			if(productInfo.getId() != null && productInfo.getId() != 0) {
				query.append(" and model.id=:id ");
				mapParams.put("id", productInfo.getId());
			}
			if(productInfo.getCode() != null && !StringUtils.isEmpty(productInfo.getCode())) {
				query.append(" and model.code=:code ");
				mapParams.put("code", productInfo.getCode());
			}
			if(productInfo.getName() != null && !StringUtils.isEmpty(productInfo.getName())) {
				query.append(" and model.name like :name ");
				mapParams.put("name", "%"+productInfo.getName()+"%");
			}
		}
		return productInfoDAO.findAll(query.toString(), mapParams, paging);
	}
	
	public ProductInfo findByIdProductInfo(int id) {
		logger.info("Find by ID: "+ id);
		return productInfoDAO.findById(ProductInfo.class, id);
	}
}
