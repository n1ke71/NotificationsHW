//
//  KIGovernment.h
//  NotificationsHW
//
//  Created by Ivan Kozaderov on 12.01.2018.
//  Copyright © 2018 Ivan Kozaderov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

extern NSString* const KIGovernmentTaxLevelDidChangeNotification     ;
extern NSString* const KIGovernmentSalaryDidChangeNotification       ;
extern NSString* const KIGovernmentAveragePriceDidChangeNotification ;
extern NSString* const KIGovernmentPensionDidChangeNotification      ;

extern NSString* const KIGovernmentTaxLevelUserInfoKey               ;
extern NSString* const KIGovernmentSalaryUserInfoKey                 ;
extern NSString* const KIGovernmentAveragePriceUserInfoKey           ;
extern NSString* const KIGovernmentPensionUserInfoKey                ;

extern NSString* const  UIApplicationDidFinishLaunchingNotification ;
extern NSString* const  UIApplicationWillResignActiveNotification   ;
extern NSString* const  UIApplicationDidEnterBackgroundNotification ;
extern NSString* const  UIApplicationWillEnterForegroundNotification;
extern NSString* const  UIApplicationDidBecomeActiveNotification    ;
extern NSString* const  UIApplicationWillTerminateNotification      ;

@interface KIGovernment : NSObject

@property (assign,nonatomic) CGFloat taxLevel;
@property (assign,nonatomic) CGFloat salary;
@property (assign,nonatomic) CGFloat averagePrice;
@property (assign,nonatomic) CGFloat pension;

@end
