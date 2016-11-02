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
        NSLog(@"Which dice do you want to hold?");
        int diceNumber;
        scanf("%d", &diceNumber);
        [gc holdDice:diceNumber];
        
        char input [255];
        while(true) {
            NSLog(@"Options: roll, hold, unhold, reset");
            fgets(input, 255, stdin);
            if(input[0] == '\n'){
                fgets(input, 255, stdin);
            }
            NSString * stringInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
            
            if ([stringInput isEqualToString:@"roll\n"]) {
                [gc roll];
                NSLog(@"Which dice do you want to hold?");
                int diceNumber;
                scanf("%d", &diceNumber);
                [gc holdDice:(diceNumber)];
            }else if ([stringInput isEqualToString:@"hold\n"]) {
                NSLog(@"Which dice do you want to hold?");
                int diceNumber;
                scanf("%d", &diceNumber);
                [gc holdDice:(diceNumber)];
            }else if ([stringInput isEqualToString:@"unhold\n"]) {
                NSLog(@"Which dice do you want to unhold?");
                int diceNumber;
                scanf("%d", &diceNumber);
                [gc unholdDice:(diceNumber)];
            }else if ([stringInput isEqualToString:@"reset\n"]) {
                [gc resetDice];
            }
            
        }
    }
    return 0;
}
