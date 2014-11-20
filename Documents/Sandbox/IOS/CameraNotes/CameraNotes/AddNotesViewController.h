//
//  AddNotesViewController.h
//  CameraNotes
//
//  Created by Tigran Torgomyan on 8/28/14.
//  Copyright (c) 2014 Ogma Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "UpdateDataDelegate.h"

@interface AddNotesViewController : UIViewController

@property Note *note;
@property (nonatomic, weak)id<UpdateDataDelegate> delegate;

@end
