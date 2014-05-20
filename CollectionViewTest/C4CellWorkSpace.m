//
//  C4CellWorkSpace.m
//  CollectionViewTest
//
//  Created by Slant on 2014-04-07.
//  Copyright (c) 2014 Slant. All rights reserved.
//

#import "C4CellWorkSpace.h"

@interface C4CellWorkSpace ()
@property (nonatomic) C4Shape *shape;
@end

@implementation C4CellWorkSpace

-(void)setupWithSize:(CGSize)size {
    self.canvas.frame = CGRectMake(0, 0, size.width, size.height);
    self.shape = [C4Shape rect:CGRectMake(0, 0, [C4Math randomIntBetweenA:30 andB:50], [C4Math randomIntBetweenA:30 andB:50])];
    [self randomize];
    [self.canvas addSubview:self.shape];
}

-(void)randomize {
    self.shape.animationDuration = 0.0f;
    self.shape.animationOptions = 0;
    CGRect frame = CGRectMake(0, 0, [C4Math randomIntBetweenA:20 andB:40], [C4Math randomIntBetweenA:20 andB:40]);
    if([C4Math randomInt:2]) {
        [self.shape ellipse:frame];
    } else {
        [self.shape rect:frame];
    }
    
    self.shape.center = CGPointMake(self.canvas.width / 2, self.canvas.height / 2);
    
    switch ([C4Math randomInt:3]) {
        case 0:
            self.shape.fillColor = C4GREY;
            break;
        case 1:
            self.shape.fillColor = C4BLUE;
            break;
        case 2:
            self.shape.fillColor = C4RED;
            break;
    }
    
    switch ([C4Math randomInt:3]) {
        case 0:
            self.shape.strokeColor = [C4GREY colorWithAlphaComponent:0.66];
            break;
        case 1:
            self.shape.strokeColor = [C4BLUE colorWithAlphaComponent:0.66];
            break;
        case 2:
            self.shape.strokeColor = [C4RED colorWithAlphaComponent:0.66];
            break;
    }

    self.shape.animationDuration = [C4Math randomIntBetweenA:5 andB:10];
    self.shape.animationOptions = AUTOREVERSE | REPEAT;
    self.shape.rotation += TWO_PI;
}


@end
