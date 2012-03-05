//
//  Circle.h
//  DrawingLib
//
//  Created by Jesse Rosalia on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"
#import "Color.h"

@interface Circle : Shape {
@private
    
    CGPoint center;
    Color  *color;
    double  radius;
}

@property         CGPoint  center;
@property(retain) Color   *color;
@property         double   radius;

+(Circle *)circleWithCenter:(CGPoint)center andRadius:(double)radius andColor:(Color *)color;

@end
