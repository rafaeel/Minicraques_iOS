//
//  FavoritesViewController.h
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorites.h"

@interface FavoritesViewController : UITableViewController

@property (strong, nonatomic) NSArray *tableInflate;
@property (strong, nonatomic) Favorites *favorites;

@end
