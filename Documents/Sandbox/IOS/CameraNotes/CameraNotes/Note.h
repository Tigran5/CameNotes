//
//  Notes.h
//  CameraNotes
//
//  Created by Tigran Torgomyan on 8/28/14.
//  Copyright (c) 2014 Ogma Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject <NSCoding>

@property NSString* contents;
@property NSDate* timestamp;

@property (readonly) NSString *title;

+(Note *) notesWithText:(NSString*)text;

@end
