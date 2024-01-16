//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessagesToolbarContentView.h"

#import "UIView+JSQMessages.h"

const CGFloat kJSQMessagesToolbarContentViewHorizontalSpacingDefault = 8.0f;


@interface JSQMessagesToolbarContentView ()

@property (strong, nonatomic) UIStackView *stackView;

@property (strong, nonatomic) UIView *accessoryContainerView;

@property (strong, nonatomic) UIView *contentView;

@property (strong, nonatomic) JSQMessagesComposerTextView *textView;

@property (strong, nonatomic) UIView *leftBarButtonContainerView;
@property (strong, nonatomic) NSLayoutConstraint *leftBarButtonContainerViewWidthConstraint;

@property (strong, nonatomic) UIView *rightBarButtonContainerView;
@property (strong, nonatomic) NSLayoutConstraint *rightBarButtonContainerViewWidthConstraint;

@property (strong, nonatomic) NSLayoutConstraint *leftHorizontalSpacingConstraint;
@property (strong, nonatomic) NSLayoutConstraint *rightHorizontalSpacingConstraint;

@property (strong, nonatomic) NSLayoutConstraint *accessoryContainerHeightConstraint;

@end



@implementation JSQMessagesToolbarContentView

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubviews];
        [self setLayoutConstraints];
        [self setStyleProperties];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

#pragma mark - Set subviews

- (void) setSubviews {
    self.stackView = [[UIStackView alloc] init];
    self.accessoryContainerView = [[UIView alloc] init];
    self.contentView = [[UIView alloc] init];
    self.textView = [[JSQMessagesComposerTextView alloc] init];
    self.leftBarButtonContainerView = [[UIView alloc] init];
    self.rightBarButtonContainerView = [[UIView alloc] init];

    [self addSubview: self.stackView];
    [self.stackView addArrangedSubview: self.accessoryContainerView];
    [self.stackView addArrangedSubview: self.contentView];
    [self.contentView addSubview: self.leftBarButtonContainerView];
    [self.contentView addSubview: self.textView];
    [self.contentView addSubview: self.rightBarButtonContainerView];
}

#pragma mark - Layout constraints

