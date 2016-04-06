package com.zy.wm.entities;

public class Wm {
    private Long wmId;

    private String wmName;

    private Long wmCount;

    private Long wmAll;

    private Long id;

    public Long getWmId() {
        return wmId;
    }

    public void setWmId(Long wmId) {
        this.wmId = wmId;
    }

    public String getWmName() {
        return wmName;
    }

    public void setWmName(String wmName) {
        this.wmName = wmName == null ? null : wmName.trim();
    }

    public Long getWmCount() {
        return wmCount;
    }

    public void setWmCount(Long wmCount) {
        this.wmCount = wmCount;
    }

    public Long getWmAll() {
        return wmAll;
    }

    public void setWmAll(Long wmAll) {
        this.wmAll = wmAll;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}