//
//  ViewController.m
//  json+demo
//
//  Created by Omnipresent on 4/2/14.
//  Copyright (c) 2014 Omnipresent. All rights reserved.
//

#import "ViewController.h"
#import "dataclass.h"
#import "mycell.h"
#import "string+randomViewController.h"

#define queue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define url [NSURL URLWithString:@"http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=20/json"]
@interface ViewController ()
{
    NSMutableArray *myarry;
    dataclass *classobj;
    
}

@end

@implementation ViewController
@synthesize tblobj,viewobj;

- (void)viewDidLoad
{
    [super viewDidLoad];
    myarry=[NSMutableArray alloc];
    
    NSURL *myurl = url;
    dispatch_async(queue, ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        myurl];
        [self performSelectorOnMainThread:@selector(fetchdata:) withObject:data waitUntilDone:YES];
    });
}
-(void)fetchdata:(NSData *)responseData
{
    NSDictionary *maindictionary=[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
    
       NSDictionary *feeddir=[maindictionary objectForKey:@"feed"];
    NSLog(@"feed :- %@",feeddir);
    
    
    NSArray *entryary=[feeddir objectForKey:@"entry"];
    NSLog(@"count ar %d",entryary.count);
    
    for (int i=0; i<entryary.count; i++)
    {
        NSDictionary *entryDir=[entryary objectAtIndex:i];
        
        NSDictionary *namerdir=[entryDir objectForKey:@"im:name"];
        NSString *namefield=[namerdir objectForKey:@"label"];
        
        NSDictionary *developerdir=[entryDir objectForKey:@"im:artist"];
        NSString *devloperfield=[developerdir objectForKey:@"label"];
        
        NSDictionary *pricedir=[entryDir objectForKey:@"im:price"];
        NSString *pricefield=[pricedir objectForKey:@"label"];
        
        NSArray *imageary=[entryDir objectForKey:@"im:image"];
        NSDictionary *imagedir=[imageary objectAtIndex:0];
        NSString *imagefield=[imagedir objectForKey:@"label"];
        
        NSDictionary *summaryrdir=[entryDir objectForKey:@"summary"];
        NSString *summaryfield=[summaryrdir objectForKey:@"label"];
        

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
