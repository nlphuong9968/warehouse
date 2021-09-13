package inventory.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigLoader {
	private Properties properties = null;
	private static ConfigLoader instance = null;
	
	private ConfigLoader() {
		String proFileName = "config.properties";
		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(proFileName);
		if(inputStream!=null) {
			properties = new Properties();
			try {
				properties.load(inputStream);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static ConfigLoader getInstance() {
		if(instance == null) {
			//multi thread
//			synchronized (ConfigLoader.class) {
//				instance = new ConfigLoader();
//			}
			//single thread
			instance = new ConfigLoader();
		}
		
		return instance;
	}
	public String getValue(String key) {
		if(properties.contains(key)) {
			return properties.getProperty(key);
		}
		return null;
	}
}
