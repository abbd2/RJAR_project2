package com.rjar.www.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;


import lombok.Data;

@Data
public class Champion {
   @Value("platinum")
   private String tier;
   @Value("top")
   private String lane;
   
   private String championName;
   private String champion_kr_name;
   private int champId;
   private double winRate;
   private double pickRate;
   private double banRate;
   private int champTier;
   private String counter1;
   private String counter2;
   private String counter3;
   private String counter4;
   private String counter5;
   private String counter6;
   private String counter7;
   private String counter8;
   private String counter9;
   private String counter10;
}