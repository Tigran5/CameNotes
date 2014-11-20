//
//  Notes.m
//  CameraNotes
//
//  Created by Tigran Torgomyan on 8/28/14.
//  Copyright (c) 2014 Ogma Inc. All rights reserved.
//

#import "Note.h"

@implementation Note

+(Note *)notesWithText:(NSString *)text{
    Note *note = [[Note alloc] init];
    note.contents = text;
    note.timestamp = [[NSDate alloc] init];
    
    return note;
}

-(NSString *)title {
    NSArray *lines = [self.contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return lines[0];
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.contents forKey:@"contents"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.contents = [aDecoder decodeObjectForKey:@"contents"];
    }
    return self;
}

@end
