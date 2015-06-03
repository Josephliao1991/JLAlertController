//
//  ViewController.m
//  JLAlertController
//
//  Created by TSUNG-LUN LIAO on 2015/5/29.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "ViewController.h"
#import "JLAlertController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(UIButton *)sender {

    [self show];
}

- (void)show{
    
    JLAlertController *alertContoller = [JLAlertController alertControllerWithTitle:@"JLAlert"
                                                                        withMessage:@"AAAAAAAAAAAAAAAAAA \n BBBBBBBBBBBBB"
                                                                 withPreferredStyle:JLAlertControllerStyleAlert];
    
    JLAlertAction *action1 = [JLAlertAction actionWithActionTitle:@"AlertAction 1" style:JLAlertActionStyleDefault handler:^(JLAlertAction *action) {
        //
        NSLog(@"Action Touch : %@",action.actionTitle);
        
    }];
    
    JLAlertAction *action2 = [JLAlertAction actionWithActionTitle:@"AlertAction 2" style:JLAlertActionStyleDefault handler:^(JLAlertAction *action) {
        //
        NSLog(@"Action Touch : %@",action.actionTitle);
        
    }];
    
    JLAlertAction *action3 = [JLAlertAction actionWithActionTitle:@"AlertAction 3" style:JLAlertActionStyleDefault handler:^(JLAlertAction *action) {
        //
        NSLog(@"Action Touch : %@",action.actionTitle);
        
    }];

    
    JLAlertAction *action4 = [JLAlertAction actionWithActionTitle:@"AlertAction 4" style:JLAlertActionStyleDefault handler:^(JLAlertAction *action) {
        //
        NSLog(@"Action Touch : %@",action.actionTitle);
        
    }];

    [alertContoller addActionWithActionS:@[action1,action2,action3,action4]];
    
    [alertContoller setAlertImageName:@"Capula.png"];
    
    [alertContoller show];
    
    
}

@end
