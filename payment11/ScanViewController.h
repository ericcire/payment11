//
//  ScanViewController.h
//  payment11
//
//  Created by Eric Yu on 17/9/2016.
//  Copyright © 2016 Eric Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeReaderDelegate.h"

@interface ScanViewController : UIViewController <QRCodeReaderDelegate>

- (IBAction)scanButtonDidTap:(id)sender;

@end
