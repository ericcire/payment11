//
//  ParentProfileViewController.h
//  payment11
//
//  Created by Eric Yu on 17/9/2016.
//  Copyright © 2016 Eric Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@class YLProgressBar;

@interface ParentProfileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Profile *profile;

@property (weak, nonatomic) IBOutlet UILabel *profileTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainLabel;
@property (weak, nonatomic) IBOutlet UILabel *budgetUsedLabel;
@property (weak, nonatomic) IBOutlet UILabel *budgetLimitLabel;
@property (nonatomic, strong) IBOutlet YLProgressBar *progressBarFlatAnimated;
@property (weak, nonatomic) IBOutlet UILabel *budgetPercentLabel;
@property (weak, nonatomic) IBOutlet UITableView *historyTableView;


@end

