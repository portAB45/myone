package com.lz;
import java.util.HashMap;
import java.util.Map;

public class RegisterBean {
    private String username;            //定义用户名
    private String password1;       //定义密码
    private String password2;      //定义确认密码
    // 定义成员变量errors,用于封装表单验证时的错误信息
    private Map<String, String> errors = new HashMap<String, String>();
    public String getUsername() {
        return username;
    }
    public void setUserame(String name) {
        this.username = name;
    }
    public String getPassword1() {
        return password1;
    }
    public void setPassword1(String password) {
        this.password1 = password;
    }
    public String getPassword2() {
        return password2;
    }
    public void setPassword2(String password2) {
        this.password2 = password2;
    }
    public boolean validate() {
        boolean flag = true;
        if (username == null || username.trim().equals("")) {
            errors.put("username", "请输入用户名.");
            flag = false;
        }
        if (password1 == null || password1.trim().equals("")) {
            errors.put("password1", "请输入密码.");
            flag = false;
        } else if (password1.length() > 8 || password1.length() < 5) {
            errors.put("password1", "请输入5-8个字符.");
            flag = false;
        }
        if (password1 != null && !password1.equals(password2)) {
            errors.put("password2", "两次输入的密码不匹配.");
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