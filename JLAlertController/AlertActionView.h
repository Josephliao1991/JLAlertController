//
//  AlertActionView.h
//  CustomizeUIAlerView
//
//  Created by TSUNG-LUN LIAO on 2015/5/29.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLAlertControllerConstant.h"

@interface AlertActionView : UIView

- (id)initWithFrame:(CGRect)frame withActionTitle:(NSString*)actionTitle withIndex:(NSInteger)index withActionImage:(UIImageView*)actionImage;

@end
