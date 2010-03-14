//
//  RootViewController.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#define START_YEAR (2010);


#import "MyAppDataController.h"
#import "NodeViewController.h"

@interface RootViewController : NodeViewController {
	NSMutableArray* yearList;
	IBOutlet UILabel* headerLabel;
}

@property (nonatomic, retain) NSMutableArray* yearList;

-(NSArray*)monthList;

@end
