//
//  JLAlertController.m
//  JLAlertController
//
//  Created by TSUNG-LUN LIAO on 2015/5/29.
//  Copyright (c) 2015年 TSUNG-LUN LIAO. All rights reserved.
//

#import "JLAlertController.h"

@interface JLAlertController ()

{
    
    UIView *alertBackView;
    AlertView *alertView;
    
}

@end

@implementation JLAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(callJLAlertActionBlockWithIndex:)
                                                 name:JLALERTACTIONVIEWBETOUCH
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(releaseAlertView)
                                                 name:RELEASEALERTVIEW
                                               object:nil];
    
   
}

- (void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
    alertView.center = self.view.center;
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    [self creatLikeStyleJLAlertControllerStyleAlert];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - JLAlertController Setting
+ (JLAlertController*)alertControllerWithTitle:(NSString *)title withMessage:(NSString *)message withPreferredStyle:(JLAlertControllerStyle)preferredStyle{
  
    JLAlertController *alertController = [[JLAlertController alloc]initWithTitle:title withMessage:message withPreferredStyle:preferredStyle withActionS:nil];
    
    return alertController;
}

+ (JLAlertController*)alertControllerWithTitle:(NSString *)title withMessage:(NSString *)message withPreferredStyle:(JLAlertControllerStyle)preferredStyle withActionS:(NSArray*)actions{
    
    JLAlertController *alertController = [[JLAlertController alloc]initWithTitle:title withMessage:message withPreferredStyle:preferredStyle withActionS:actions];
    
    return alertController;
    
}

- (id)initWithTitle:(NSString *)title withMessage:(NSString *)message withPreferredStyle:(JLAlertControllerStyle)preferredStyle withActionS:(NSArray*)actions{
    
    self = [super init];
    
    _actions    = [[NSMutableArray alloc]init];
    _style      = preferredStyle;
    _alerttitle = title;
    _message    = message;
    
    if (actions) {
        [self addActionWithActionS:actions];
    }

    
    return self;
    
}

- (void)addActionWithAction:(JLAlertAction*)action{
    
    [_actions addObject:action];
    
}

- (void)addActionWithActionS:(NSArray*)actions{
    
    [_actions addObjectsFromArray:actions];
    
}

- (void)show{
    
    if ([_actions count] == 0) {
            return;
        }
    
//    NSLog(@"Current %@",[self currentViewController]);
    
    if ([self isAlertBefore]) {
//        NSLog(@"AllReady Show");
        return;
    }
    
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    
    [[self currentViewController] presentViewController:self animated:NO completion:^{
        //
        
    }];

}

#pragma mark - Draw the AlertView
- (void)creatLikeStyleJLAlertControllerStyleAlert{
    
    [self addAlertBachgroundView];
    
    [self addAlertView];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         //
                         alertView.alpha = 1;
                         alertBackView.alpha   = 0.3;
                         
                     } completion:^(BOOL finished) {
                         //
                     }];

}

- (void)addAlertBachgroundView{
    
    alertBackView = [[UIView alloc] initWithFrame:self.view.frame];
    alertBackView.backgroundColor = [UIColor grayColor];
    alertBackView.alpha = 0;
    alertBackView.center = self.view.center;
    
    [self.view addSubview:alertBackView];

    [alertBackView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *constraintTopMargin = [NSLayoutConstraint constraintWithItem:alertBackView
                                                                         attribute:NSLayoutAttributeTopMargin
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeTopMargin
                                                                        multiplier:1.0
                                                                          constant:0];
    
    NSLayoutConstraint *constraintBottomMargin = [NSLayoutConstraint constraintWithItem:alertBackView
                                                                         attribute:NSLayoutAttributeBottomMargin
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.view
                                                                         attribute:NSLayoutAttributeBottomMargin
                                                                        multiplier:1.0
                                                                          constant:0];
    
    NSLayoutConstraint *constraintRightMargin  = [NSLayoutConstraint constraintWithItem:alertBackView
                                                                              attribute:NSLayoutAttributeRightMargin
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeRightMargin
                                                                             multiplier:1.0
                                                                               constant:16];
    
    NSLayoutConstraint *constraintLeftMargin = [NSLayoutConstraint constraintWithItem:alertBackView
                                                                              attribute:NSLayoutAttributeLeftMargin
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeLeftMargin
                                                                             multiplier:1.0
                                                                               constant:-16];
    
    [self.view addConstraints:@[constraintTopMargin,constraintBottomMargin,constraintRightMargin,constraintLeftMargin]];
    
}

- (void)addAlertView{
    
    alertView = [AlertView creatALertViewWithController:self];
    
    alertView.alpha = 0.9;
    
    [self.view addSubview:alertView];
    
}


#pragma mark - Release Method
- (void)callJLAlertActionBlockWithIndex:(NSNotification*)notification{
    
    NSInteger index = [notification.userInfo[@"index"] integerValue];
    
    [_actions[index] blockback];
    
}

- (void)releaseAlertView{
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         //
                         self.view.alpha = 0;
                         
                     } completion:^(BOOL finished) {
                         //

                         [self dismissViewControllerAnimated:NO completion:^{
                             //
                             
                         }];
                     }];
    
}


- (BOOL)isAlertBefore{
    
    if ([[self currentViewController] isKindOfClass:[JLAlertController class]]) {
        return YES;
    }
    
    return NO;

}


#pragma mark - Find Current Present ViewController
- (UIViewController*) findBestViewController:(UIViewController*)vc {
    
    if (vc.presentedViewController) {
        
        // Return presented view controller
        return [self findBestViewController:vc.presentedViewController];
        
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        
        // Return right hand side
        UISplitViewController* svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        // Return top view
        UINavigationController* svc = (UINavigationController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.topViewController];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        
        // Return visible view
        UITabBarController* svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.selectedViewController];
        else
            return vc;
        
    } else {
        
        // Unknown view controller type, return last child view controller
        return vc;
        
    }
    
}

- (UIViewController*) currentViewController {
    
    // Find best view controller
    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self findBestViewController:viewController];
    
}

@end
