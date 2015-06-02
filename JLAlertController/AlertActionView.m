//
//  AlertActionView.m
//  CustomizeUIAlerView
//
//  Created by TSUNG-LUN LIAO on 2015/5/29.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "AlertActionView.h"

@interface AlertActionView ()

@property (nonatomic, assign) NSInteger     index;
@property (nonatomic, strong) UILabel       *actionTitle;
@property (nonatomic, strong) UIImageView   *actionImage;

@end

@implementation AlertActionView

- (id)initWithFrame:(CGRect)frame withActionTitle:(NSString*)actionTitle withIndex:(NSInteger)index withActionImage:(UIImageView*)actionImage{
    
    self = [super initWithFrame:frame];
    
    if (actionImage) {
        
        _actionImage = actionImage;
        [self addSubview:actionImage];
        
    }
    
    _actionTitle = [[UILabel alloc]initWithFrame:frame];
    _actionTitle.text = actionTitle;
    _actionTitle.textColor = [UIColor grayColor];
    _actionTitle.center = self.center;
    
    [self addSubview:_actionTitle];
    
    [_actionTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint;
    constraint= [NSLayoutConstraint constraintWithItem:_actionTitle
                                             attribute:NSLayoutAttributeCenterX
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self
                                             attribute:NSLayoutAttributeCenterX
                                            multiplier:1.0
                                              constant:0];
    
    [self addConstraint:constraint];
    
    constraint= [NSLayoutConstraint constraintWithItem:_actionTitle
                                             attribute:NSLayoutAttributeCenterY
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self
                                             attribute:NSLayoutAttributeCenterY
                                            multiplier:1.0
                                              constant:0];
    [self addConstraint:constraint];
    
    
    _index = index;
    
    self.backgroundColor = [UIColor redColor];
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //Notification Use NotificationCenter
    [[NSNotificationCenter defaultCenter] postNotificationName:JLALERTACTIONVIEWBETOUCH
                                                        object:nil
                                                      userInfo:@{@"index":[NSNumber numberWithInteger:_index]}];
    
}



@end
