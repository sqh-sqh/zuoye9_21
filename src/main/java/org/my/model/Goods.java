package org.my.model;
//产品
public class Goods {
    private Integer goodId;
    private String code;
    private String format;
    private String measure;
    private String quantity;
    private String price;
    private String putTime;

    public Goods() {
    }

    public Goods(Integer goodId, String code, String format, String measure, String quantity, String price, String putTime) {
        this.goodId = goodId;
        this.code = code;
        this.format = format;
        this.measure = measure;
        this.quantity = quantity;
        this.price = price;
        this.putTime = putTime;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public String getMeasure() {
        return measure;
    }

    public void setMeasure(String measure) {
        this.measure = measure;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPutTime() {
        return putTime;
    }

    public void setPutTime(String putTime) {
        this.putTime = putTime;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodId=" + goodId +
                ", code='" + code + '\'' +
                ", format='" + format + '\'' +
                ", measure='" + measure + '\'' +
                ", quantity='" + quantity + '\'' +
                ", price='" + price + '\'' +
                ", putTime='" + putTime + '\'' +
                '}';
    }
}
