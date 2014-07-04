//
//  ViewController.m
//  Bridge
//
//  Created by James on 7/4/14.
//  Copyright (c) 2014 Frigid Studios. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self speakData:[self loadBridgeData]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    exit(0);
}

- (NSString *) loadBridgeData {
    NSURL *url = [NSURL URLWithString:@"<your url here>"];
    NSError * error;
    NSStringEncoding * encoding;
    return [NSString stringWithContentsOfURL:url usedEncoding:(unsigned long *)&encoding error:&error];
}

- (void) speakData:(NSString *) text {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    [utterance setRate:0.3f];
    AVSpeechSynthesizer *syn = [[AVSpeechSynthesizer alloc] init];
    syn.delegate = self;
    [syn speakUtterance:utterance];
}

@end
