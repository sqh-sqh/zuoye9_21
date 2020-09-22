package org.my.model;
//财务
public class Finance {
    private Integer financeId;
    private String user;
    private String voucher;
    private String payTime;
    private String infor;

    public Finance() {
    }

    public Finance(Integer financeId, String user, String voucher, String payTime, String infor) {
        this.financeId = financeId;
        this.user = user;
        this.voucher = voucher;
        this.payTime = payTime;
        this.infor = infor;
    }

    public Integer getFinanceId() {
        return financeId;
    }

    public void setFinanceId(Integer financeId) {
        this.financeId = financeId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getVoucher() {
        return voucher;
    }

    public void setVoucher(String voucher) {
        this.voucher = voucher;
    }

    public String getPayTime() {
        return payTime;
    }

    public void setPayTime(String payTime) {
        this.payTime = payTime;
    }

    public String getInfor() {
        return infor;
    }

    public void setInfor(String infor) {
        this.infor = infor;
    }

    @Override
    public String toString() {
        return "Finance{" +
                "financeId='" + financeId + '\'' +
                ", user='" + user + '\'' +
                ", voucher='" + voucher + '\'' +
                ", payTime='" + payTime + '\'' +
                ", infor='" + infor + '\'' +
                '}';
    }
}
