package cn.kgc.dao;

import cn.kgc.util.ConfigManager;

import java.sql.*;

public class Connect {
    public Connection conn;
    public PreparedStatement preSta;
    public ResultSet rstSet;
    private int ConnectionCount = 0;

    //获得JDBC的连接
    public boolean getConnection() {

        //JDBC方式连接数据库
        boolean judgeConn = false;
        try {
            ConfigManager instance = ConfigManager.getInstance();
            String forName = instance.getString("jdbc.driver_class");
            String url = instance.getString("jdbc.connection.url");
            String username = instance.getString("jdbc.connection.username");
            String password = instance.getString("jdbc.connection.password");
            Class.forName(forName);
            conn = DriverManager.getConnection(url, username, password);
            judgeConn = true;
            System.out.println(this.getClass().getSimpleName() + "getConnection:");
            System.out.println("**********JDBC-connect**********");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            judgeConn = false;
        }
        return judgeConn;

        /** JNDI方式连接数据库
         boolean judgeConn = false;
         try {
         Context context = new InitialContext();
         DataSource dataSource=(DataSource)context.lookup("java:comp/env/jdbc/news"); //引用数据源
         conn=dataSource.getConnection();
         ConnectionCount++;
         judgeConn=true;
         } catch (NamingException e) {
         e.printStackTrace();
         judgeConn = false;
         } catch (SQLException e) {
         e.printStackTrace();
         judgeConn = false;
         }
         return judgeConn;*/
    }

    //查询数据库
    public ResultSet query(String sql, Object obj[]) {
        if (getConnection()) {
            try {
                preSta = conn.prepareStatement(sql);
                for (int i = 0; i < obj.length; i++) {
                    preSta.setObject(i + 1, obj[i]);
                }
                rstSet = preSta.executeQuery();
            } catch (SQLException e) {
                e.printStackTrace();
                rstSet = null;
            }
        } else {
            rstSet = null;
        }
        return rstSet;
    }

    //更新数据库
    public int update(String sql, Object obj[]) {
        int rows = 0;
        if (getConnection()) {
            try {
                preSta = conn.prepareStatement(sql);
                for (int i = 0; i < obj.length; i++) {
                    preSta.setObject(i + 1, obj[i]);
                }
                rows = preSta.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
                rows = 0;
            }
        } else {
            rows = 0;
        }
        return rows;
    }

    //关闭资源
    public void closeResourse() {
        try {
            if (rstSet != null) rstSet.close();
            if (preSta != null) preSta.close();
            if (conn != null) conn.close();
            ConnectionCount--;
            judgeConnectionCount();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Connect-closeResourse-err");
        }
    }

    private void judgeConnectionCount() {
        if (ConnectionCount > 1 || ConnectionCount < -1) {
            System.err.println("Connect.judgeConnectionCount\t现在连接数为:" + ConnectionCount);
        }
    }
}