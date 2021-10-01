package inventory.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import inventory.dao.ProductInStockDAO;
import inventory.model.ProductInStock;
import inventory.model.ProductInfo;
import inventory.model.Invoice;
import inventory.model.Paging;

@Service
public class ProductInStockService {
	
	private static final Logger logger = Logger.getLogger(ProductInStockService.class);
	
	@Autowired
	private ProductInStockDAO<ProductInStock> productInStockDAO;
		
	public List<ProductInStock> getAll(ProductInStock productInStock, Paging paging){
		logger.info("Show all ProductInStock");
		StringBuilder query = new StringBuilder();
		Map<String, Object> mapParams = new HashMap<String, Object>();
		
		if(productInStock!= null && productInStock.getProductInfo()!=null) {
			if(!StringUtils.isEmpty(productInStock.getProductInfo().getCategory().getName())) {
				query.append(" and model.productInfo.category.name like :cateName ");
				mapParams.put("cateName","%"+productInStock.getProductInfo().getCategory().getName()+"%");
			}
			if(productInStock.getProductInfo().getCode()!=null && !StringUtils.isEmpty(productInStock.getProductInfo().getCode())) {
				query.append(" and model.productInfo.code=:code ");
				mapParams.put("code", productInStock.getProductInfo().getCode());
			}
			if(productInStock.getProductInfo().getName()!=null && !StringUtils.isEmpty(productInStock.getProductInfo().getName())) {
				query.append(" and model.productInfo.name like :name ");
				mapParams.put("name", "%"+productInStock.getProductInfo().getName()+"%");
			}
		}
		return productInStockDAO.findAll(query.toString(), mapParams, paging);
	}
	
	public void saveOrUpdate(Invoice invoice) throws Exception{
		logger.info("product in stock");
		if(invoice.getProductInfo()!=null) {
			String code = invoice.getProductInfo().getCode();
			ProductInStock productInStock = productInStockDAO.findByProperty("productInfo.code", code).get(0);
			if(productInStock!=null) {
				logger.info("update qty="+invoice.getQty()+" and price="+invoice.getPrice());
				productInStock.setQty(productInStock.getQty()+invoice.getQty());
				// type =1 receipt , type =2 issues
				if(invoice.getType()==1) {
					productInStock.setPrice(invoice.getPrice());
				}
				
				productInStock.setUpdateDate(new Date());
				productInStockDAO.update(productInStock);
				
			}else if(invoice.getType()==1) {
				logger.info("insert to stock qty="+invoice.getQty()+" and price="+invoice.getPrice());
				productInStock = new ProductInStock();
				ProductInfo productInfo = new ProductInfo();
				productInfo.setId(invoice.getProductInfo().getId());
				productInStock.setProductInfo(productInfo);
				productInStock.setActiveFlag(1);
				productInStock.setCreateDate(new Date());
				productInStock.setUpdateDate(new Date());
				productInStock.setQty(invoice.getQty());
				productInStock.setPrice(invoice.getPrice());
				productInStockDAO.save(productInStock);
			}
		}
	}

}
