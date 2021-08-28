import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper{
 


String get bannerAdUnitID=>

    	'ca-app-pub-3940256099942544/6300978111';
      static initialization(){
        if(MobileAds.instance==null){
          MobileAds.instance.initialize();
        }
      }
      static BannerAd getBannerAd(){
        BannerAd bAd=new BannerAd(size: AdSize.fullBanner, adUnitId: 'ca-app-pub-3940256099942544/6300978111', 
        listener: BannerAdListener(        
        
         
onAdLoaded: (Ad ad) => print('Ad loaded.'),
 // Called when an ad request failed.
 onAdFailedToLoad: (Ad ad, LoadAdError error) {
   // Dispose the ad here to free resources.
   ad.dispose();
   print('Ad failed to load: $error');
 },
 // Called when an ad opens an overlay that covers the screen.
 onAdOpened: (Ad ad) => print('Ad opened.'),
 // Called when an ad removes an overlay that covers the screen.
 onAdClosed: (Ad ad) => print('Ad closed.'),),
       
 request:AdRequest());return bAd;



  } 
      



}