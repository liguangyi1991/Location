//
//  GeofenceMonitor.m
//  TestMap
//
//  Created by 段坤明 on 2022/7/27.
//

#import "GeofenceMonitor.h"
#import <UIKit/UIKit.h>
@interface GeofenceMonitor()
@property (nonatomic, strong) CLLocationManager *locationManager;
@end
@implementation GeofenceMonitor
+ (instancetype)geofenceMonitor {
  static GeofenceMonitor *shared = nil;

  static dispatch_once_t onceTocken;
  dispatch_once(&onceTocken, ^{
      shared = [[GeofenceMonitor alloc] init];
  });
  return shared;
}
- (instancetype)init {
  self = [super init];
  if (self) {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    //Set whether to allow the system to automatically pause positioning, (set YES, background positioning will stop after about 20 minutes)
    self.locationManager.pausesLocationUpdatesAutomatically = NO;
    //After 9.0 this must want to add, do not add cannot realize backstage to locate continuously
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >=9.0) {
        self.locationManager.allowsBackgroundLocationUpdates = YES;
    }
    [self.locationManager setDesiredAccuracy: kCLLocationAccuracyHundredMeters];
    [self.locationManager setDistanceFilter: 100];
  }
  return self;
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
 didUpdateLocations:(NSArray<CLLocation *> *)locations{
   NSLog(@"didUpdateLocations: %@",locations);
}
@end
