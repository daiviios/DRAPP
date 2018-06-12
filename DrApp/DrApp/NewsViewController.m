//
//  NewsViewController.m
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"

@interface NewsViewController ()
{
    FIRStorageReference *islandRef;
    FIRStorageReference *storageRef;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FIRStorage *storage = [FIRStorage storage];
    
    storageRef = [storage reference];
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-60)];
    self.view.backgroundColor = [UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    newstableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    newstableView.delegate = self;
    newstableView.dataSource = self;
    newstableView.tableFooterView = footer;
    [self.view addSubview:newstableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)atableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)atableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)atableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailViewController * nView = [[NewsDetailViewController alloc] init];
    [self.navigationController pushViewController:nView animated:YES];

}

- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 200;
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(5, 10, self.view.frame.size.width-20, 190 )];
       // backgroundView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
        backgroundView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        backgroundView.layer.cornerRadius = 20.0;
        [cell.contentView addSubview:backgroundView];

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,10,50,50)];
        imageView.backgroundColor = [UIColor redColor];
        imageView.layer.cornerRadius = 25.0f;
        //imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.layer.shadowOffset=CGSizeMake(1.0, 1.0);
        imageView.layer.shadowColor=[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1].CGColor;
        imageView.alpha=25.0f;
        [imageView setImage:[UIImage imageNamed:@"profileImg.jpg"]];

        
        NSString * imgreference = [NSString stringWithFormat:@"Gallery/mpic%d.jpg",(int)indexPath.row];
        
        islandRef = [storageRef child:imgreference];
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        [islandRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData *data, NSError *error){
            if (error != nil) {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                //[imageView setImage:[UIImage imageWithData:data]];
                
            }
        }];
       // imageView.backgroundColor=[UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];
        [backgroundView addSubview:imageView];
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width+5,0,backgroundView.frame.size.width-80, 190)];
        name.text =@"JD(S) leader HD Kumaraswamy met Governor Vajubhai Vala and staked claim to form the government. He also said that his oath-taking ceremony will take place on Monday, May 21, but the date was later shifted as it coincided with the death anniversary of former prime minister Rajiv Gandhi.";
        [name setBackgroundColor:[UIColor clearColor]];
        name.numberOfLines = 0;
        name.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightMedium];
        [backgroundView addSubview:name];
        
        UIImageView *roundindicateImg = [[UIImageView alloc] initWithFrame:CGRectMake(backgroundView.frame.size.width-40,backgroundView.frame.size.height-40,30,30)];
        roundindicateImg.layer.cornerRadius = 30.0/2;
        roundindicateImg.backgroundColor=[UIColor blueColor];
        //[backgroundView addSubview:roundindicateImg];
        
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
