//
//  C4WorkSpace.m
//  CollectionViewTest
//
//  Created by Slant on 2014-04-07.
//

#import "C4Workspace.h"
#import "WorkspaceCell.h"

@interface C4WorkSpace () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSMutableArray *sections;
@end

@implementation C4WorkSpace

-(void)setup {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(145, 100);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.canvas.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];

    self.sections = [@[] mutableCopy];
    for (int i = 0; i < 20; i++) {
        C4CellWorkSpace *workspace = [C4CellWorkSpace new];
        self.sections[i] = workspace;
        [workspace setupWithSize:layout.itemSize];
    }
    
    [self.collectionView registerClass:[WorkspaceCell class]
            forCellWithReuseIdentifier:@"WorkspaceCell"];
    [self.canvas addSubview:self.collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WorkspaceCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"WorkspaceCell"
                                                                      forIndexPath:indexPath];
    cell.workspace = self.sections[[indexPath indexAtPosition:1]];
    
    return cell;
}

@end
