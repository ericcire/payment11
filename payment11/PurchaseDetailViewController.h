//
//  PurchaseDetailViewController.h
//  payment11
//
//  Created by Eric Yu on 18/9/2016.
//  Copyright © 2016 Eric Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PurchasedDetail.h"

@interface PurchaseDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) PurchasedDetail *purchaseDetail;

@end
