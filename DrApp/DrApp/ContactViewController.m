//
//  ContactViewController.m
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "ContactViewController.h"
#import "AppDelegate.h"
@interface ContactViewController ()

@end

@implementation ContactViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"Contact";

    ref = [[FIRDatabase database] reference];
    arrdetails = [[NSMutableArray alloc] init];
    innerArray = [[NSMutableArray alloc] init];
    dictdetails = [[NSDictionary alloc] init];
    
    detailsRef = [[[ref child:@"modules"] child:@"3"] child:@"Details"];
    
    [detailsRef
     observeEventType:FIRDataEventTypeValue
     withBlock:^(FIRDataSnapshot *snapshot) {
         
         dictdetails =snapshot.value;
         
         [arrdetails addObject:dictdetails];
         
         [self updateData];
         
     }withCancelBlock:^(NSError * error){
         NSLog(@"%@",error.description);
     }];
}

- (void)updateData
{
    // Scroll View
    
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10.0f, self.view.frame.size.width, self.view.frame.size.height)];
    scroll.backgroundColor=[UIColor clearColor];
    scroll.delegate=self;
    scroll.scrollEnabled = YES;
    scroll.pagingEnabled = YES;
    scroll.bounces = NO;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [scroll setContentSize:CGSizeMake(scroll.frame.size.width*3, scroll.frame.size.height-20.0f)];
    
    // page control
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-36, self.view.frame.size.width, 36)];
    pageControl.backgroundColor=[UIColor clearColor];
    pageControl.tintColor = [UIColor blackColor];
    pageControl.numberOfPages=3;
    [pageControl addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
    
    for(int i=0;i<=3;i++)
    {
        
        PagingView = [[UIView alloc] initWithFrame:CGRectMake(i*scroll.frame.size.width, 0, scroll.frame.size.width, scroll.frame.size.height)];
        PagingView.tag = i;
        PagingView.backgroundColor = [UIColor whiteColor];
        [scroll addSubview:PagingView];
        
        contactView = [[UIView alloc] initWithFrame:CGRectMake(15.0f, 20.0f, PagingView.frame.size.width-30.0f, PagingView.frame.size.height - 50.0f)];
        UIGraphicsBeginImageContext(contactView.frame.size);
        [[UIImage imageNamed:@"appointmentBg.png"] drawInRect:contactView.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        contactView.backgroundColor = [UIColor colorWithPatternImage:image];
        contactView.layer.cornerRadius = 25.0f;
        contactView.tag = 101;
        [PagingView addSubview:contactView];
        CGFloat yAxis = 0;
        UILabel * contactName = [[UILabel alloc] initWithFrame:CGRectMake(contactView.frame.origin.x+10,contactView.frame.origin.y+10,contactView.frame.size.width-20,40.f)];
        contactName.textAlignment = NSTextAlignmentLeft;
        contactName.numberOfLines = 0;
        contactName.tag = 102;
        contactName.textColor = [UIColor whiteColor];
        contactName.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
        contactName.text = [[arrdetails objectAtIndex:0] valueForKey:@"Name "];//@"IMS and SUM Hospital";
        [PagingView addSubview:contactName];
        
        yAxis = contactName.frame.origin.y+contactName.frame.size.height ;
        
        UILabel * contactAddress = [[UILabel alloc] initWithFrame:CGRectMake(contactView.frame.origin.x+10,yAxis,contactView.frame.size.width-20,100.0f)];
        contactAddress.textAlignment = NSTextAlignmentLeft;
        contactAddress.numberOfLines = 0;
        contactAddress.tag = 103;
        contactAddress.textColor = [UIColor whiteColor];
        contactAddress.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightMedium];
        contactAddress.text = [[arrdetails objectAtIndex:0] valueForKey:@"Address"];//@"Bhubaneswar, Odisha\nKalinga Nagar, Khandagiri, Near Kalinga Studio, Near SOA University, Bhubaneswar - 751003, Odisha";
        [PagingView addSubview:contactAddress];
        
        yAxis = contactAddress.frame.origin.y+contactAddress.frame.size.height;
        
       
        NSArray *statusItems = [[NSArray alloc] initWithObjects:@"Directory",@"Timing", nil];
        segmentedControl = [[UISegmentedControl alloc] initWithItems:statusItems];
        segmentedControl.segmentedControlStyle=UISegmentedControlStyleBar;
        segmentedControl.selectedSegmentIndex = 0;
        segmentedControl.tag = i;
        [segmentedControl setTintColor:[UIColor colorWithRed:255.0/255.0 green:71.0/255.0 blue:87.0/255.0 alpha:1.0]];
        [segmentedControl addTarget:self action:@selector(segmentBarClicked:) forControlEvents:UIControlEventValueChanged];
        [segmentedControl setFrame:CGRectMake(contactView.frame.origin.x,yAxis+5.0f, contactView.frame.size.width, 60.0f)];
        [PagingView addSubview:segmentedControl];
        
        
        yAxis = segmentedControl.frame.origin.y+segmentedControl.frame.size.height;
        
        UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,contactView.frame.size.width,70)];
        headerView.backgroundColor = [UIColor clearColor];
        contactAddress.tag = 104;
        [PagingView addSubview:headerView];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10,10,contactView.frame.size.width-20,60)];
        [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"headerRow.png"]]];
        [headerView addSubview:imgView];
        
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,contactView.frame.size.width,70)];
        headerLabel.text = @"Directory";
        headerLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightMedium];
        headerLabel.textColor = [UIColor whiteColor];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        [headerView addSubview:headerLabel];
        
        

        contactTblView = [[UITableView alloc] initWithFrame:CGRectMake(contactView.frame.origin.x,yAxis,contactView.frame.size.width,contactView.frame.size.height - 85) style:UITableViewStylePlain];
        contactTblView.rowHeight = 60;
        contactTblView.tag = 105;
        contactTblView.backgroundColor = [UIColor clearColor];
        contactTblView.separatorColor = [UIColor clearColor];
        contactTblView.delegate = self;
        contactTblView.dataSource = self;
        [PagingView addSubview:contactTblView];
        contactTblView.tableHeaderView = headerView;
    }
    
    for (int i = 0; i<[[[arrdetails objectAtIndex:0] valueForKey:@"Directory"] count ]; i++) {
        [innerArray addObject:[[[arrdetails objectAtIndex:0] valueForKey:@"Directory"] objectAtIndex:i]];
    }
    [contactTblView reloadData];

    [self.view addSubview:scroll];
    
    [self.view addSubview:pageControl];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-60)];
    self.view.backgroundColor=[UIColor whiteColor];

}

