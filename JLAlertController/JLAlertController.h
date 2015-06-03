//
//  JLAlertController.h
//  JLAlertController
//
//  Created by TSUNG-LUN LIAO on 2015/5/29.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLAlertControllerConstant.h"

typedef NS_ENUM(NSInteger, JLAlertControllerStyle) {
//    JLAlertControllerStyleActionSheet,
    JLAlertControllerStyleAlert
};

@interface JLAlertController : UIViewController

#pragma mark - JLAlertController Part
@property (nonatomic, strong) NSString *alerttitle;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) JLAlertControllerStyle style;
@property (nonatomic, strong) NSString *alertImageName;

+ (JLAlertController*)alertControllerWithTitle:(NSString *)title withMessage:(NSString *)message withPreferredStyle:(JLAlertControllerStyle)preferredStyle;

+ (JLAlertController*)alertControllerWithTitle:(NSString *)title withMessage:(NSString *)message withPreferredStyle:(JLAlertControllerStyle)preferredStyle withActionS:(NSArray*)actions;

- (void)setAlertControllerImageWithImageName:(NSString*)imageName;

#pragma mark - JLAlertAction Part
@property (nonatomic, strong) NSMutableArray *actions;

- (void)addActionWithAction:(id)action;
- (void)addActionWithActionS:(NSArray*)actions;



- (void)show;


@end
