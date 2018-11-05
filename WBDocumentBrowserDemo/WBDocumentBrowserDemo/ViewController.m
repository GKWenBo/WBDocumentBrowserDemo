//
//  ViewController.m
//  WBDocumentBrowserDemo
//
//  Created by Mr_Lucky on 2018/11/5.
//  Copyright © 2018 wenbo. All rights reserved.
//

#import "ViewController.h"
#import "WBUIDocumentPickerController.h"

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
    }
}

@end
