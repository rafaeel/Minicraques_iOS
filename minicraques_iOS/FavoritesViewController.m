//
//  FavoritesViewController.m
//  minicraques_iOS
//
//  Created by Rafael on 9/18/13.
//  Copyright (c) 2013 Rafael. All rights reserved.
//

#import "FavoritesViewController.h"
#import "Favorites.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

@synthesize tableInflate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void) viewWillAppear:(BOOL)animated {
    self.favorites = [[Favorites alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataRetrieved)
                                                 name:@"initWithJSONFavoritesFinishedLoading"
                                               object:nil];
}

- (void) dataRetrieved {
    NSLog(@"DATA RETRIEVED METHOD");
    tableInflate = [[NSArray alloc] initWithArray:self.favorites.favoritesMinicraques];
    NSLog(@"TABLE INFLATE = %@", tableInflate);
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.favorites.favoritesMinicraques.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[tableInflate objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
