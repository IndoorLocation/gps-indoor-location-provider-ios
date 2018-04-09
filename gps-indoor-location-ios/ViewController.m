#import "ViewController.h"
#import "ILGPSIndoorLocationProvider.h"

@interface ViewController ()

@property (nonatomic, strong) ILGPSIndoorLocationProvider* gpsProvider;

@end

@implementation ViewController {
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
    self.gpsProvider = [[ILGPSIndoorLocationProvider alloc] init];
    [mapwizePlugin setIndoorLocationProvider:self.gpsProvider];
    [self.gpsProvider start];
}


@end
