#import <UIKit/UIKit.h>
@import Mapbox;
@import MapwizeForMapbox;

@interface ViewController : UIViewController <MWZMapwizePluginDelegate>

@property (weak, nonatomic) IBOutlet MGLMapView *mglMapView;
@property (nonatomic, strong) MapwizePlugin* mapwizePlugin;

@end

