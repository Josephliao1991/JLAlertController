//
//  SecondViewController.m
//  JLAlertController
//
//  Created by TSUNG-LUN LIAO on 2015/5/29.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "SecondViewController.h"
#import "JLAlertController.h"


@implementation SecondViewController

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];

    
}

- (IBAction)back:(UIStoryboardSegue*)sender{
    
    
}

- (IBAction)showAlert:(id)sender {
    

    [[JLAlertController alertControllerWithTitle:@"JLAlert"
                                     withMessage:@"ActionS Test"
                              withPreferredStyle:JLAlertControllerStyleAlert
                                     withActionS:
      
  @[[JLAlertAction actionWithActionTitle:@"AlertAction1"
                                   style:JLAlertActionStyleDefault
                                 handler:^(JLAlertAction *action)
    {
                                     
        NSLog(@"Action Touch : %@",action.actionTitle);
    
    }],
    
    [JLAlertAction actionWithActionTitle:@"AlertAction2"
                                   style:JLAlertActionStyleDefault
                                 handler:^(JLAlertAction *action)
    {
                                     
        NSLog(@"Action Touch : %@",action.actionTitle);
                                     
    }]]] show];
    
}


@end
