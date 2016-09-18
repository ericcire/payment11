//
//  PurchasingSummaryTableViewCell.h
//  payment11
//
//  Created by Eric Yu on 18/9/2016.
//  Copyright © 2016 Eric Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchasingSummaryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *summaryDescription;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

@end
