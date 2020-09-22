package org.my.model;

public class Assets{
    private Integer assetsId;
    private Integer classId;
    private Integer financeId;
    private Integer goodId;
    private Integer user;
    private Integer mode;

    public Assets() {
    }

    public Assets(Integer assetsId, Integer classId, Integer financeId, Integer goodId, Integer user, Integer mode) {
        this.assetsId = assetsId;
        this.classId = classId;
        this.financeId = financeId;
        this.goodId = goodId;
        this.user = user;
        this.mode = mode;
    }

    public Integer getAssetsId() {
        return assetsId;
    }

    public void setAssetsId(Integer assetsId) {
        this.assetsId = assetsId;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getFinanceId() {
        return financeId;
    }

    public void setFinanceId(Integer financeId) {
        this.financeId = financeId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Integer getUser() {
        return user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

    public Integer getMode() {
        return mode;
    }

    public void setMode(Integer mode) {
        this.mode = mode;
    }

    @Override
    public String toString() {
        return "Assets{" +
                "assetsId=" + assetsId +
                ", classId=" + classId +
                ", financeId=" + financeId +
                ", goodId=" + goodId +
                ", user=" + user +
                ", mode=" + mode +
                '}';
    }
}
