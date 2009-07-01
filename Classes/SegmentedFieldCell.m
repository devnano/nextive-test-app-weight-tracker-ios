//
//  SegementedFieldCell.m
//  WeightTracker
//
//  Created by Mariano Heredia on 7/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SegmentedFieldCell.h"


@implementation SegmentedFieldCell
@synthesize label, segmentedControl;
@dynamic selectedSegmentIndex;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
