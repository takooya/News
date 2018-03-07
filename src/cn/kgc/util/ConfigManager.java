package cn.kgc.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigManager {
    private static ConfigManager ourInstance;
    private static Properties properties;
    public static ConfigManager getInstance() {
        if(ourInstance==null){
            ourInstance=new ConfigManager();
        }
        return ourInstance;
    }

    private ConfigManager() {
        String configFile="database.properties";
        properties=new Properties();
        InputStream in=ConfigManager.class.getClassLoader().getResourceAsStream(configFile);
        try {
            properties.load(in);
            in.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public String getString(String key){
        return properties.getProperty(key);
    }
}
