//
//  WBFileBrowserViewController.h
//  WBDocumentBrowserDemo
//
//  Created by Mr_Lucky on 2018/11/6.
//  Copyright © 2018 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBFileDocument.h"

NS_ASSUME_NONNULL_BEGIN

@interface WBFileBrowserViewController : UIViewController

@property (nonatomic, strong) WBFileDocument *fileDocument;

@end

NS_ASSUME_NONNULL_END
