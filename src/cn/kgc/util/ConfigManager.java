package cn.kgc.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.function.BiConsumer;

public class ConfigManager {
    private static ConfigManager ourInstance;
    private static Properties properties;

    public static ConfigManager getInstance() {
        if (ourInstance == null) {
            ourInstance = new ConfigManager();
        }
        return ourInstance;
    }

    private ConfigManager() {
        String configFile = "application.properties";
        InputStream in = ConfigManager.class.getClassLoader().getResourceAsStream(configFile);
        ConfigManager.properties = new Properties();
        try {
            ConfigManager.properties.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
        configFile = properties.getProperty("db.properties.active");
        in = ConfigManager.class.getClassLoader().getResourceAsStream(configFile);
        try {
            ConfigManager.properties.load(in);
            in.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public String getString(String key) {
        return properties.getProperty(key);
    }

    public static void getAllProperties() {
        properties.forEach((o, o2) -> {
            System.out.println("key is " + o);
            System.out.println("value is " + o2);
        });
    }
}
