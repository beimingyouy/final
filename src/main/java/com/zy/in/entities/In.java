package com.zy.in.entities;

import java.math.BigDecimal;
import java.util.Date;

public class In {
    private BigDecimal id;

    private String inId;

    private String inNote;

    private BigDecimal wmId;

    private BigDecimal wmCount;

    private BigDecimal pId;

    private BigDecimal pCount;

    private Date createTime;

    private Date updateTime;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getInId() {
        return inId;
    }

    public void setInId(String inId) {
        this.inId = inId == null ? null : inId.trim();
    }

    public String getInNote() {
        return inNote;
    }

    public void setInNote(String inNote) {
        this.inNote = inNote == null ? null : inNote.trim();
    }

    public BigDecimal getWmId() {
        return wmId;
    }

    public void setWmId(BigDecimal wmId) {
        this.wmId = wmId;
    }

    public BigDecimal getWmCount() {
        return wmCount;
    }

    public void setWmCount(BigDecimal wmCount) {
        this.wmCount = wmCount;
    }

    public BigDecimal getpId() {
        return pId;
    }

    public void setpId(BigDecimal pId) {
        this.pId = pId;
    }

    public BigDecimal getpCount() {
        return pCount;
    }

    public void setpCount(BigDecimal pCount) {
        this.pCount = pCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}