package com.kewen.utils;
import java.math.BigDecimal;
public class PriceUtils {
    //float 相加计算
    public static float add(float d1,float d2){
//需要将double 转换为 BigDecimal 十进制精度计算
        BigDecimal bigA = new BigDecimal(Float.toString(d1));
        BigDecimal bigB = new BigDecimal(Float.toString(d2));
//必须调用 相加 add()
        return bigA.add(bigB).floatValue();
    }
    //double 相加计算
    public static double add(double d1,double d2){
//需要将double 转换为 BigDecimal 十进制精度计算
        BigDecimal bigA = new BigDecimal(Double.toString(d1));
        BigDecimal bigB = new BigDecimal(Double.toString(d2));
//必须调用 相加 add()
        return bigA.add(bigB).doubleValue();
    }
    //double 相减计算
    public static double subtract(double d1,double d2){
//需要将double 转换为 BigDecimal 十进制精度计算
        BigDecimal bigA = new BigDecimal(Double.toString(d1));
        BigDecimal bigB = new BigDecimal(Double.toString(d2));
//必须调用 相减 subtract()
        return bigA.subtract(bigB).doubleValue();
    }
    //float 相减计算
    public static float subtract(float d1,float d2){
//需要将double 转换为 BigDecimal 十进制精度计算
        BigDecimal bigA = new BigDecimal(Float.toString(d1));
        BigDecimal bigB = new BigDecimal(Float.toString(d2));
//必须调用 相减 subtract()
        return bigA.subtract(bigB).floatValue();
    }
    public static void main(String[] args) {
        System.out.println(PriceUtils.add(0.1, 0.2));
    }
}