- (void) setLayoutConstraints {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.stackView setTranslatesAutoresizingMaskIntoConstraints: NO];
    NSLayoutConstraint *stackViewLeading = [NSLayoutConstraint
        constraintWithItem: self.stackView
        attribute: NSLayoutAttributeLeading
        relatedBy: NSLayoutRelationEqual
        toItem: self
        attribute: NSLayoutAttributeLeading
        multiplier: 1
        constant: 0
    ];
    NSLayoutConstraint *stackViewTop = [NSLayoutConstraint
        constraintWithItem: self.stackView
        attribute: NSLayoutAttributeTop
        relatedBy: NSLayoutRelationEqual
        toItem: self
        attribute: NSLayoutAttributeTop
        multiplier: 1
        constant: 0
    ];
    NSLayoutConstraint *stackViewTrailing = [NSLayoutConstraint
        constraintWithItem: self.stackView
        attribute: NSLayoutAttributeTrailing
        relatedBy: NSLayoutRelationEqual
        toItem: self
        attribute: NSLayoutAttributeTrailing
        multiplier: 1
        constant: 0
    ];
    NSLayoutConstraint *stackViewBottom = [NSLayoutConstraint
        constraintWithItem: self.stackView
        attribute: NSLayoutAttributeBottom
        relatedBy: NSLayoutRelationEqual
        toItem: self
        attribute: NSLayoutAttributeBottom
        multiplier: 1
        constant: 0
    ];

    [self.accessoryContainerView setTranslatesAutoresizingMaskIntoConstraints: NO];
    self.accessoryContainerHeightConstraint = [NSLayoutConstraint
        constraintWithItem: self.accessoryContainerView
        attribute: NSLayoutAttributeHeight
        relatedBy: NSLayoutRelationGreaterThanOrEqual
        toItem: nil
        attribute: NSLayoutAttributeNotAnAttribute
        multiplier: 1
        constant: 0
    ];

    [self.contentView setTranslatesAutoresizingMaskIntoConstraints: NO];
    NSLayoutConstraint *contentViewHeight = [NSLayoutConstraint
        constraintWithItem: self.contentView
        attribute: NSLayoutAttributeHeight
        relatedBy: NSLayoutRelationGreaterThanOrEqual
        toItem: nil
        attribute: NSLayoutAttributeNotAnAttribute
        multiplier: 1
        constant: 44
    ];

    [self.leftBarButtonContainerView setTranslatesAutoresizingMaskIntoConstraints: NO];
    NSLayoutConstraint *leftBarButtonContainerViewLeading = [NSLayoutConstraint
        constraintWithItem: self.leftBarButtonContainerView
        attribute: NSLayoutAttributeLeading
        relatedBy: NSLayoutRelationEqual
        toItem: self.contentView
        attribute: NSLayoutAttributeLeading
        multiplier: 1
        constant: 8
    ];
    NSLayoutConstraint *leftBarButtonContainerViewBottom = [NSLayoutConstraint
        constraintWithItem: self.leftBarButtonContainerView
        attribute: NSLayoutAttributeBottom
        relatedBy: NSLayoutRelationEqual
        toItem: self.contentView
        attribute: NSLayoutAttributeBottom
        multiplier: 1
        constant: -6
    ];
    self.leftBarButtonContainerViewWidthConstraint = [NSLayoutConstraint
        constraintWithItem: self.leftBarButtonContainerView
        attribute: NSLayoutAttributeWidth
        relatedBy: NSLayoutRelationEqual
        toItem: nil
        attribute: NSLayoutAttributeNotAnAttribute
        multiplier: 1
        constant: 34
    ];
    NSLayoutConstraint *leftBarButtonContainerViewHeight = [NSLayoutConstraint
        constraintWithItem: self.leftBarButtonContainerView
        attribute: NSLayoutAttributeHeight
        relatedBy: NSLayoutRelationEqual
        toItem: nil
        attribute: NSLayoutAttributeNotAnAttribute
        multiplier: 1
        constant: 32
    ];

    [self.textView setTranslatesAutoresizingMaskIntoConstraints: NO];
    self.leftHorizontalSpacingConstraint = [NSLayoutConstraint
        constraintWithItem: self.textView
        attribute: NSLayoutAttributeLeading
        relatedBy: NSLayoutRelationEqual
        toItem: self.leftBarButtonContainerView
        attribute: NSLayoutAttributeTrailing
        multiplier: 1
        constant: kJSQMessagesToolbarContentViewHorizontalSpacingDefault
    ];
    NSLayoutConstraint *textViewTop = [NSLayoutConstraint
        constraintWithItem: self.textView
        attribute: NSLayoutAttributeTop
        relatedBy: NSLayoutRelationEqual
        toItem: self.contentView
        attribute: NSLayoutAttributeTop
        multiplier: 1
        constant: 7
    ];
    self.rightHorizontalSpacingConstraint = [NSLayoutConstraint
        constraintWithItem: self.textView
        attribute: NSLayoutAttributeTrailing
        relatedBy: NSLayoutRelationEqual
        toItem: self.rightBarButtonContainerView
        attribute: NSLayoutAttributeLeading
        multiplier: 1
        constant: -kJSQMessagesToolbarContentViewHorizontalSpacingDefault
    ];
    NSLayoutConstraint *textViewBottom = [NSLayoutConstraint
        constraintWithItem: self.textView
        attribute: NSLayoutAttributeBottom
        relatedBy: NSLayoutRelationEqual
        toItem: self.contentView
        attribute: NSLayoutAttributeBottom
        multiplier: 1
        constant: -7
    ];

    [self.rightBarButtonContainerView setTranslatesAutoresizingMaskIntoConstraints: NO];
    NSLayoutConstraint *rightBarButtonContainerViewTrailing = [NSLayoutConstraint
        constraintWithItem: self.rightBarButtonContainerView
        attribute: NSLayoutAttributeTrailing
        relatedBy: NSLayoutRelationEqual
        toItem: self.contentView
        attribute: NSLayoutAttributeTrailing
        multiplier: 1
        constant: -8
    ];
    NSLayoutConstraint *rightBarButtonContainerViewBottom = [NSLayoutConstraint
        constraintWithItem: self.rightBarButtonContainerView
        attribute: NSLayoutAttributeBottom
        relatedBy: NSLayoutRelationEqual
        toItem: self.contentView
        attribute: NSLayoutAttributeBottom
        multiplier: 1
        constant: -6
    ];
    self.rightBarButtonContainerViewWidthConstraint = [NSLayoutConstraint
        constraintWithItem: self.rightBarButtonContainerView
        attribute: NSLayoutAttributeWidth
        relatedBy: NSLayoutRelationEqual
        toItem: nil
        attribute: NSLayoutAttributeNotAnAttribute
        multiplier: 1
        constant: 50
    ];
    NSLayoutConstraint *rightBarButtonContainerViewHeight = [NSLayoutConstraint
        constraintWithItem: self.rightBarButtonContainerView
        attribute: NSLayoutAttributeHeight
        relatedBy: NSLayoutRelationEqual
        toItem: self.leftBarButtonContainerView
        attribute: NSLayoutAttributeHeight
        multiplier: 1
        constant: 0
    ];

    NSArray *layoutConstraints = @[
        stackViewLeading, stackViewTop, stackViewTrailing, stackViewBottom,
        self.accessoryContainerHeightConstraint,
        contentViewHeight,
        leftBarButtonContainerViewLeading, leftBarButtonContainerViewBottom, self.leftBarButtonContainerViewWidthConstraint, leftBarButtonContainerViewHeight,
        self.leftHorizontalSpacingConstraint, textViewTop, self.rightHorizontalSpacingConstraint, textViewBottom,
        rightBarButtonContainerViewTrailing, rightBarButtonContainerViewBottom, self.rightBarButtonContainerViewWidthConstraint, rightBarButtonContainerViewHeight
    ];

    [NSLayoutConstraint activateConstraints: layoutConstraints];
}

