#import "ViewController.h"
#import "ILGPSIndoorLocationProvider.h"

@interface ViewController ()

@end

@implementation ViewController {
    ILGPSIndoorLocationProvider* gpsProvider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    MWZOptions* opts = [[MWZOptions alloc] init];
    self.mapwizePlugin = [[MapwizePlugin alloc] initWith:self.mglMapView options:opts];
    self.mapwizePlugin.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mapwizePluginDidLoad:(MapwizePlugin *)mapwizePlugin {
    gpsProvider = [[ILGPSIndoorLocationProvider alloc] init];
    [mapwizePlugin setIndoorLocationProvider:gpsProvider];
    [gpsProvider start];
}


@end
