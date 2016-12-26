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
    [laContext evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"哈哈" reply:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            [sender setTitle:@"验证成功" forState:UIControlStateNormal];
        }else {
            [sender setTitle:@"验证失败" forState:UIControlStateNormal];
        }
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    LAContext *laContext = [[LAContext alloc] init];
    NSError *error = [[NSError alloc] init];
    switch (indexPath.section) {
        case 0: ////evaluatePolicy
        {
            switch (indexPath.row) {
                case 0: //LAPolicyDeviceOwnerAuthentication
                {
                    [laContext evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"哈哈" reply:^(BOOL success, NSError * _Nullable error) {
                        //必须放到主线程成，不然会造成界面卡屏
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self showAlertWithIsSuccess:success];
                        });
                      
                    }];

                }
                    break;
                case 1:
                {
                    [laContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"哈哈" reply:^(BOOL success, NSError * _Nullable error) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self showAlertWithIsSuccess:success];
                        });

                    }];
                }
                    
                    break;
                default:
                    break;
            }
        }
            break;
        case 1:////canEvaluatePolicy
        {
            switch (indexPath.row) {
                case 0:
                {
                    //判断是否支持身份验证
                    [self showAlertWithCanEvaluatePolicy:[laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]];
                }
                    break;
                case 1:
                {
                    //判断是否支持身份验证以及生物验证
                    [self showAlertWithCanEvaluatePolicy:[laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]];
                }
                    
                    break;
                default:
                    break;
            }

        }
            break;
            
        default:
            break;
    }
    
}

- (void)showAlertWithIsSuccess:(BOOL)isSuccess {
    
    NSString *message;
    
    if (isSuccess) {
        message = @"成功";
    }
    else {
        message = @"失败";
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

- (void)showAlertWithCanEvaluatePolicy:(BOOL)canEvaluatePolicy {
    
    NSString *message;
    
    if (canEvaluatePolicy) {
        message = @"支持验证";
    }
    else {
        message = @"不支持验证";
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
