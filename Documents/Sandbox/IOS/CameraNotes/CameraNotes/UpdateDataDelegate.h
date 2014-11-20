//
//  UpdateDataDelegate.h
//  CameraNotes
//
//  Created by Tigran Torgomyan on 9/2/14.
//  Copyright (c) 2014 Ogma Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UpdateDataDelegate <NSObject>
-(void) reloadModel;
-(void) reloadView;
@end
