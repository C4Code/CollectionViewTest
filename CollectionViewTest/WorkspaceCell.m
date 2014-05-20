//
//  WorkspaceCell.m
//  CollectionViewTest
//
//  Created by Slant on 2014-04-07.
//  Copyright (c) 2014 Slant. All rights reserved.
//

#import "WorkspaceCell.h"
#import "C4CellWorkSpace.h"

@implementation WorkspaceCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)setWorkspace:(C4CellWorkSpace *)workspace {
    if(_workspace != nil) [_workspace.canvas removeFromSuperview];
    _workspace = workspace;
    [self addSubview:self.workspace.canvas];
}

@end
