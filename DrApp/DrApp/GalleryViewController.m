//
//  GalleryViewController.m
//  DrApp
//
//  Created by Nallasivakumar C on 19/05/18.
//  Copyright © 2018 Siva. All rights reserved.
//

#import "GalleryViewController.h"

@interface GalleryViewController ()
{
    FIRStorageReference *islandRef;
    FIRStorageReference *storageRef;
}
@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Gallery";

    // Do any additional setup after loading the view.
    FIRStorage *storage = [FIRStorage storage];
    
    storageRef = [storage reference];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0,44,self.view.frame.size.width,self.view.frame.size.height-49)];
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(self.view.frame.size.width/2-20, 250);
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    flow.minimumInteritemSpacing = 20;
    flow.minimumLineSpacing = 20;
//    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(10,44, self.view.frame.size.width-20, self.view.frame.size.height-10) collectionViewLayout:flow];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.layer.cornerRadius = 20.0;
    NSString * imgreference = [NSString stringWithFormat:@"Gallery/mpic%d.jpg",(int)indexPath.row];

    UIImageView * gImg = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
    gImg.layer.cornerRadius = 20.0;
    islandRef = [storageRef child:imgreference];
    // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
    [islandRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData *data, NSError *error){
        if (error != nil) {
            // Uh-oh, an error occurred!
        } else {
            // Data for "images/island.jpg" is returned
            [gImg setImage:[UIImage imageWithData:data]];
            
        }
    }];
    [cell.contentView addSubview:gImg];
    //cell.backgroundColor=[UIColor colorWithRed:((float)(rand()%255))/255 green:((float)(rand()%255))/255 blue:((float)(rand()%255))/255 alpha:1.];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
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
