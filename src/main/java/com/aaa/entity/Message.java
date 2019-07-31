package com.aaa.entity;

public class Message {
    String a;

    public Message() {
    }

    public Message(String a) {
        this.a =a;
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }

    @Override
    public String toString() {
        return "Message{" +
                "a='" + a + '\'' +
                '}';
    }
}
