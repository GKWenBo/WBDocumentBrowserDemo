//
//  WBDocumentBrowserViewController.m
//  WBDocumentBrowserDemo
//
//  Created by Mr_Lucky on 2018/11/6.
//  Copyright © 2018 wenbo. All rights reserved.
//

#import "WBDocumentBrowserViewController.h"
#import "WBFileBrowserViewController.h"
#import "WBFileDocument.h"

@interface WBDocumentBrowserViewController () <UIDocumentBrowserViewControllerDelegate>

@end

@implementation WBDocumentBrowserViewController

// MARK:Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    self.allowsDocumentCreation = YES;
    self.allowsPickingMultipleItems = YES;
    self.browserUserInterfaceStyle = UIDocumentBrowserUserInterfaceStyleLight;
}

// MARK:UIDocumentBrowserViewControllerDelegate
- (void)documentBrowser:(UIDocumentBrowserViewController *)controller didRequestDocumentCreationWithHandler:(void (^)(NSURL * _Nullable, UIDocumentBrowserImportMode))importHandler {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"text"
                                         withExtension:@"txt"];
    importHandler(url,UIDocumentBrowserImportModeMove);
}


- (void)documentBrowser:(UIDocumentBrowserViewController *)controller didPickDocumentURLs:(NSArray<NSURL *> *)documentURLs {
    if (documentURLs) {
        [self presentWithURL:documentURLs[0]];
    }
}

- (void)documentBrowser:(UIDocumentBrowserViewController *)controller didImportDocumentAtURL:(NSURL *)sourceURL toDestinationURL:(NSURL *)destinationURL {
    [self presentWithURL:destinationURL];
}

- (void)documentBrowser:(UIDocumentBrowserViewController *)controller failedToImportDocumentAtURL:(NSURL *)documentURL error:(NSError *)error {
    NSLog(@"%s",__func__);
}

// MARK:Private Method
- (void)presentWithURL:(NSURL *)url {
    WBFileDocument *document = [[WBFileDocument alloc]initWithFileURL:url];
    WBFileBrowserViewController *vc = [WBFileBrowserViewController new];
    vc.fileDocument = document;
    [self presentViewController:vc
                       animated:YES
                     completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
