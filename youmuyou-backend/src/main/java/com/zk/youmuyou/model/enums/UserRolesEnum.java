package com.zk.youmuyou.model.enums;

/**
 * 队伍状态枚举
 */
public enum UserRolesEnum {

    PARTNER(0, "伙伴，普通用户"),
    ADMIN(1, "管理员"),

    BOSS(2,"系统管理员");

    private int value;

    private String text;

    public static UserRolesEnum getEnumByValue(Integer value) {
        if (value == null) {
            return null;
        }
        UserRolesEnum[] values = UserRolesEnum.values();
        for (UserRolesEnum teamStatusEnum : values) {
            if (teamStatusEnum.getValue() == value) {
                return teamStatusEnum;
            }
        }
        return null;
    }

    UserRolesEnum(int value, String text) {
        this.value = value;
        this.text = text;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
