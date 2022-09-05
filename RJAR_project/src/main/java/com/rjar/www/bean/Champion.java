package com.rjar.www.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Champion {
   private String tier;
   private String lane;
   
   private String championName;
   private String champion_kr_name;
   private int championId;
   private double winRate;
   private double pickRate;
   private double banRate;
   private int champTier;
   private String counter1;
   private String counter2;
   private String counter3;
}