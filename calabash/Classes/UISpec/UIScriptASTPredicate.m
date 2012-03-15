//
//  UIScriptASTPredicate.m
//  LPSimpleExample
//
//  Created by Karl Krukow on 01/02/12.
//  Copyright (c) 2012 Trifork. All rights reserved.
//

#import "UIScriptASTPredicate.h"

@implementation UIScriptASTPredicate
@synthesize predicate=_predicate;
@synthesize selector=_selector;

-(id) initWithPredicate:(NSPredicate *)pred selector:(SEL) sel {
    self = [super init];
    if (self) {
        self.predicate = pred;
        self.selector = sel;
    }
    return self;
}

- (NSString*) description {
    return [NSString stringWithFormat:@"UIScriptASTPredicate: %@",[self.predicate description]];
}

- (NSMutableArray*) evalWith:(NSArray*) views direction:(UIScriptASTDirectionType) dir {
    NSMutableArray* res = [NSMutableArray arrayWithCapacity:8];    
    for (UIView* v in views) {
        if ([v isHidden]) continue;
        if ([v respondsToSelector:self.selector])
            if([self.predicate evaluateWithObject:v]) {
                [res addObject:v];
            }
    }
    return res;
}

- (void) dealloc {
    self.predicate=nil;
    [super dealloc];
}

@end