//
//  NotesViewController.h
//  CameraNotes
//
//  Created by Tigran Torgomyan on 8/27/14.
//  Copyright (c) 2014 Ogma Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "UpdateDataDelegate.h"

@interface NotesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UpdateDataDelegate>
@property NSMutableArray* notesArray;
@end
