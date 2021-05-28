/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author ShacoJX
 */
public class Account {

    private int id;
    private String name;
    private String password;
    private String encode;
    private String pin;
    private String question;
    private String answer;
    private String email;
    private String phone;
    private String qq;
    private String tel;
    private String address;
    private String id_type = "IdCard";
    private String id_card;
    private int point;
    private int score;
    private String last_ip_login;
    private Date date_registered;
    private Date date_modified;
    private int is_online;
    private int is_lock;

    public Account() {
    }

    public Account(int id, String name, String password) {
        this.id = id;
        this.name = name;
        this.password = password;
    }

    public Account(String name, String password) {
        this.name = name;
        this.password = password;
    }
    
    

    public Account(int id, String name, String password, String email, String phone, int point) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.point = point;
    }

    public Account(int id, String name, String password, String question, String answer, String email, String phone) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.question = question;
        this.answer = answer;
        this.email = email;
        this.phone = phone;
    }
    
    
    

    public Account(int id, String name, String password, int point, int score, String last_ip_login, Date date_registered, Date date_modified, int is_online, int is_lock) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.point = point;
        this.score = score;
        this.last_ip_login = last_ip_login;
        this.date_registered = date_registered;
        this.date_modified = date_modified;
        this.is_online = is_online;
        this.is_lock = is_lock;
    }

    public Account(int id, String question, String answer, String email, String phone) {
        this.id = id;
        this.question = question;
        this.answer = answer;
        this.email = email;
        this.phone = phone;
    }



    public Account(int id, String name, String password, String encode, String pin, String question, String answer, String email, String phone, String qq, String tel, String address, String id_card, int point, int score, String last_ip_login, Date date_registered, Date date_modified, int is_online, int is_lock) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.encode = encode;
        this.pin = pin;
        this.question = question;
        this.answer = answer;
        this.email = email;
        this.phone = phone;
        this.qq = qq;
        this.tel = tel;
        this.address = address;
        this.id_card = id_card;
        this.point = point;
        this.score = score;
        this.last_ip_login = last_ip_login;
        this.date_registered = date_registered;
        this.date_modified = date_modified;
        this.is_online = is_online;
        this.is_lock = is_lock;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEncode() {
        return encode;
    }

    public void setEncode(String encode) {
        this.encode = encode;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getId_type() {
        return id_type;
    }

    public void setId_type(String id_type) {
        this.id_type = id_type;
    }

    public String getId_card() {
        return id_card;
    }

    public void setId_card(String id_card) {
        this.id_card = id_card;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getLast_ip_login() {
        return last_ip_login;
    }

    public void setLast_ip_login(String last_ip_login) {
        this.last_ip_login = last_ip_login;
    }

    public Date getDate_registered() {
        return date_registered;
    }

    public void setDate_registered(Date date_registered) {
        this.date_registered = date_registered;
    }

    public Date getDate_modified() {
        return date_modified;
    }

    public void setDate_modified(Date date_modified) {
        this.date_modified = date_modified;
    }

    public int getIs_online() {
        return is_online;
    }

    public void setIs_online(int is_online) {
        this.is_online = is_online;
    }

    public int getIs_lock() {
        return is_lock;
    }

    public void setIs_lock(int is_lock) {
        this.is_lock = is_lock;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", name=" + name + ", password=" + password + ", encode=" + encode + ", pin=" + pin + ", question=" + question + ", answer=" + answer + ", email=" + email + ", phone=" + phone + ", qq=" + qq + ", tel=" + tel + ", address=" + address + ", id_type=" + id_type + ", id_card=" + id_card + ", point=" + point + ", score=" + score + ", last_ip_login=" + last_ip_login + ", date_registered=" + date_registered + ", date_modified=" + date_modified + ", is_online=" + is_online + ", is_lock=" + is_lock + '}';
    }

}
