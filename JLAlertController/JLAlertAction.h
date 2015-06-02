//
//  JLAlertAction.h
//  CustomizeUIAlerView
//
//  Created by TSUNG-LUN LIAO on 2015/5/29.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JLAlertControllerConstant.h"


typedef NS_ENUM(NSInteger, JLAlertActionStyle) {
    JLAlertActionStyleDefault,
//    JLAlertActionStyleCancel,
//    JLAlertActionStyleDestructive
};

@interface JLAlertAction : NSObject

@property (nonatomic, assign) NSString              *actionTitle;
@property (nonatomic, assign) JLAlertActionStyle    style;

+ (JLAlertAction*)actionWithActionTitle:(NSString *)actionTitle style:(JLAlertActionStyle)style handler:(void(^)(JLAlertAction *action))ablock;

- (void)blockback;

@end
