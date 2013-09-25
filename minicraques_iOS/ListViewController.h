//
//  ListViewController.h
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Minicraque.h"

@interface ListViewController : UITableViewController

@property (strong, nonatomic) Minicraque *minicraque;
@property (strong, nonatomic) NSArray *tableInflate;

@end
