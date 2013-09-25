//
//  DetailsViewController.m
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import "DetailsViewController.h"
#import "Minicraque.h"
#import "Favorites.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@interface DetailsViewController (){
    NSString *formatURL;
}

@end

@implementation DetailsViewController

@synthesize parseDetail;
@synthesize imageView;
@synthesize minicraque;
@synthesize favButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.favButton.enabled = NO;
        self.favButton.userInteractionEnabled = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    self.favorites = [[Favorites alloc] init];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataFavoritesRetrieved)
                                                 name:@"initWithJSONFavoritesFinishedLoading"
                                               object:nil];
}

- (void) dataFavoritesRetrieved {
    NSLog(@"FAVORITES DATA = %@", [self.favorites.favoritesMinicraques description]);
    
    minicraque = [[Minicraque alloc] initStorage];
    minicraque.name = [self.parseDetail objectForKey:@"name"];
    minicraque.nationality = [self.parseDetail objectForKey:@"nationality"];
    minicraque.photoURL = [self.parseDetail objectForKey:@"photo"];
    
    BOOL hasFav = NO;
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (NSDictionary *nd in self.favorites.favoritesMinicraques) {
        [temp addObject:([nd objectForKey:@"name"])];
    }
    for (NSString *fav in temp){
        NSLog(@"%@ = %@ ?", minicraque.name, fav);
        if ([fav isEqualToString:self.minicraque.name]){
            hasFav = YES;
        }
    }
    
    if (hasFav){
        [self.favButton removeFromSuperview];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"VIEW APPEAR = %@", [self.favorites.favoritesMinicraques description]);
    
    self.nameLabel.text = [self.parseDetail objectForKey:@"name"];
    self.nationalityLabel.text = [self.parseDetail objectForKey:@"nationality"];
    
    formatURL = [NSString stringWithFormat:@"http://127.0.0.1:3000%@",
                           [self.parseDetail objectForKey:@"photo"]];
    NSURL *url = [NSURL URLWithString:formatURL];
    
    NSData *parsePhoto = [NSData dataWithContentsOfURL:url];
    imageView.image = [UIImage imageWithData:parsePhoto];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)favoriteButton:(id)sender {
    NSLog(@"%@", [sender description]);
    NSLog(@"%@", minicraque.name);
    NSLog(@"%@", minicraque.nationality);
    NSLog(@"%@", minicraque.photoURL);
//    NSString *imageRep = [UIImagePNGRepresentation(imageView.image) base64Encoding];
    NSString *imageRep = [UIImageJPEGRepresentation(imageView.image, 0.9) base64Encoding];

//    NSLog(@"%@", imageRep);
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:minicraque.name, @"name",
                                                                        minicraque.nationality, @"nationality",
                                                                                    imageRep, @"photo_data", nil];
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:parameters options:kNilOptions error:&error];
    NSURL *url = [[NSURL alloc] initWithString:@"http://127.0.0.1:3000/favoritos.json"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST" path:@"/favoritos" parameters:parameters];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%d", [postData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Minicraques :D" message:@"Favoritado!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [successAlert show];
        [sender removeFromSuperview];
//        [self.tabBarController.tabBar.items[2] setBadgeValue:[NSString stringWithFormat:@"%i", self.favorites.favoritesMinicraques.count]];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        NSLog(@"[Error]: (%@ %@) %@", [request HTTPMethod], [[request URL] relativePath], error);
    }];
    
    [operation start];
}
@end
