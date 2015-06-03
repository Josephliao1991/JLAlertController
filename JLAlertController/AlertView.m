//
//  AlertView.m
//  JLAlertController
//
//  Created by TSUNG-LUN LIAO on 2015/6/1.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "AlertView.h"

#define kAlertViewWidth  210
#define kAlertViewHight  75

@implementation AlertView

+ (AlertView*)creatALertViewWithController:(JLAlertController*)controller{
    
    AlertView *alertView= [[AlertView alloc]initWithFrame:CGRectMake(0, 0, kAlertViewWidth, kAlertViewHight)
                                           withController:controller];
    
    return alertView;
}

- (id)initWithFrame:(CGRect)frame withController:(JLAlertController*)controller{
    
    self = [super initWithFrame:frame];
    
    NSMutableArray *actions        = [controller actions];
    NSInteger      actionsCount    = [actions count];
    
    CGSize alertViewSize = CGSizeMake(self.frame.size.width, 75+30*actionsCount);
    self.frame = CGRectMake(0, 0, alertViewSize.width, alertViewSize.height);
    
    [self setTitleViewWithTitle:[controller alerttitle] withMessage:[controller message]];
    
        for (JLAlertAction *action in actions) {
            
            int index = (int)[actions indexOfObject:action];
//            int extraWidth = (self.frame.size.width/actionsCount)*index;
            int extraHight = (30)*index;
            
            AlertActionView *actionView = [[AlertActionView alloc] initWithFrame:
                                           CGRectMake(0,76+extraHight,self.frame.size.width, 29)
                                                                 withActionTitle:[actions[index] actionTitle]
                                                                       withIndex:index
                                                                 withActionImage:nil];
            
            actionView.backgroundColor = [UIColor whiteColor];
            
            actionView.layer.cornerRadius = 5;
            [self addSubview:actionView];
            
        }
    
    self.center = controller.view.center;
    self.layer.cornerRadius = 12;
    
    return self;
}

- (void)setTitleViewWithTitle:(NSString*)title withMessage:(NSString*)message{
    
    JLDynamicLabel *titlelabel   = [JLDynamicLabel creatLabelWithString:title withSize:23];

    JLDynamicLabel *messagelabel = [JLDynamicLabel creatLabelWithString:message withSize:10];
    messagelabel.textColor = [UIColor lightGrayColor];
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kAlertViewWidth, kAlertViewHight)];
    
    titlelabel.center   = CGPointMake(titleView.center.x, titlelabel.frame.size.height);
    messagelabel.center = CGPointMake(titleView.center.x, titleView.center.y+20);
    
    [titleView addSubview:titlelabel];
    [titleView addSubview:messagelabel];
    
    titleView.backgroundColor = [UIColor whiteColor];
    titleView.layer.cornerRadius = 5;
    
    [self addSubview:titleView];
    
}


@end
