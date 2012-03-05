//
//  Line.h
//  DrawingLib
//
//  Created by Jesse Rosalia on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import "Shape.h"
#import "Color.h"

@interface Line : Shape {
    CGPoint start;
    CGPoint end;
    double  angleFromZero;
    Color  *color;
}

@property CGPoint start;
@property CGPoint end;
@property double  angleFromZero;
@property(retain) Color *color;

+(Line *)withPoint:(CGPoint)start andPoint:(CGPoint)end;
+(Line *)withStartX:(int)sx andStartY:(int)sy andEndX:(int)ex andEndY:(int)ey;

-(Boolean)intersects:(Line *)line;

@end