#pragma mark - Set style properties

- (void) setStyleProperties {
    self.backgroundColor = [UIColor clearColor];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    [self.contentView
        setContentCompressionResistancePriority: UILayoutPriorityDefaultHigh
        forAxis: UILayoutConstraintAxisVertical
    ];
}

#pragma mark - Setters

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    self.leftBarButtonContainerView.backgroundColor = backgroundColor;
    self.rightBarButtonContainerView.backgroundColor = backgroundColor;
}

- (void)setLeftBarButtonItem:(UIButton *)leftBarButtonItem
{
    if (_leftBarButtonItem) {
        [_leftBarButtonItem removeFromSuperview];
    }

    if (!leftBarButtonItem) {
        _leftBarButtonItem = nil;
        self.leftHorizontalSpacingConstraint.constant = 0.0f;
        self.leftBarButtonItemWidth = 0.0f;
        self.leftBarButtonContainerView.hidden = YES;
        return;
    }

    if (CGRectEqualToRect(leftBarButtonItem.frame, CGRectZero)) {
        leftBarButtonItem.frame = self.leftBarButtonContainerView.bounds;
    }

    self.leftBarButtonContainerView.hidden = NO;
    self.leftHorizontalSpacingConstraint.constant = kJSQMessagesToolbarContentViewHorizontalSpacingDefault;
    self.leftBarButtonItemWidth = CGRectGetWidth(leftBarButtonItem.frame);

    [leftBarButtonItem setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.leftBarButtonContainerView addSubview:leftBarButtonItem];
    [self.leftBarButtonContainerView jsq_pinAllEdgesOfSubview:leftBarButtonItem];
    [self setNeedsUpdateConstraints];

    _leftBarButtonItem = leftBarButtonItem;
}

- (void)setLeftBarButtonItemWidth:(CGFloat)leftBarButtonItemWidth
{
    self.leftBarButtonContainerViewWidthConstraint.constant = leftBarButtonItemWidth;
    [self setNeedsUpdateConstraints];
}

- (void)setRightBarButtonItem:(UIButton *)rightBarButtonItem
{
    if (_rightBarButtonItem) {
        [_rightBarButtonItem removeFromSuperview];
    }

    if (!rightBarButtonItem) {
        _rightBarButtonItem = nil;
        self.rightHorizontalSpacingConstraint.constant = 0.0f;
        self.rightBarButtonItemWidth = 0.0f;
        self.rightBarButtonContainerView.hidden = YES;
        return;
    }

    if (CGRectEqualToRect(rightBarButtonItem.frame, CGRectZero)) {
        rightBarButtonItem.frame = self.rightBarButtonContainerView.bounds;
    }

    self.rightBarButtonContainerView.hidden = NO;
    self.rightHorizontalSpacingConstraint.constant = -kJSQMessagesToolbarContentViewHorizontalSpacingDefault;
    self.rightBarButtonItemWidth = CGRectGetWidth(rightBarButtonItem.frame);

    [rightBarButtonItem setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self.rightBarButtonContainerView addSubview:rightBarButtonItem];
    [self.rightBarButtonContainerView jsq_pinAllEdgesOfSubview:rightBarButtonItem];
    [self setNeedsUpdateConstraints];

    _rightBarButtonItem = rightBarButtonItem;
}

- (void)setRightBarButtonItemWidth:(CGFloat)rightBarButtonItemWidth
{
    self.rightBarButtonContainerViewWidthConstraint.constant = rightBarButtonItemWidth;
    [self setNeedsUpdateConstraints];
}

- (void)setRightContentPadding:(CGFloat)rightContentPadding
{
    self.rightHorizontalSpacingConstraint.constant = rightContentPadding;
    [self setNeedsUpdateConstraints];
}

- (void)setLeftContentPadding:(CGFloat)leftContentPadding
{
    self.leftHorizontalSpacingConstraint.constant = leftContentPadding;
    [self setNeedsUpdateConstraints];
}

#pragma mark - Getters

- (CGFloat)leftBarButtonItemWidth
{
    return self.leftBarButtonContainerViewWidthConstraint.constant;
}

- (CGFloat)rightBarButtonItemWidth
{
    return self.rightBarButtonContainerViewWidthConstraint.constant;
}

- (CGFloat)rightContentPadding
{
    return self.rightHorizontalSpacingConstraint.constant;
}

- (CGFloat)leftContentPadding
{
    return self.leftHorizontalSpacingConstraint.constant;
}

#pragma mark - UIView overrides

- (void)setNeedsDisplay
{
    [super setNeedsDisplay];
    [self.textView setNeedsDisplay];
}

@end
