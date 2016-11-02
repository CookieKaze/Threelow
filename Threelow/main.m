//
//  main.m
//  Threelow
//
//  Created by Erin Luu on 2016-11-02.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dice * dice1 = [[Dice alloc]init];
        Dice * dice2 = [[Dice alloc]init];
        Dice * dice3 = [[Dice alloc]init];
        Dice * dice4 = [[Dice alloc]init];
        Dice * dice5 = [[Dice alloc]init];
        
        char input [255];
        
        while(true) {
            NSLog(@"Options: roll");
            fgets(input, 255, stdin);
            NSString * stringInput = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
            
            if ([stringInput isEqualToString:@"roll\n"]) {
                NSString * dice1Output = [dice1 randomize];
                NSLog(@"Dice 1: %@", dice1Output);
                NSString * dice2Output = [dice2 randomize];
                NSLog(@"Dice 2: %@", dice2Output);
                NSString * dice3Output = [dice3 randomize];
                NSLog(@"Dice 3: %@", dice3Output);
                NSString * dice4Output = [dice4 randomize];
                NSLog(@"Dice 4: %@", dice4Output);
                NSString * dice5Output = [dice5 randomize];
                NSLog(@"Dice 5: %@", dice5Output);
            }
        }
    }
    return 0;
}
