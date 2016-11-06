//
//  main.m
//  Threelow
//
//  Created by Erin Luu on 2016-11-02.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GameController * gc = [[GameController alloc] init];
        while(true) {
            [gc currentStatus];
            NSLog(@"Which dice do you want to hold?");
            NSString * input = [gc getInput:@"num"];
            [gc holdDice:[input intValue]];
            if ([gc.heldDices count] == 5) {
                [gc currentStatus];
                NSLog(@"Game Over! Your final score is: %ld\n\n", (long)gc.heldTotal);
                [gc resetDice];
                [gc roll];
                continue;
            }else{
                [gc currentStatus];
                NSLog(@"Options: roll, hold, reset");
                input = [gc getInput:@"option"];
                if ([input isEqualToString:@"roll"]) {
                    [gc roll];
                    [gc currentStatus];
                }else if ([input isEqualToString:@"reset"]) {
                    [gc resetDice];
                    continue;
                }
            }
        }
    }
    return 0;
}
