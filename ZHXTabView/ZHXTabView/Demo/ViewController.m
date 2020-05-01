//
//  ViewController.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/4/26.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "ViewController.h"
#import "DemoOneController.h"
#import "DemoTwoViewController.h"
#import "DemoThreeViewController.h"


#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView  * _tableView;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"ZHXTabView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView  alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame)
                                                               , CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view  addSubview:_tableView];
    
}
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *  CellIdentifier = @"CellIdentifier";
    UITableViewCell  * cell = [tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"1、Basic Usage Demo";
            return cell;
            break;
        case 1:
            cell.textLabel.text = @"2、Custom Badge Demo";
            return cell;
            break;
        case 2:
            cell.textLabel.text = @"3、Custom Mask Demo";
            return cell;
            break;
        default:
            break;
    }
    
    cell.textLabel.text = @"";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            DemoOneController * vc = [[DemoOneController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 1:
        {
            DemoTwoViewController * vc = [[DemoTwoViewController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 2:
        {
            DemoThreeViewController * vc = [[DemoThreeViewController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        default:
            break;
    }
}

@end
