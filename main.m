//
//  main.m
//  ObjectiveCDev
//
//  Created by Filipe Malachias Resende on 2019-07-29.
//  Copyright © 2019 malachias. All rights reserved.
//

#import <Foundation/Foundation.h>


// prints the prompt message and return the user input
NSString *getUserInput (int maxLenght, NSString *prompt)
{
    if (maxLenght < 1)
    {
        maxLenght = 255;
    }
    NSLog(@"%@ ", prompt);
    char inputChars[maxLenght];
    char *result = fgets(inputChars, maxLenght, stdin);
    if (result != NULL)
    {
        NSMutableString *inputStr = [NSMutableString stringWithUTF8String:inputChars];
        // NSString.stringWithUTF8String(inputChars);
        return [inputStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return NULL;
//    same thing
//    char *hello = "Hello";
//    char h[] = {'h', 'e', 'l' , 'l', 'o'};
}

// C code
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!"); // Obj-C
//        printf("%d\n", 10); // C
//        printf("%s\n", "Enter your name: ");
        
        while (YES)
        {
            NSMutableString *input = [NSMutableString stringWithString: getUserInput(255, @"Enter your name: ")];
            NSString *menu = getUserInput(255, @"\n0 -> Count\n1 -> Uppercase\n2 -> Lowercase\n3 -> Numberize\n4 -> Canadianize\n5 -> Respond\n6 -> De-Space-It\n7 -> Another form to append\n8 -> Delete\n9 -> Exit");
            if ([menu isEqualToString:@"9"])
            {
                NSLog(@"\n ++== Bye! ==++");
                break;
            } else if ([menu isEqualToString:@"1"])
            {
                NSLog(@"\n%@", [input uppercaseString]);
            } else if ([menu isEqualToString:@"2"])
            {
                NSLog(@"\n%@", [input lowercaseString]);
            } else if ([menu isEqualToString:@"3"])
            {
                NSString *a = input;
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                NSNumber *num = [formatter numberFromString:a];
                if (num == nil)
                {
                    NSLog(@"Not convertible to an integer");
                } else
                {
                    NSLog(@"%d", [input intValue]);
                }
            } else if ([menu isEqualToString:@"4"])
            {
                NSLog(@"\n%@%@", input, @", eh?");
            } else if ([menu isEqualToString:@"5"])
            {
                if ([input hasSuffix: @"?"])
                {
                    NSLog(@"\n%s", "I don't know");
                } else if ([input hasSuffix: @"!"])
                {
                    NSLog(@"\n%s", "Whoa, calm down!");
                } else
                {
                    NSLog(@"\n%@", [input capitalizedString]);
                }
            } else if ([menu isEqualToString:@"6"])
            {
                NSLog(@"\n%@", [input stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
            } else if ([menu isEqualToString:@"7"])
            {
                [input appendString: @" "];
                [input appendString: getUserInput(255, @"Enter the text to append at end: ")];
                
                NSLog(@"\n%@ ", [input capitalizedString]);
            } else if ([menu isEqualToString:@"8"])
            {
                [input deleteCharactersInRange: [input rangeOfString: getUserInput(255, @"Enter the text to delete from your input: ")]];
                NSLog(@"\n%@ ", [input capitalizedString]);
            } else if ([menu isEqualToString:@"0"])
            {
                NSUInteger len = [input length];
                NSInteger count = [[input componentsSeparatedByString:@" "] count];
                NSUInteger totalOfSpaces = count - 1;
                NSLog (@"\nString length is %lu, has %lu white spaces and %lu letters.", len, totalOfSpaces, len - totalOfSpaces);
            }
        }
    }
    return 0;
}
