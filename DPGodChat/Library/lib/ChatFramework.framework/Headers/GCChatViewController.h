

#define KNOTIFICATIONNAME_DELETEALLMESSAGE @"RemoveAllMessages"
#import "HDMessageViewController.h"

@interface GCChatViewController : HDMessageViewController <HDMessageViewControllerDelegate, HDMessageViewControllerDataSource>

@property (strong, nonatomic) NSDictionary *commodityInfo; //商品信息

- (void)showMenuViewController:(UIView *)showInView
                  andIndexPath:(NSIndexPath *)indexPath
                   messageType:(EMMessageBodyType)messageType;

@end
