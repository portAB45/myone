package com.lz;

import java.util.HashMap;
import java.util.Map;

public class UpdateBean {
    private String username;            //定义用户名
    private String password;       //定义密码
    // 定义成员变量errors,用于封装表单验证时的错误信息
    private Map<String, String> errors = new HashMap<String, String>();
    public String getUsername() {
        return username;
    }
    public void setUsername(String name) {
        this.username = name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public boolean validate() {
        boolean flag = true;
        if (username == null || username.trim().equals("")) {
            errors.put("username", "请输入姓名.");
            flag = false;
        }
        if (password == null || password.trim().equals("")) {
            errors.put("password", "请输入密码.");
            flag = false;
        } else if (password.length() > 8 || password.length() < 5) {
            errors.put("password", "请输入5-8个字符.");
            flag = false;
        }
        return flag;
    }
    // 向Map集合errors中添加错误信息
    public void setErrorMsg(String err, String errMsg) {
        if ((err != null) && (errMsg != null)) {
            errors.put(err, errMsg);
        }
    }
    // 获取errors集合
    public Map<String, String> getErrors() {
        return errors;
    }
}
