//
//  Line.m
//  DrawingLib
//
//  Created by Jesse Rosalia on 2/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Line.h"

@implementation Line

@synthesize start, end, angleFromZero, color;

-(id)init {
    self = [super init];
    if (self != nil) {
        color = kColorBlack; // default color is black
    }
    return self;
}

+(Line *)withPoint:(CGPoint)start andPoint:(CGPoint)end {
    Line * line = [[self alloc]init];
    line.start = start;
    line.end   = end;
    line.angleFromZero = atan2(end.y - start.y, end.x - start.x);
    return line;
}

+(Line *)withStartX:(int)sx andStartY:(int)sy andEndX:(int)ex andEndY:(int)ey {
    Line * line = [[self alloc]init];
    CGPoint start = {sx, sy};
    CGPoint end   = {ex, ey};
    
    line.start = start;
    line.end   = end;
    line.angleFromZero = atan2(ey - sy, ex - sx);
    return line;
}

static bool IntersectsV(CGPoint a1, CGPoint a2, CGPoint b1, CGPoint b2/*, out Vector2 intersection*/);

-(Boolean)intersects:(Line *)l2 {
    return IntersectsV(self.start, self.end, l2.start, l2.end);
}

static bool IntersectsV(CGPoint a1, CGPoint a2, CGPoint b1, CGPoint b2/*, out Vector2 intersection*/) {
    //intersection = Vector2.Zero;
    CGPoint b = {a2.x - a1.x, a2.y - a1.y};
    CGPoint d = {b2.x - b1.x, b2.y - b1.y};
    float bDotDPerp = b.x * d.y - b.y * d.x;
    // if b dot d == 0, it means the lines are parallel so have infinite intersection points
    if (bDotDPerp == 0)
        return false;
    CGPoint c = {b1.x - a1.x, b1.y - a1.y};
    float t = (c.x * d.y - c.y * d.x) / bDotDPerp; 
    if (t < 0 || t > 1)
        return false; 
    float u = (c.x * b.y - c.y * b.x) / bDotDPerp; 
    if (u < 0 || u > 1)
        return false; 
    //intersection = a1 + t * b; 
    return true;
} 

#pragma mark - Drawing

-(void) draw:(CGContextRef)context into:(CGRect) rect {
    CGContextSetLineWidth(context, 5.0);
    
    CGColorRef cgcf = [color getCGColor];
    
    CGContextSetStrokeColorWithColor(context, cgcf);
    
    CGContextMoveToPoint(   context, start.x, start.y);
    CGContextAddLineToPoint(context, end.x,   end.y);
    
    CGContextStrokePath(context);
    CGColorRelease(cgcf);
}
@end
