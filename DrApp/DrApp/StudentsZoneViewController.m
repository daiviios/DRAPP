//
//  StudentsZoneViewController.m
//  DrApp
//
//  Created by Straxis Red on 25/06/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "StudentsZoneViewController.h"

@interface StudentsZoneViewController ()
{
    FIRStorageReference *islandRef;
    FIRStorageReference *storageRef;
}
@end

@implementation StudentsZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"StudentsZone";

    studentsListArray = [[NSMutableArray alloc]init];
    self.ref = [[FIRDatabase database] reference];

    FIRStorage *storage = [FIRStorage storage];
    storageRef = [storage reference];
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,44,self.view.frame.size.width,self.view.frame.size.height-49)];
    self.view.backgroundColor = [UIColor whiteColor];
     UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
     studentsList = [[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
     studentsList.delegate = self;
     studentsList.dataSource = self;
     studentsList.tableFooterView = footer;
     [self.view addSubview:studentsList];
    
    [[self.ref child:@"StudentsInfo"]
     observeEventType:FIRDataEventTypeValue
     withBlock:^(FIRDataSnapshot *snapshot) {
         for (NSArray * stArr in snapshot.value) {
             [studentsListArray addObject:stArr];
             NSLog(@"LOG - %@",[studentsListArray valueForKey:@"Name"]);
         }
         [studentsList reloadData];
     }withCancelBlock:^(NSError * error){
         NSLog(@"%@",error.description);
     }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)atableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)atableView numberOfRowsInSection:(NSInteger)section
{
    return [studentsListArray count];
}
- (void)tableView:(UITableView *)atableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
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

        UIImageView *accessoryView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
        accessoryView.image = [accessoryView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [accessoryView setTintColor:[UIColor colorWithRed:255.0/255.0 green:71.0/255.0 blue:87.0/255.0 alpha:1.0]];
        [accessoryView setImage:[UIImage imageNamed:@"arrow.png"]];
        [cell setAccessoryView:accessoryView];
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width-20, 100 )];
        // backgroundView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];
        backgroundView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        backgroundView.layer.cornerRadius = 20.0;
        [cell.contentView addSubview:backgroundView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,5,80,80)];
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
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width+10,0,backgroundView.frame.size.width-100, 40)];
        name.text =[studentsListArray objectAtIndex:indexPath.row][@"Name"];
        name.font = [UIFont fontWithName:@"Avenir-Heavy" size:20];
        name.numberOfLines = 0;
        [backgroundView addSubview:name];
        
        UILabel *descriptionLbl = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width+10,40,backgroundView.frame.size.width-100, 40)];
        descriptionLbl.text =[studentsListArray objectAtIndex:indexPath.row][@"Name"];
        descriptionLbl.font = [UIFont fontWithName:@"Avenir-Light" size:15];
        descriptionLbl.textColor = [UIColor darkGrayColor];
        descriptionLbl.numberOfLines = 0;
        [backgroundView addSubview:descriptionLbl];
        
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
