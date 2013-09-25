//
//  Favorites.m
//  minicraques_iOS
//
//  Created by Rafael on 9/25/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import "Favorites.h"

@implementation Favorites

//static NSArray *arrayVerif;
//+ (void) initialize{
//    [super initialize];
//    arrayVerif = [[NSArray alloc] init];
//}

//+ (NSArray *)returnArray {
//    if (!arrayVerif)
//        arrayVerif = [[NSArray alloc] init];
//    
//    return arrayVerif;
//}

@synthesize json;
@synthesize favoritesMinicraques;
@synthesize webData;
@synthesize con;

- (id) init {
    self = [self initWithJSON];
    return self;
}

- (id) initWithJSON{
    self = [super init];
    if (self) {
        NSURL *url = [[NSURL alloc] initWithString:@"http://127.0.0.1:3000/favoritos.json"];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        con = [NSURLConnection connectionWithRequest:request delegate:self];
        
        if (con) {
            webData = [[NSMutableData alloc]init];
        }
        
    }
    return self;
}

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"FAILED");
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    json = [NSJSONSerialization JSONObjectWithData:webData options:0 error:nil];
    
    NSDictionary *jsonSplit = [json objectForKey:@"favoritos"];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (NSDictionary *nd in jsonSplit) {
        [temp addObject:[nd objectForKey:@"favorito"]];
    }
    favoritesMinicraques = [[NSArray alloc] initWithArray:temp];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"initWithJSONFavoritesFinishedLoading"
                                                        object:nil];
}

@end
