//
//  JLAlertAction.m
//  CustomizeUIAlerView
//
//  Created by TSUNG-LUN LIAO on 2015/5/29.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "JLAlertAction.h"

typedef void(^Handler)(JLAlertAction *action);

@interface JLAlertAction ()

{
    Handler handlerBlock;
}


@end

@implementation JLAlertAction

+ (JLAlertAction*)actionWithActionTitle:(NSString *)actionTitle style:(JLAlertActionStyle)style handler:(void(^)(JLAlertAction *action))ablock{
    
    JLAlertAction *action = [[JLAlertAction alloc] initWithActionTitle:actionTitle withStyle:style handler:ablock];
    
    return action;
    
}

- (id)initWithActionTitle:(NSString*)actionTitle withStyle:(JLAlertActionStyle)style handler:(void(^)(JLAlertAction *action))ablock{
    
    self = [super init];
    
    _actionTitle = actionTitle;
    _style       = style;
    
    if (ablock) {
        handlerBlock = ablock;
    }
    
        
    return self;
    
}

- (void)blockback{
    
    if (!handlerBlock) {
        return;
    }
    
    handlerBlock(self);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:RELEASEALERTVIEW object:nil];
    
}

@end
