//
//  ViewController.m
//  touchID
//
//  Created by lyh on 2016/12/25.
//  Copyright © 2016年 lyh. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)touchIDAction:(UIButton *)sender {
    
   LAContext *laContext = [[LAContext alloc] init];
    NSError *error = [[NSError alloc] init];
//    [laContext  canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:(NSError * _Nullable __autoreleasing * _Nullable)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
