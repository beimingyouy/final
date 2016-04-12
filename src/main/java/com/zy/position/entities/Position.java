package com.zy.position.entities;

public class Position {
    private Long id;

    private String pId;

    private Long pCount;

    private Long pAll;

    private String pName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public Long getpCount() {
        return pCount;
    }

    public void setpCount(Long pCount) {
        this.pCount = pCount;
    }

    public Long getpAll() {
        return pAll;
    }

    public void setpAll(Long pAll) {
        this.pAll = pAll;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }
}