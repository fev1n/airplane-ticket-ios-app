//
//  ViewController.m
//  AirplaneTicketApp
//
//  Created by Fevin Patel on 2023-10-20.
//

#import "ViewController.h"
#import "SecondViewController.h"


@interface ViewController() <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *numberOfTicketsTxtField;
@property (weak, nonatomic) IBOutlet UIPickerView *ticketTypesPickerView;
@property (weak, nonatomic) IBOutlet UITextView *ticketsListView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.typeOfTickets = @[@"VIP", @"Business", @"Economy Kid", @"Economy Adult", @"Infant"];
    self.listofTickets =  [NSMutableArray array];
    self.ticketTypesPickerView.delegate = self;
    self.ticketTypesPickerView.dataSource = self;
    self.finalTicketType = self.typeOfTickets[0];
    self.finalTicketCount = 1;
    
    }

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.typeOfTickets[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.finalTicketType = self.typeOfTickets[row];
}

- (IBAction)addTicketBtn:(id)sender {
    NSString *ticketNum = self.numberOfTicketsTxtField.text;
    NSInteger totalTickets = [ticketNum integerValue];
    NSString *tickets = [NSString stringWithFormat:@"%@ tickets: %d", self.finalTicketType, (int)totalTickets];
    
    [self.listofTickets addObject:tickets];
    self.ticketsListView.text = [self.listofTickets componentsJoinedByString:@"\n\n"];
  
    
    self.numberOfTicketsTxtField.text = @"";
    [self.ticketTypesPickerView selectRow:0 inComponent:0 animated:YES];
    self.finalTicketCount = 1;
    self.finalTicketType = self.typeOfTickets[0];
}
- (IBAction)checkoutBtn:(id)sender {
    [self performSegueWithIdentifier:@"finalpage" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"finalpage"]) {
        SecondViewController *svc = segue.destinationViewController;
        svc.listOfTickts = self.listofTickets;
        svc.finalTicketType = self.finalTicketType;
    }
}

@end
