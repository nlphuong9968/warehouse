package inventory.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import inventory.model.Category;
import inventory.model.Paging;
import inventory.model.ProductInfo;
import inventory.service.ProductService;
import inventory.util.Constant;
import inventory.validate.ProductInfoValidator;

@Controller
public class ProductInfoController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductInfoValidator productInfoValidator;
	
	private static final Logger log = Logger.getLogger(ProductInfoController.class);
	
	@InitBinder
	private void initBinder(WebDataBinder binder) {
		if(binder.getTarget() == null) {
			return;
		}
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
		if(binder.getTarget().getClass() == ProductInfo.class) {
			binder.setValidator(productInfoValidator);
		}
	}
	@RequestMapping(value= {"/product-info/list","/product-info/list/"})
	public String redirect() {
		return "redirect:/product-info/list/1";
	}
	
	@RequestMapping(value="/product-info/list/{page}")
	public String showProductInfoList(Model model, HttpSession session,@ModelAttribute("searchForm") ProductInfo productInfo, @PathVariable("page") int page) {
		Paging paging = new Paging(5);
		paging.setIndexPage(page);
		List<ProductInfo> productInfos = productService.getAllProductInfo(productInfo, paging);
		if(session.getAttribute(Constant.MSG_SUCCESS)!= null) {
			model.addAttribute(Constant.MSG_SUCCESS, session.getAttribute(Constant.MSG_SUCCESS));
			session.removeAttribute(Constant.MSG_SUCCESS);
		}
		if(session.getAttribute(Constant.MSG_ERROR)!= null) {
			model.addAttribute(Constant.MSG_ERROR, session.getAttribute(Constant.MSG_ERROR));
			session.removeAttribute(Constant.MSG_ERROR);
		}
		model.addAttribute("pageInfo", paging);
		model.addAttribute("productInfos", productInfos);
		return "product-info-list";
	}
	
	@GetMapping("/product-info/add")
	public String add(Model model) {
		model.addAttribute("titlePage", "Add product-info");
		model.addAttribute("modelForm", new ProductInfo());
		List<Category> categories = productService.getAllCategory(null, null);
		Map<String, String> mapCategory = new HashMap<String, String>();
		for (Category category : categories) {
			mapCategory.put(String.valueOf(category.getId()), category.getName());
		}
		
		model.addAttribute("mapCategory", mapCategory);
		model.addAttribute("viewOnly", false);
		return "product-info-action";		
	}
	
	@GetMapping("/product-info/edit/{id}")
	public String edit(Model model, @PathVariable("id") int id) {
		log.info("Edit product-info with id ="+id);
		ProductInfo productInfo = productService.findByIdProductInfo(id);
		if(productInfo != null) {
			List<Category> categories = productService.getAllCategory(null, null);
			Map<String, String> mapCategory = new HashMap<String, String>();
			for (Category category : categories) {
				mapCategory.put(String.valueOf(category.getId()), category.getName());
			}
			productInfo.setCateId(productInfo.getCategory().getId());
			model.addAttribute("mapCategory", mapCategory);
			model.addAttribute("titlePage", "Edit product-info");
			model.addAttribute("modelForm", productInfo);
			model.addAttribute("viewOnly", false);
			return "product-info-action";		
		}
		return "redirect:/product-info/list";
	}
	
	@GetMapping("/product-info/view/{id}")
	public String view(Model model, @PathVariable("id") int id) {
		log.info("Edit product-info with id ="+id);
		ProductInfo productInfo = productService.findByIdProductInfo(id);
		if(productInfo != null) {
			List<Category> categories = productService.getAllCategory(null, null);
			Map<String, String> mapCategory = new HashMap<String, String>();
			for (Category category : categories) {
				mapCategory.put(String.valueOf(category.getId()), category.getName());
			}
			productInfo.setCateId(productInfo.getCategory().getId());
			model.addAttribute("titlePage", "View product-info");
			model.addAttribute("mapCategory", mapCategory);
			model.addAttribute("modelForm", productInfo);
			model.addAttribute("viewOnly", true);
			return "product-info-action";		
		}
		return "redirect:/product-info/list";
	}
	
	@PostMapping("/product-info/save")
	public String save(Model model, @ModelAttribute("modelForm") @Validated ProductInfo productInfo, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			if(productInfo.getId()!= null) {
				model.addAttribute("titlePage", "Edit product-info");
			}else {
				model.addAttribute("titlePage", "Add product-info");
			}
			List<Category> categories = productService.getAllCategory(null, null);
			Map<String, String> mapCategory = new HashMap<String, String>();
			for (Category category : categories) {
				mapCategory.put(String.valueOf(category.getId()), category.getName());
			}
			model.addAttribute("mapCategory", mapCategory);
			model.addAttribute("modelForm", productInfo);
			model.addAttribute("viewOnly", false);
			return "product-info-action";		
		}
		Category category = new Category();
		category.setId(productInfo.getCateId());
		productInfo.setCategory(category);
		if(productInfo.getId()!=null && productInfo.getId()!=0) {
			try {
				productService.updateProductInfo(productInfo);
				session.setAttribute(Constant.MSG_SUCCESS, "Update success!!!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				log.error(e.getMessage());
				session.setAttribute(Constant.MSG_ERROR, "Update has  error!!!");
				
			}
			
		}else {
			try {
				productService.saveProductInfo(productInfo);
				session.setAttribute(Constant.MSG_SUCCESS, "Insert success!!!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				log.error(e.getMessage());
				session.setAttribute(Constant.MSG_ERROR, "Insert has  error!!!");
			}
		}
		return "redirect:/product-info/list";
	}
	
	@GetMapping("/product-info/delete/{id}")
	public String delete(Model model, @PathVariable("id") int id, HttpSession session) {
		log.info("Delete product-info with id ="+id);
		ProductInfo productInfo = productService.findByIdProductInfo(id);
		if(productInfo != null) {
			try {
				productService.deleteProductInfo(productInfo);
				session.setAttribute(Constant.MSG_SUCCESS, "Delete success!!!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				log.error(e.getMessage());
				session.setAttribute(Constant.MSG_ERROR, "Delete has  error!!!");
			}
		}
		return "redirect:/product-info/list";
	}
}
