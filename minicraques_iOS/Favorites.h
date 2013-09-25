//
//  Favorites.h
//  minicraques_iOS
//
//  Created by Rafael on 9/25/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Favorites : NSObject <UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate>

@property (strong, nonatomic) NSDictionary *json;
@property (strong, nonatomic) NSArray *favoritesMinicraques;
@property NSMutableData *webData;
@property NSURLConnection *con;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *nationality;
@property (strong, nonatomic) NSString *photoURL;

- (id) initWithJSON;

@end
