//
//  KIPensioner.h
//  NotificationsHW
//
//  Created by Ivan Kozaderov on 14.01.2018.
//  Copyright © 2018 Ivan Kozaderov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface KIPensioner : NSObject

@property (assign,nonatomic)CGFloat pension;
@property (assign,nonatomic)CGFloat averagePrice;
@property (assign,nonatomic)CGFloat inflation;

@end
