//
//  ViewController.m
//  WBDocumentBrowserDemo
//
//  Created by Mr_Lucky on 2018/11/5.
//  Copyright © 2018 wenbo. All rights reserved.
//

#import "ViewController.h"
#import "WBUIDocumentPickerController.h"
#import "WBDocumentBrowserViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    if (indexPath.row == 0) {
        WBUIDocumentPickerController *vc = [WBUIDocumentPickerController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        //官方文档解释文档浏览控制器需设置为窗口根控制器
        WBDocumentBrowserViewController *vc = [WBDocumentBrowserViewController new];
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    }
}

@end
