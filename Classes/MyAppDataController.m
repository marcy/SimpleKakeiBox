//
//  DateController.m
//  SimpleKakeibo
//
//  Created by masashi on 09/11/02.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MyAppDataController.h"
#import "MyApplicationData.h"
#import "RootViewController.h"

@implementation MyAppDataController

@synthesize appdata;

static id _instance = nil;

+ (id)instance
{
  @synchronized(self) {
    if (!_instance) {
      _instance = [[MyAppDataController alloc] init];
    }
  }
  return _instance;
}

+ (id)allocWithZone:(NSZone*)zone
{
  @synchronized(self) {
    if (!_instance) {
      _instance = [super allocWithZone:zone];
      return _instance;
    }
  }
  return nil;
}

- (id)copyWithZone:(NSZone*)zone
{
  return self;
}

- (id)retain
{
  return self;
}

- (unsigned)retainCount
{
  return UINT_MAX;
}

- (void)release
{
}

- (id)autorelease
{
  return self;
} 

-(void)loadData{
  NSData* data = [[NSMutableData alloc]initWithContentsOfFile:[self dataFilePath]];
  NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
  appdata = [[unarchiver decodeObjectForKey:DATAKEY] retain];
  [unarchiver finishDecoding];
  [unarchiver release];
  [data release];
  if (!appdata) {
    appdata = [[MyApplicationData alloc]init];
  }
  if (!appdata.categories) {
    appdata.categories = [[NSMutableArray alloc]init];
  }
  if (!appdata.items) {
    appdata.items = [[NSMutableArray alloc]init];
  }
}

-(int)checkYear:(NSDate*)date{
  NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
  [dateFormatter setDateFormat:@"yyyy"];
  int year = [[dateFormatter stringFromDate:date] intValue];  
  int start_year = START_YEAR;
  if (year < start_year) {
    return -1;
  }else {
    return 1;
  }
}

-(void)addAppDataItemPrice:(NSString*)price itemCategory:(NSString*)category itemDate:(NSDate*)date{
  if([self checkYear:date] == -1) return;
  NSInteger index = -1;
  if ([appdata.categories count] != 0) {
    index = [appdata.categories indexOfObject:category];
  }
  if(index == -1 || index > [appdata.categories count]){
    [appdata.categories addObject:category];
    index = [appdata.categories count];
  }
  NSMutableArray* ary = [[NSMutableArray alloc] init];
  [ary addObject:price];
  [ary addObject:category];
  [ary addObject:date];
  [appdata.items addObject:ary];
}

-(void)editAppDataItemId:(NSInteger)identifier itemPrice:(NSString*)price itemCategory:(NSString*)category itemDate:(NSDate*)date{
  if([self checkYear:date] == -1) return;
  [appdata.categories addObject:category];
  NSArray* arr = [[NSSet setWithArray:[NSArray arrayWithArray:appdata.categories]] allObjects];
  appdata.categories = [NSMutableArray arrayWithArray:arr];
  
  NSMutableArray* ary = [[NSMutableArray alloc] init];
  [ary addObject:price];
  [ary addObject:category];
  [ary addObject:date];
  [appdata.items replaceObjectAtIndex:identifier withObject:ary];
}

-(void)deleteAppDataItemId:(NSInteger)identifier{
  [appdata.items removeObjectAtIndex:identifier];
}

static int compareInfo(id aInfo1, id aInfo2, void *context){
  NSDate* info1 = [aInfo1 objectAtIndex:2];
  NSDate* info2 = [aInfo2 objectAtIndex:2];
  return -1 * [info1 compare:info2];
}

-(void)saveData{
  NSData* data = [[NSMutableData alloc] init];
  [appdata.items sortUsingFunction:compareInfo context:NULL];
  NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
  [archiver encodeObject:appdata forKey:DATAKEY];
  [archiver finishEncoding];
  [data writeToFile:[self dataFilePath] atomically:YES];
  [archiver release];
  [data release];
}

-(NSString*)dataFilePath{
  NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString* documentsDirectory = [paths objectAtIndex:0];
  return [documentsDirectory stringByAppendingPathComponent:FILENAME];
}

-(NSMutableArray*)categories{
  return appdata.categories;
}



-(NSString*)allAmount{
  NSInteger amount = 0;
  int i;
  for (i=0; i<[appdata.items count]; i++) {
    NSMutableArray* item = [appdata.items objectAtIndex:i];
    NSString* price = [item	objectAtIndex:0];
    NSInteger n = [price integerValue];
    amount += n;
  }
  return [NSString stringWithFormat:@"合計:: %d 円", amount];
}

-(NSInteger)amountYear:(NSInteger)searchYear Month:(NSInteger)searchMonth{
  NSMutableArray* result = [self itemsYear:searchYear Month:searchMonth];
  NSInteger amount = 0;
  int i;
  for (i=0; i<[result count]; i++) {
    NSString* str = [[[result objectAtIndex:i] objectAtIndex:1] objectAtIndex:0];
    NSInteger n = [str integerValue];
    amount += n;
  }
  //[result release];
  return amount;
}

-(NSMutableArray*)searchByCategoryYear:(NSInteger)searchYear Month:(NSInteger)searchMonth Category:(NSString*)searchCategory{
  NSMutableArray* tmp_items = [self itemsYear:searchYear Month:searchMonth];
  NSMutableArray* result = [[NSMutableArray alloc] init];
  int i;
  for (i=0; i<[tmp_items count]; i++) {
    NSString* category = [[[tmp_items objectAtIndex:i] objectAtIndex:1] objectAtIndex:1];
    if ([searchCategory isEqualToString:category]) {
      [result addObject:[tmp_items objectAtIndex:i]];
    }
  }
  return result;
}

-(NSMutableArray*)itemsYear:(NSInteger)searchYear Month:(NSInteger)searchMonth{
  NSMutableArray* result = [[NSMutableArray alloc] init];
  int i;
  for (i=0; i<[appdata.items count]; i++) {
    NSMutableArray* item = [appdata.items objectAtIndex:i];
    NSDate* date = [item objectAtIndex:2];
        
    NSCalendar* cal = [[NSCalendar alloc]
                        initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSYearCalendarUnit |
      NSMonthCalendarUnit |
      NSDayCalendarUnit | 
      NSHourCalendarUnit |
      NSMinuteCalendarUnit |
      NSSecondCalendarUnit;
    NSDateComponents *components = [cal components:unitFlags fromDate:date];
        
    NSInteger itemYear = [components year];
    NSInteger itemMonth = [components month];
        
    if (itemYear == searchYear && itemMonth == searchMonth) {
      NSMutableArray* ary = [[NSMutableArray alloc] init];
      [ary addObject:[NSNumber numberWithInt:i]];
      [ary addObject:item];
      [result addObject:ary];
    }
  }
  return result;
}

-(NSMutableArray*)getByIdentifier:(NSInteger)identifier{
  return [appdata.items objectAtIndex:identifier];
}

@end
