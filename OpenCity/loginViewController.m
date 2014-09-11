//
//  loginViewController.m
//  
//
//  Created by Apollo on 10/09/14.
//
//

#import "loginViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "dataClass.h"

@interface loginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *loginField;
@property (strong, nonatomic) IBOutlet UITextField *passField;
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *token;

@end

@implementation loginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"login-bg.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)testConnect:(id)sender
{
    self.login = self.loginField.text;
    self.password = self.passField.text;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://opencity-moonshot.herokuapp.com/auth/local"
       parameters:@{@"email": self.login,
                    @"password": self.password}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              dataClass *obj = [dataClass getInstance];
              obj.token = responseObject[@"token"];
              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connexion réussie"
                        message:@"vous êtes connecté!"
                        delegate:nil
                cancelButtonTitle:@"OK"
            otherButtonTitles:nil];
              [alert show];
              NSLog(@"%@", responseObject[@"token"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec de l'opération"
                                                        message:error.localizedDescription
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }];
}
- (IBAction)createAccount:(id)sender
{
    self.login = self.loginField.text;
    self.password = self.passField.text;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://opencity-moonshot.herokuapp.com/api/users"
       parameters:@{@"email": self.login,
                    @"password": self.password}
          success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        dataClass *obj = [dataClass getInstance];
        obj.token = responseObject[@"token"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Création réussie!"
                                                        message:@"vous êtes connecté!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
          } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Echec de l'opération"
                                                        message:error.localizedDescription
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }];
}

- (IBAction)tapOutside:(id)sender
{
    [self.loginField resignFirstResponder];
    [self.passField resignFirstResponder];
}

@end