-(void)segmentBarClicked:(id)sender{
    
    if([sender selectedSegmentIndex]==0)
    {
        for (UIView * i in scroll.subviews) {
            if (i.tag == [sender tag])
            {
                
                UITableView * stable = (UITableView *)[i viewWithTag:105];
                for (UIView * j in stable.tableHeaderView.subviews) {
                    if([j isKindOfClass:[UILabel class]])
                    {
                        UILabel * slabel = (UILabel *)j;
                        slabel.text =@"Directory";
                    }
                }
                [innerArray removeAllObjects];

                for (int i = 0; i<[[[arrdetails objectAtIndex:0] valueForKey:@"Directory"] count ]; i++) {
                    [innerArray addObject:[[[arrdetails objectAtIndex:0] valueForKey:@"Directory"] objectAtIndex:i]];
                }
                [stable reloadData];
            }
        }
    }
    else
    {
        
        for (UIView * i in scroll.subviews) {
            if (i.tag == [sender tag])
            {
                
                UITableView * stable = (UITableView *)[i viewWithTag:105];
                for (UIView * j in stable.tableHeaderView.subviews) {
                    if([j isKindOfClass:[UILabel class]])
                    {
                        UILabel * slabel = (UILabel *)j;
                        slabel.text =@"Timing";
                    }
                }
                [innerArray removeAllObjects];
                for (int i = 0; i<[[[arrdetails objectAtIndex:0] valueForKey:@"Timing"] count ]; i++) {
                    [innerArray addObject:[[[arrdetails objectAtIndex:0] valueForKey:@"Timing"] objectAtIndex:i]];
                }
                //timingStr =@"11:30PM - 1:30PM";
                [stable reloadData];
            }
        }
       
    }
}
//-(void)timeBtnClick:(UIButton *)sender
//{
//
//    sender.backgroundColor= [UIColor lightTextColor];
//
//
//}
//
//-(void)callBtnClick:(UIButton *)sender
//{
//    sender.backgroundColor= [UIColor lightTextColor];
//
//}

#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)atableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)atableView numberOfRowsInSection:(NSInteger)section
{
    return [innerArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)atableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSMutableDictionary *contact = [_contacts objectAtIndex:indexPath.row];
    NSString *identifier = [NSString stringWithFormat:@"identifier-%d-%d",(int)indexPath.section,(int)indexPath.row];
    UITableViewCell *cell = [atableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessibilityTraits = UIAccessibilityTraitSelected;
        cell.backgroundColor = [UIColor clearColor];
        if(indexPath.row  == [innerArray count]-1)
        {
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,0,contactView.frame.size.width-20,60) byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(8.0, 8.0)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = CGRectMake(10,0,contactView.frame.size.width-20,60);
            maskLayer.path = maskPath.CGPath;
            cell.layer.mask = maskLayer;
            cell.layer.borderColor = [UIColor whiteColor].CGColor;
            cell.layer.borderWidth = 1.0f;
            
        }
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = CGRectMake(10,0,contactView.frame.size.width -20,60);
        gradient.colors = [NSArray arrayWithObjects: (id)[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor,                           (id)[UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1].CGColor,                           (id)[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1].CGColor,                           (id)[UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1].CGColor,nil];
        gradient.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.49],[NSNumber numberWithFloat:0.51],[NSNumber numberWithFloat:1.0],nil];        [cell.layer insertSublayer:gradient atIndex:0];
        UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(20,12,37,37)];
        [iconImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"callIcon.png"]]];
        [cell.contentView addSubview:iconImage];
        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(70,15 ,contactView.frame.size.width-80 ,28)];
        lblTitle.tag = 1001;
        [cell.contentView addSubview:lblTitle];
        
    }
    
    UILabel * titleStr = (UILabel *)[cell viewWithTag:1001];
    titleStr.text = [NSString stringWithFormat:@"%@",[innerArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}
- (void)tableView:(UITableView *)atableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



- (void)scrollViewDidScroll:(UIScrollView *)_scrollView{
    
    CGFloat viewWidth = _scrollView.frame.size.width;
    // content offset - tells by how much the scroll view has scrolled.
    
    int pageNumber = floor((_scrollView.contentOffset.x - viewWidth/50) / viewWidth) +1;
    
    pageControl.currentPage=pageNumber;
    
}

- (void)pageChanged {
    
    int pageNumber = (int)pageControl.currentPage;
    
    CGRect frame = scroll.frame;
    frame.origin.x = frame.size.width*pageNumber;
    frame.origin.y=50.0f;
    
    [scroll scrollRectToVisible:frame animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] setSelectedId:0];
    
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

