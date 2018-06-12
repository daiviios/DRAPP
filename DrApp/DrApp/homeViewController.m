//
//  ViewController.m
//  DrApp
//
//  Created by Nallasivakumar C on 18/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "homeViewController.h"
#import "ProfileViewController.h"
#import "NewsViewController.h"
#import "MultimediaViewController.h"
#import "ContactViewController.h"
#import "AppointmentsViewController.h"

//COMMIT TEST NALLA//

@interface homeViewController ()
{
    FIRStorageReference *islandRef;
    FIRStorageReference *storageRef;
}
@end

@implementation homeViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    arrModules = [[NSMutableArray alloc] init];
    self.ref = [[FIRDatabase database] reference];
    // Do any additional setup after loading the view, typically from a nib.
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView  * profileImg = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,240)];
    profileImg.layer.cornerRadius = 25.0f;
    FIRStorage *storage = [FIRStorage storage];
    
    storageRef = [storage reference];
    
    // Create a reference to the file you want to download
        islandRef = [storageRef child:@"Main/profileImg.jpg"];
    
    // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
    [islandRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData *data, NSError *error){
        if (error != nil) {
            // Uh-oh, an error occurred!
        } else {
            // Data for "images/island.jpg" is returned
            [profileImg setImage:[UIImage imageWithData:data]];
            
        }
    }];
    [self.view addSubview:profileImg];
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(10,250, self.view.frame.size.width-20, self.view.frame.size.height-310) collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView setShowsVerticalScrollIndicator:NO];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_collectionView];

    
    [[self.ref child:@"modules"]
     observeEventType:FIRDataEventTypeValue
     withBlock:^(FIRDataSnapshot *snapshot) {
          for (NSArray * stArr in snapshot.value) {
             [arrModules addObject:stArr];
         }
         [_collectionView reloadData];
     }withCancelBlock:^(NSError * error){
         NSLog(@"%@",error.description);
     }];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arrModules count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.layer.cornerRadius = 10.0;
    cell.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
    cell.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:71.0/255.0 blue:87.0/255.0 alpha:1.0];
    //cell.backgroundColor=[UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];
    
    cell.layer.cornerRadius = 5.0f;
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    cell.layer.borderWidth = 2.5f;
    [cell.layer setMasksToBounds:YES];
    
    UILabel *itemName = [[UILabel alloc] initWithFrame:CGRectMake(5,cell.contentView.frame.size.height-22,cell.contentView.frame.size.width-10,18)];
    itemName.font = [UIFont fontWithName:@"Futura-Medium" size:15.0f];
    itemName.backgroundColor = [UIColor clearColor];
    itemName.textAlignment = NSTextAlignmentCenter;
    itemName.adjustsFontSizeToFitWidth = YES;
    itemName.textColor = [UIColor whiteColor];
    itemName.text = [[arrModules objectAtIndex:indexPath.row] valueForKey:@"NAME"];
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd"];
    NSString *dateString = [dateFormat stringFromDate:today];
    //NSLog(@"date: %@", dateString);
    
    
    [cell.contentView addSubview:itemName];
    
    UIImageView * iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(14,5,60,60)];
    iconImg.contentMode = UIViewContentModeScaleAspectFit;
    iconImg.backgroundColor = [UIColor clearColor];
    
    
    NSString * imgreference = [NSString stringWithFormat:@"TILE_ICONS//%@.png",[[arrModules objectAtIndex:indexPath.row] valueForKey:@"NAME"]];
    // Create a reference to the file you want to download
    islandRef = [storageRef child:imgreference];
    // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
    [islandRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData *data, NSError *error){
        if (error != nil) {
            // Uh-oh, an error occurred!
        } else {
            // Data for "images/island.jpg" is returned
            [iconImg setImage:[UIImage imageWithData:data]];
            
        }
    }];
    [cell.contentView addSubview:iconImg];
    
    if ([[arrModules objectAtIndex:indexPath.row][@"NAME"]isEqualToString:@"Appointments"]) {
        
        UILabel *presentDate = [[UILabel alloc] initWithFrame:CGRectMake(14,10,60,60)];
        presentDate.backgroundColor = [UIColor clearColor];
        presentDate.font = [UIFont fontWithName:@"Futura-Medium" size:20.0f];
        presentDate.textAlignment = NSTextAlignmentCenter;
        presentDate.text = dateString;
        NSLog(@"DD - %@", dateString);
        presentDate.adjustsFontSizeToFitWidth = YES;
        presentDate.textColor = [UIColor blackColor];
        [cell bringSubviewToFront:presentDate];
        [cell.contentView addSubview:presentDate];
        
    }else{
        
        
    }

    return cell;
}


#pragma mark Collection view layout things

// Layout: Set cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize mElementSize = CGSizeMake(88,88);
    return mElementSize;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 4.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 12.0;
}

// Layout: Set Edges
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0,4,0,4);  // top, left, bottom, right
    // return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ProfileViewController * pView = [[ProfileViewController alloc] init];
        [self.navigationController pushViewController:pView animated:YES];
    }
    else if (indexPath.row == 1)
    {
        NewsViewController * pView = [[NewsViewController alloc] init];
        [self.navigationController pushViewController:pView animated:YES];
    }
    else if (indexPath.row == 2)
    {
        MultimediaViewController * mView = [[MultimediaViewController alloc] init];
        [self.navigationController pushViewController:mView animated:YES];
    }
    else if (indexPath.row == 3)
    {
        ContactViewController * mView = [[ContactViewController alloc] init];
        [self.navigationController pushViewController:mView animated:YES];
    }
    else if (indexPath.row == 4)
    {
        AppointmentsViewController * appointmentView = [[AppointmentsViewController alloc] init];
        [self.navigationController pushViewController:appointmentView animated:YES];
    }
    else if (indexPath.row == 5)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Under Development"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else if (indexPath.row == 6)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Under Development"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else if (indexPath.row == 7)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Under Development"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else if (indexPath.row == 8)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:102"]];

    }
    else if (indexPath.row == 9)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Under Development"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
