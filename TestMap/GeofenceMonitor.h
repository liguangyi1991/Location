//
//  GeofenceMonitor.h
//  TestMap
//
//  Created by 段坤明 on 2022/7/27.
//

#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GeofenceMonitor : CLLocationManager<CLLocationManagerDelegate>
+ (instancetype)geofenceMonitor;
@end

NS_ASSUME_NONNULL_END
