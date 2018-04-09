#import "ILGPSIndoorLocationProvider.h"

@implementation ILGPSIndoorLocationProvider {
    CLLocationManager* locationManager;
    BOOL isStarted;
    BOOL shouldStart;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        isStarted = false;
        shouldStart = false;
    }
    return self;
}

- (BOOL) supportsFloor {
    return false;
}

- (void) start {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 10;
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways
        || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self startUpdating];
    }
    else {
        [locationManager requestWhenInUseAuthorization];
        shouldStart = true;
    }
}

- (void) stop {
    [locationManager stopUpdatingLocation];
    isStarted = false;
}

- (BOOL) isStarted {
    return isStarted;
}

- (BOOL) shouldStart {
    return shouldStart;
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation* location = [locations lastObject];
    ILIndoorLocation* indoorLocation = [[ILIndoorLocation alloc] initWithProvider:self latitude:location.coordinate.latitude longitude:location.coordinate.longitude floor:nil];
    indoorLocation.accuracy = location.horizontalAccuracy;
    indoorLocation.timestamp = location.timestamp;
    [self dispatchDidUpdateLocation:indoorLocation];
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self dispatchDidFailWithError:error];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
        {
            NSError* error = [NSError errorWithDomain:@"ILGPSIndoorLocationProvider" code:0 userInfo:@{NSLocalizedDescriptionKey:@"Permission required"}];
            [self dispatchDidFailWithError:error];
        }
            break;
        default:{
            if (shouldStart) {
                [self startUpdating];
            }
        }
    }
}

- (void)startUpdating {
    [locationManager startUpdatingLocation];
    isStarted = true;
}

@end
