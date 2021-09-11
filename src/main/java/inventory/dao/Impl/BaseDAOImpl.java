package inventory.dao.Impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import inventory.dao.BaseDAO;
import inventory.model.Paging;

@Repository
@Transactional(rollbackFor = Exception.class)
public class BaseDAOImpl<E> implements BaseDAO<E>{
	final static Logger log = Logger.getLogger(BaseDAOImpl.class);
	
	@Autowired
	SessionFactory sessionFactory;
	
	public String getGenericName() {
		String s = getClass().getGenericSuperclass().toString();
		Pattern pattern = Pattern.compile("\\<(.*?)\\>");
		Matcher m = pattern.matcher(s);
		String generic="null";
		if(m.find()) {
			generic = m.group(1);
		}
		return generic;
	}

	public List<E> findAll(String queryStr, Map<String, Object> mapParams, Paging paging) {
		log.info("Find all record from db");
		StringBuilder query = new StringBuilder();
		StringBuilder countQuery = new StringBuilder();
		countQuery.append("select count(*) from ").append(getGenericName()).append(" as model where model.activeFlag=1");
		query.append(" from ").append(getGenericName()).append(" as model where model.activeFlag=1");
		if(queryStr!=null && !queryStr.isEmpty()) {
			query.append(queryStr);
			countQuery.append(queryStr);
		}
		Query<E> queryQ = sessionFactory.getCurrentSession().createQuery(query.toString());
		Query<E> countQ = sessionFactory.getCurrentSession().createQuery(countQuery.toString());
		if(mapParams!=null && !mapParams.isEmpty()) {
			for (String key : mapParams.keySet()) {
				queryQ.setParameter(key, mapParams.get(key));
				countQ.setParameter(key, mapParams.get(key));
			}
		}
		if(paging != null) {
			queryQ.setFirstResult(paging.getOffset());
			queryQ.setMaxResults(paging.getRecordPerPage());
			long totalRecords = (long) countQ.uniqueResult();
			paging.setTotalRows(totalRecords);
		}
		log.info("Query find all ====>"+queryQ.toString());
		log.info("Count find all ====>"+countQ.toString());
		return queryQ.list();
	}

	public E findById(Class<E> e, Serializable id) {
		log.info("Find by ID");
		return sessionFactory.getCurrentSession().get(e, id);
	}

	public List<E> findByProperty(String property, Object value) {
		log.info("Find by Property");
		StringBuilder queryStr = new StringBuilder();
		queryStr.append(" from ").append(getGenericName()).append(" as model where model.activeFlag=1 and model.").append(property).append(" = :property");
		log.info("Query find all ====>"+queryStr.toString());
		Query<E> query = sessionFactory.getCurrentSession().createQuery(queryStr.toString());
		query.setParameter("property", value);
		
		return query.getResultList();
	}

	public void save(E instance) {
		log.info("Save instance");
		sessionFactory.getCurrentSession().persist(instance);
		
	}

	public void update(E instance) {
		log.info("Update instance");
		sessionFactory.getCurrentSession().merge(instance);
	}

}
