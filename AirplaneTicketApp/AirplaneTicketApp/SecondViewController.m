//
//  SecondViewController.m
//  AirplaneTicketApp
//
//  Created by Fevin Patel on 2023-10-20.
//

#import "SecondViewController.h"

@interface SecondViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *ticketTableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ticketTableView.delegate = self;
    self.ticketTableView.dataSource = self;
    [self.ticketTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
    // Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    
    NSString *ticketData = self.listOfTickts[indexPath.row];
    NSArray *rawticketData = [ticketData componentsSeparatedByString:@" tickets: "];
    if (rawticketData.count == 2) {
        NSString *typeOfTicket = rawticketData[0];
        NSString *numOfTickets = rawticketData[1];
        cell.textLabel.text = [NSString stringWithFormat:@"%@  %@", typeOfTicket, numOfTickets];
    }
    return cell;
}

- (IBAction)doneBtn:(id)sender {
    UIAlertController *popup = [UIAlertController alertControllerWithTitle:@"Thank you!" message:@"Enjoy Your Trip" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    [popup addAction:ok];
    [self presentViewController:popup animated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
