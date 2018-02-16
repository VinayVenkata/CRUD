//
//  StudentListViewController.m
//  CRUD
//
//  Created by Vinay Ponnuri on 9/20/17.
//  Copyright © 2017 Vinay Ponnuri. All rights reserved.
//

#import "StudentListViewController.h"

@interface StudentListViewController ()

@end
//hello how are you
//adding one more line

@implementation StudentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerNib:[UINib nibWithNibName:@"NamesTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self getDataFromEntity];
}

-(void)getDataFromEntity{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    
    NSFetchRequest *getData = [NSFetchRequest fetchRequestWithEntityName:@"StudentEntity"];
    
    NSError *save;
    NSArray *studentData = [context executeFetchRequest:getData error:&save];
    self.studentList = [NSMutableArray arrayWithArray:studentData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.studentList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NamesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NamesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    StudentEntity *studentName = [self.studentList objectAtIndex:indexPath.row];
    
    cell.nameLable.text = studentName.name;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        [self.studentList removeObjectAtIndex:indexPath.row];
        [tableView reloadData]; // tell table to refresh now
    }
}

- (IBAction)filterButtonClicked:(UISegmentedControl *)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    NSFetchRequest *getData = [NSFetchRequest fetchRequestWithEntityName:@"StudentEntity"];
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self getDataFromEntity];
            break;
        case 1:{
            NSPredicate *maleStudents = [NSPredicate predicateWithFormat:@"gender == 'male'"];
            getData.predicate = maleStudents;
            break;
        }
        case 2:{
            NSPredicate *femaleStudents = [NSPredicate predicateWithFormat:@"gender == 'female'"];
            getData.predicate = femaleStudents;
            break;
        }
        default:
            break;
    }
    
    NSError *save;
    NSArray *studentData = [context executeFetchRequest:getData error:&save];
    self.studentList = [NSMutableArray arrayWithArray:studentData];
    [self.tableView reloadData];
}
@end
