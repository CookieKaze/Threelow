//
//  Dice.m
//  Threelow
//
//  Created by Erin Luu on 2016-11-02.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
         _diceFaces = @[@"\u2680", @"\u2681", @"\u2682", @"\u2683", @"\u2684", @"\u2685"];
    }
    return self;
}

- (NSString *) randomize {
    int value = arc4random_uniform(5);
    return self.diceFaces[value];
}

@end
