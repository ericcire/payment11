//
//  ParentProfileViewController.m
//  payment11
//
//  Created by Eric Yu on 17/9/2016.
//  Copyright © 2016 Eric Yu. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>
#import "ParentProfileViewController.h"
#import "YLProgressBar.h"
#import "HistoryTableViewCell.h"
#import "Constant.h"

@interface ParentProfileViewController ()

@end

@implementation ParentProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self setupViews];
    [self loadProfile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

- (void)setupViews
{
    self.remainLabel.layer.borderWidth = 2;
    self.remainLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self initFlatAnimatedProgressBar];
    
    self.historyTableView.backgroundColor = [UIColor clearColor];
    self.historyTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)refreshUIWithProfile:(Profile*)profile
{
    self.profileTitleLabel.text = [NSString stringWithFormat:@"%@'s wallet", self.profile.username].uppercaseString;
    
    self.remainLabel.text = [NSString stringWithFormat:@"remain: $%@", self.profile.accountBalance];
    
    self.budgetUsedLabel.text = [NSString stringWithFormat:@"$%@", self.profile.budgetUsed];
    
    self.budgetLimitLabel.text = [NSString stringWithFormat:@"out of $%@", self.profile.budgetLimit].uppercaseString;
    
    self.budgetPercentLabel.text = [NSString stringWithFormat:@"used %f%%", [self.profile usedBudgetPercent].floatValue].uppercaseString;
}

- (void)initFlatAnimatedProgressBar
{
    _progressBarFlatAnimated.progressTintColor        = [UIColor colorWithRed:232/255.0f green:132/255.0f blue:12/255.0f alpha:1.0f];
    _progressBarFlatAnimated.type                     = YLProgressBarTypeFlat;
    _progressBarFlatAnimated.stripesOrientation       = YLProgressBarStripesOrientationVertical;
    _progressBarFlatAnimated.stripesDirection         = YLProgressBarStripesDirectionLeft;
    _progressBarFlatAnimated.stripesAnimationVelocity = 1.8f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"history_cell";

    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[HistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }

    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)loadProfile
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = [NSString stringWithFormat:@"%@/?action=one&user_id=%@", API_HOST, @"2"];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        self.profile = [[Profile alloc] initWithDict:responseObject];
        [self refreshUIWithProfile:self.profile];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
