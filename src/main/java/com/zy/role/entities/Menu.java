package com.zy.role.entities;

public class Menu {
    private Long menuId;

    private String menuName;

    private String menuHref;

    private String menuTarget;

    private Long parentid;

    private Short grade;

    private Short isleft;

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuHref() {
        return menuHref;
    }

    public void setMenuHref(String menuHref) {
        this.menuHref = menuHref == null ? null : menuHref.trim();
    }

    public String getMenuTarget() {
        return menuTarget;
    }

    public void setMenuTarget(String menuTarget) {
        this.menuTarget = menuTarget == null ? null : menuTarget.trim();
    }

    public Long getParentid() {
        return parentid;
    }

    public void setParentid(Long parentid) {
        this.parentid = parentid;
    }

    public Short getGrade() {
        return grade;
    }

    public void setGrade(Short grade) {
        this.grade = grade;
    }

    public Short getIsleft() {
        return isleft;
    }

    public void setIsleft(Short isleft) {
        this.isleft = isleft;
    }
}