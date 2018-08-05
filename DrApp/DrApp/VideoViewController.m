//
//  VideoViewController.m
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Youtube";
    videoArray = [[NSMutableArray alloc] init];
 self.ref = [[FIRDatabase database] reference];
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,44,self.view.frame.size.width,self.view.frame.size.height-49)];
    self.view.backgroundColor = [UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,44,self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 30)];
    tableView.tableFooterView = footer;
    [self.view addSubview:tableView];
    
    [[self.ref child:@"Youtube"]
     observeEventType:FIRDataEventTypeValue
     withBlock:^(FIRDataSnapshot *snapshot) {
         for (NSArray * stArr in snapshot.value) {
             [videoArray addObject:stArr];
             NSLog(@"Video%@",videoArray);
             
         }
         [tableView reloadData];
     }withCancelBlock:^(NSError * error){
         NSLog(@" dfsd %@",error.description);
     }];
 
}

#pragma mark  tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)atableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)atableView numberOfRowsInSection:(NSInteger)section
{
    return [videoArray count];
}

- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    long section = (long)indexPath.section;
    long row = (long)indexPath.row;
    
    NSString *identifier = [NSString stringWithFormat:@"myidentifier-%ld-%ld",section,row];
    UITableViewCell *cell = [atableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        /*UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,5,self.view.frame.size.width-10,210)];
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.layer.shadowOffset=CGSizeMake(1.0, 1.0);
        imageView.layer.shadowColor=[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1].CGColor;
        imageView.tag = 1201;
        imageView.backgroundColor=[UIColor blackColor];
        [cell.contentView addSubview:imageView];
        */
        UIWebView * videoView = [[UIWebView alloc] init];
        videoView.frame = CGRectMake(5, 5, self.view.frame.size.width-10, 210);
        videoView.delegate= self;
        videoView.tag = 1201;
        videoView.scrollView.scrollEnabled =  NO;
        videoView.scrollView.bounces = NO;
        [videoView setBackgroundColor:[UIColor clearColor]];       
        [cell.contentView addSubview:videoView];
        
        UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(15,videoView.frame.origin.y+videoView.frame.size.height+5,self.view.frame.size.width-10, 70)];
        [titleLbl setBackgroundColor:[UIColor clearColor]];
        titleLbl.textAlignment = 0;
        titleLbl.tag = 1301;
        titleLbl.font = [UIFont fontWithName:@"Futura-Medium" size:15.0f];
        titleLbl.numberOfLines = 0;
        [cell.contentView addSubview:titleLbl];
    }
    
    UILabel * vlbl = (UILabel *)[cell viewWithTag:1301];
    vlbl.text = [[videoArray valueForKey:@"title"] objectAtIndex:indexPath.row] ;
    
    
    NSString * videoID = [[videoArray valueForKey:@"videoID"] objectAtIndex:indexPath.row];
    UIWebView * webView = (UIWebView *)[cell viewWithTag:1201];
    NSString *htmlString = [NSString stringWithFormat:@"<html><head>\
                            <meta name = \"viewport\" content = \"initial-scale = 40.0, user-scalable = no, width = %f\"/></head>\
                            <body style=\"background:#FFF;margin-top10px;margin-left:10px\">\
                            <div><object width=\"%f\" height=\"210\">\
                            <param name=\"movie\" value=\"http://www.youtube.com/v/%@&f=gdata_videos\"></param>\
                            <param name=\"wmode\" value=\"transparent\"></param>\
                            <embed src=\"http://www.youtube.com/v/%@&f=gdata_videos\"\
                            type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"%f\" height=\"210\"></embed>\
                            </object></div></body></html>",self.view.frame.size.width-10,self.view.frame.size.width-10,videoID,videoID,self.view.frame.size.width-10 ];
    [webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://www.youtube.com"]];

//    UIImageView * vImg = (UIImageView *)[cell viewWithTag:1201];
//    dispatch_async(dispatch_get_global_queue(0,0), ^{
//        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[videoArray valueForKey:@"thumbnail_url"] objectAtIndex:indexPath.row]]];
//        if ( data == nil )
//            return;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // WARNING: is the cell still using the same data by this point??
//            vImg.image = [UIImage imageWithData: data];
//        });
//    });
//
    
    return cell;
}

- (void)tableView:(UITableView *)atableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboa  rd-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
