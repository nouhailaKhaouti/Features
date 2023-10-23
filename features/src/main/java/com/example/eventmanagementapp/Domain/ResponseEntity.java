package com.example.eventmanagementapp.Domain;

public class ResponseEntity {
    private String message;
    private Integer code;

    public ResponseEntity() {
    }

    public ResponseEntity(String message, Integer code) {
        this.message = message;
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
