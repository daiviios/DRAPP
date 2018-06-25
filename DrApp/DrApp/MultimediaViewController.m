//
//  MultimediaViewController.m
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "MultimediaViewController.h"
#import "VideoViewController.h"
#import "GalleryViewController.h"

@interface MultimediaViewController ()

@end

@implementation MultimediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Multimedia";

    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-60)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor blackColor];

    //self.view.backgroundColor = [UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];

    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(10, 60, self.view.frame.size.width-20, 100)];
    imageView.image = [UIImage imageNamed:@"multiLogo.png"];
    imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:imageView];
    
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    mMediatableView = [[UITableView alloc] initWithFrame:CGRectMake(0,200,self.view.frame.size.width, self.view.frame.size.height-100)];
    mMediatableView.delegate = self;
    mMediatableView.dataSource = self;
    mMediatableView.tableFooterView = footer;
    [self.view addSubview:mMediatableView];
    
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)atableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)atableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (void)tableView:(UITableView *)atableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        VideoViewController * nView = [[VideoViewController alloc] init];
        [self.navigationController pushViewController:nView animated:YES];
    }
    else
    {
        GalleryViewController * nView = [[GalleryViewController alloc] init];
        [self.navigationController pushViewController:nView animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 65;
}

- (UITableViewCell*)tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    long section = (long)indexPath.section;
    long row = (long)indexPath.row;
    
    NSString *identifier = [NSString stringWithFormat:@"myidentifier-%ld-%ld",section,row];
    UITableViewCell *cell = [atableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,5,72,62)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.layer.shadowOffset=CGSizeMake(1.0, 1.0);
        imageView.layer.shadowColor=[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1].CGColor;
        imageView.alpha=25.0f;
        
        if (indexPath.row == 0) {
            imageView.image = [UIImage imageNamed:@"youtubeIcon.png"];
        }else if (indexPath.row == 1){
            imageView.image = [UIImage imageNamed:@"picsGallery.png"];
        }
        //imageView.backgroundColor=[UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];
        [cell.contentView addSubview:imageView];
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width+5,5,self.view.frame.size.width-80, 63)];
        name.text =(indexPath.row == 0)?@"YOUTUBE":@"PICS GALLERY";
        [name setBackgroundColor:[UIColor clearColor]];
        name.textAlignment = 0;
        name.font = [UIFont fontWithName:@"Futura-Medium" size:15.0f];
        name.numberOfLines = 0;
        [cell.contentView addSubview:name];
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
