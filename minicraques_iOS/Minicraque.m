//
//  Minicraque.m
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import "Minicraque.h"

@interface Minicraque () <UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate>

@end

@implementation Minicraque

@synthesize json;
@synthesize minicraques;
@synthesize favoritesMinicraques;
@synthesize webData;
@synthesize con;

- (id) init{
    self = [self initWithJSON];
    return self;
}

- (id) initWithJSON{
    self = [super init];
    if (self) {
        NSURL *url = [[NSURL alloc] initWithString:@"http://127.0.0.1:3000/craques.json"];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        con = [NSURLConnection connectionWithRequest:request delegate:self];
        self.favoritesMinicraques = nil;
        
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

    NSDictionary *test1 = [json objectForKey:@"craques"];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (NSDictionary *nd in test1) {
        [temp addObject:[nd objectForKey:@"craque"]];
    }
    minicraques = [[NSArray alloc] initWithArray:temp];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"initWithJSONFinishedLoading"
                                                        object:nil];
}

- (id) initStorage {
    self = [super init];
    return self;
}

@end
