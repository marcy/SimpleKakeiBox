//
//  ItemlistViewController.h
//  SimpleKakeibo
//
//  Created by masashi on 09/11/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NodeViewController.h"

@interface ItemlistViewController : NodeViewController {
  IBOutlet UILabel* headerLabel;
  NSString* listtype;
  NSMutableArray* items;
  NSInteger year;
  NSInteger month;
  NSString* category;
}

@property (nonatomic, retain) NSString* listtype;
@property (nonatomic, retain) NSMutableArray* items;
@property NSInteger year;
@property NSInteger month;
@property (nonatomic, retain) NSString* category;

-(void)dataReload;

@end
