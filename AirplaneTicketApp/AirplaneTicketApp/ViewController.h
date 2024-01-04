//
//  ViewController.h
//  AirplaneTicketApp
//
//  Created by Fevin Patel on 2023-10-20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) NSArray *typeOfTickets;
@property (nonatomic) NSMutableArray *listofTickets;
@property (nonatomic) NSString *finalTicketType;
@property (nonatomic) NSInteger finalTicketCount;

@end

