package inventory.dao.Impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import inventory.dao.ProductInfoDAO;
import inventory.model.ProductInfo;

@Repository
@Transactional(rollbackFor = Exception.class)
public class ProductInfoDAOImpl extends BaseDAOImpl<ProductInfo> implements ProductInfoDAO<ProductInfo> {

}
