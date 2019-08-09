//
//  ViewController.m
//  AutoLayoutScrollView
//
//  Created by Shagun Madhikarmi on 01/07/2015.
//  Copyright (c) 2015 ustwo. All rights reserved.
//

#import "ViewController.h"
#import "View.h"
#import "UIView+AutoLayoutHelper.h"
#import "UIToolbar+KeyboardAdditions.h"

@interface ViewController () <UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, assign) CGPoint scrollViewOffset;
@property (nonatomic, assign) BOOL keyboardShowing;


@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;

@end


@implementation ViewController


- (void)loadView
{
    [super loadView];
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor blackColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboardNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboardNotification:) name:UIKeyboardWillHideNotification object:nil];

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView fillSuperView:UIEdgeInsetsZero];
    
    // Container view
    self.containerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.containerView.backgroundColor = [UIColor purpleColor];
    [self.scrollView addSubview:self.containerView];
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.containerView fillSuperView:UIEdgeInsetsZero];
    
    // Note. special

    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.containerView
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1.0
                                                                   constant:0.0];
    [self.view addConstraint:constraint];

    
    
    
//    // Scroll subviews with no containerView
    
    self.redView = [[UIView alloc] initWithFrame:CGRectZero];
    self.redView.backgroundColor = [UIColor redColor];
    [self.containerView addSubview:self.redView];
    
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.redView addTopConstraintToView:self.redView.superview attribute:NSLayoutAttributeTop relation:NSLayoutRelationEqual constant:0.0];
    [self.redView addWidthConstraintToView:self.redView.superview relation:NSLayoutRelationEqual constant:0.0];
    [self.redView addHeightConstraintToView:nil relation:NSLayoutRelationEqual constant:520.0];
    
    UIView *previousView = nil;
    
    previousView = self.redView;
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.textField.backgroundColor = [UIColor blueColor];
    [self.containerView addSubview:self.textField];
    
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    self.textField.accessibilityLabel = @"textfield label";
    self.textField.accessibilityIdentifier = @"textfield id";
    [self.textField addTopConstraintToView:self.redView attribute:NSLayoutAttributeBottom relation:NSLayoutRelationEqual constant:20.0];
    [self.textField addWidthConstraintToView:self.textField.superview relation:NSLayoutRelationEqual constant:0.0];
    [self.textField addHeightConstraintToView:nil relation:NSLayoutRelationEqual constant:40.0];
    [self.textField addBottomConstraintToView:self.textField.superview relation:NSLayoutRelationEqual constant:0.0];
    
    self.textField.inputAccessoryView = [UIToolbar doneToolbarWithTarget:self action:@selector(didPressDoneToolbar:)];
}

- (void)didPressDoneToolbar:(id)sender
{
    NSLog(@"didPressDoneToolbar");
    
    [self.view endEditing:YES];
}

- (void)willHideKeyboardNotification:(NSNotification *)notification
{
    NSLog(@"willHideKeyboardNotification");
    
    self.scrollView.contentInset = UIEdgeInsetsZero;
    
    self.keyboardShowing = NO;
}

- (void)willShowKeyboardNotification:(NSNotification *)notification
{
    NSDictionary *info = notification.userInfo;

    NSValue *value = info[UIKeyboardFrameEndUserInfoKey];
    
    if (value != nil) {
        
        CGRect rawFrame = [value CGRectValue];
        CGRect keyboardFrame = [self.view convertRect:rawFrame fromView:nil];

//        NSLog(@"keyboardFrame: %@", NSStringFromCGRect(keyboardFrame));
//
//        UIEdgeInsets edgeInsets = self.mainView.scrollView.contentInset;
//        NSLog(@"edgeInsets: %@", NSStringFromUIEdgeInsets(edgeInsets));
//        
//        CGSize size = self.mainView.scrollView.contentSize;
//        NSLog(@"size: %@", NSStringFromCGSize(size));
//
//        CGRect redViewFrame = self.redView.frame;
//        NSLog(@"redViewFrame: %@", NSStringFromCGRect(redViewFrame));
//
//        CGRect textFieldFrame = self.textField.frame;
//        NSLog(@"textFieldFrame: %@", NSStringFromCGRect(textFieldFrame));

        
        // 1. DOES NOT WORK Try contentInset to move the view up
        
        self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height, 0);

        // 2. KIND OF WORKS Try set content offset
        
//        self.scrollViewOffset = self.scrollView.contentOffset;
//        CGRect rect = [self.textField bounds];
//        rect = [self.textField convertRect:rect toView:self.scrollView];
//        CGPoint point = rect.origin;
//        point.x = 0;
//        point.y -= keyboardFrame.size.height;
//        [self.scrollView setContentOffset:point animated:YES];
//        self.keyboardShowing = YES;
//        
        // 3. DOES NOT WORK Try scroll rect
        
//        [self.mainView.scrollView scrollRectToVisible:self.textField.frame animated:YES];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

@end
