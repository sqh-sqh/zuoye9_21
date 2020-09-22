package org.my.dto;

import org.my.model.Assets;
import org.my.model.Sort;

public class AssetsDto extends Assets {
    private Sort ss;
    private String assetsCall;
    private String code;

    public AssetsDto() {
    }

    public AssetsDto(Sort ss, String assetsCall, String code) {
        this.ss = ss;
        this.assetsCall = assetsCall;
        this.code = code;
    }

    public Sort getSs() {
        return ss;
    }

    public void setSs(Sort ss) {
        this.ss = ss;
    }

    public String getAssetsCall() {
        return assetsCall;
    }

    public void setAssetsCall(String assetsCall) {
        this.assetsCall = assetsCall;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "AssetsDto{" +
                "ss=" + ss +
                ", assetsCall='" + assetsCall + '\'' +
                ", code='" + code + '\'' +
                '}';
    }
}
