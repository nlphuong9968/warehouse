package inventory.dao;

import inventory.model.Auth;

public interface AuthDAO<E> extends BaseDAO<E>{
	
	Auth find(int roleId, int menuId);

}
