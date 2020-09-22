package org.my.model;

public class Sort {
    private Integer classId;
    private String assetsCall;

    public Sort() {
    }

    public Sort(Integer classId, String assetsCall) {
        this.classId = classId;
        this.assetsCall = assetsCall;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getAssetsCall() {
        return assetsCall;
    }

    public void setAssetsCall(String assetsCall) {
        this.assetsCall = assetsCall;
    }

    @Override
    public String toString() {
        return "Sort{" +
                "classId=" + classId +
                ", assetsCall='" + assetsCall + '\'' +
                '}';
    }
}
