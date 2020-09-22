package org.my.model;
//员工
public class People {
    private Integer id;
    private String posi;
    private String name;
    private String user;
    private String passwd;
    private String status;

    public People() {
    }

    public People(Integer id, String posi, String name, String user, String passwd, String status) {
        this.id = id;
        this.posi = posi;
        this.name = name;
        this.user = user;
        this.passwd = passwd;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPosi() {
        return posi;
    }

    public void setPosi(String posi) {
        this.posi = posi;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "People{" +
                "id='" + id + '\'' +
                ", posi='" + posi + '\'' +
                ", name='" + name + '\'' +
                ", user='" + user + '\'' +
                ", passwd='" + passwd + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
