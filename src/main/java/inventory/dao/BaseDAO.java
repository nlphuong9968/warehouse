package inventory.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import inventory.model.Paging;

public interface BaseDAO<E> {
	
	List<E> findAll(String query, Map<String, Object> mapParams, Paging paging);
	
	E findById(Class<E> e, Serializable id);
	
	List<E> findByProperty(String property, Object value);
	
	void save(E instance);
	
	void update(E instance);
	
}
