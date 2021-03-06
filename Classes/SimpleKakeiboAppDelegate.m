//
//  SimpleKakeiboAppDelegate.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SimpleKakeiboAppDelegate.h"
#import "RootViewController.h"
#import "NewViewController.h";
#import "MyAppDataController.h"
#import "MyApplicationData.h"

@implementation SimpleKakeiboAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
  RootViewController* rootViewController;
  rootViewController = (RootViewController*)navigationController.topViewController;

  [[MyAppDataController instance] loadData];
	
  rootViewController.title = APPNAME;

  NSCalendar* cal = [[NSCalendar alloc]
                      initWithCalendarIdentifier:NSGregorianCalendar];
  unsigned int unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
  NSDateComponents *components = [cal components:unitFlags fromDate:[NSDate date]];
  NSInteger year = [components year];
	
  int i;
  int startYear = START_YEAR;
  rootViewController.yearList = [[NSMutableArray alloc] init];
  for (i=year; i >= startYear; i--) {
    [rootViewController.yearList addObject:[NSNumber numberWithInteger:i]];
  }
	
  // Override point for customization after app launch    
  [window addSubview:[navigationController view]];
  [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
  // Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
  [navigationController release];
  [window release];
  [super dealloc];
}


@end

