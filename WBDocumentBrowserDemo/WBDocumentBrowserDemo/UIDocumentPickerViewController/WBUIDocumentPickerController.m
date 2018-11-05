//
//  WBUIDocumentPickerController.m
//  WBDocumentBrowserDemo
//
//  Created by Mr_Lucky on 2018/11/5.
//  Copyright © 2018 wenbo. All rights reserved.
//

#import "WBUIDocumentPickerController.h"
#import "WBiCloudManager.h"

@interface WBUIDocumentPickerController () <UIDocumentPickerDelegate,UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) NSArray *documentTypes;

@end

@implementation WBUIDocumentPickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)presentAction:(id)sender {
    UIDocumentPickerViewController *documentPickerViewController = [[UIDocumentPickerViewController alloc]initWithDocumentTypes:self.documentTypes
                                                                                                                         inMode:UIDocumentPickerModeOpen];
    documentPickerViewController.delegate = self;
    [self presentViewController:documentPickerViewController
                       animated:YES
                     completion:nil];
}

// MARK:UIDocumentPickerDelegate
/*  < iOS 11 API > */
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {
    NSLog(@"%s",__func__);
}

/*  < iOS 8 API > */
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    NSLog(@"%s",__func__);
    
    NSArray *array = [[url absoluteString] componentsSeparatedByString:@"/"];
    NSString *fileName = [array lastObject];
    fileName = [fileName stringByRemovingPercentEncoding];
    
    if ([WBiCloudManager iCloudEnable]) {
        [WBiCloudManager wb_downloadWithDocumentURL:url
                                     completedBlock:^(id obj) {
                                         NSData *data = obj;
                                         NSString *path = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/%@",fileName]];
                                         /*  < 写入沙盒 > */
                                         [data writeToFile:path
                                                atomically:YES];
                                     }];
    }
}

- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {
    NSLog(@"%s",__func__);
}

// MARK:getter
/*  < reference：https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html#//apple_ref/doc/uid/TP40009259-SW1 > */
- (NSArray *)documentTypes {
    if (!_documentTypes) {
        _documentTypes = @[@"public.content",
                           @"public.text",
                           @"public.source-code",
                           @"public.image",
                           @"public.audiovisual-content",
                           @"com.adobe.pdf",
                           @"com.apple.keynote.key",
                           @"com.microsoft.word.doc",
                           @"com.microsoft.excel.xls",
                           @"com.microsoft.powerpoint.ppt",
                           @"public.rtf",
                           @"public.html",
                           @""];
    }
    return _documentTypes;
}

@end
