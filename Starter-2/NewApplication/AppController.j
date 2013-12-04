/*
 * AppController.j
 * NewApplication
 *
 * Created by You on January 29, 2013.
 * Copyright 2013, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPButton.j>


@implementation AppController : CPObject
{
    CGRect hideFrame;

    //Bottom
    CPButton _maandagButton;
    CPButton _woensdagButton;
    CPButton _vrijdagButton;
    CPButton _quitButton;
    CPTextField _label;
    CPView _baseView
    CPView _mainWindow;

    // Aside Menu
    CPButton _askQuestion;
    CPButton _sendWork;
    CPButton _playQuiz;
    CPButton _watchShow;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    hideFrame = CGRectMake(0,0,0,0);

    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    _baseView = [[CPView alloc] initWithFrame: CGRectMake(0,0,1280,800)];
    [_baseView setBackgroundColor: [CPColor colorWithCalibratedRed:255.0/255.0 green:238.0/255.0 blue:190.0/255.0 alpha:1.0]];

    _mainWindow = [[CPView alloc] initWithFrame: CGRectMake(51, 125, 850, 450)];
    [_mainWindow setBackgroundColor: [CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0]];

    // _label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    // [_label setStringValue:@"Hello World!"];
    // [_label setFont:[CPFont boldSystemFontOfSize:24.0]];
    // [_label sizeToFit];
    // [_label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    // [_label setCenter:[contentView center]];
    var showImage = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_computer.png" size:CPSizeMake(130, 130)];
    var quizImage = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_graduate.png" size:CPSizeMake(130, 130)];
    var workImage = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_pencil.png" size:CPSizeMake(130, 130)];
    var askImage = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_cloud.png" size:CPSizeMake(130, 130)];

    _maandagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25, 125 + 450, 250, 125)];
    [_maandagButton setTarget:self];
    [_maandagButton setAction:@selector(maandagFunction)];
    [_maandagButton setBordered:NO];
    [_maandagButton setBackgroundColor:[CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [_maandagButton setAlternateImage: nil];
    [_maandagButton setTitle:"Maandag"];
    [_maandagButton setTextColor:[CPColor blackColor]];

    _woensdagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25 + 250 + 25, 125 + 450, 250, 125)];
    [_woensdagButton setTarget:self];
    [_woensdagButton setAction:@selector(woensdagFunction)];
    [_woensdagButton setBordered:NO];
    [_woensdagButton setBackgroundColor:[CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [_woensdagButton setTitle:"Woensdag"];
    [_woensdagButton setTextColor:[CPColor blackColor]];

    _vrijdagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25 + 250 + 250 + 25 + 25, 125 + 450, 250, 125)];
    [_vrijdagButton setTarget:self];
    [_vrijdagButton setAction:@selector(vrijdagFunction)];
    [_vrijdagButton setBackgroundColor:[CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [_vrijdagButton setBordered:NO];
    [_vrijdagButton setTitle:"Vrijdag"];
    [_vrijdagButton setTextColor:[CPColor blackColor]];

    var iconShow = [[CPImageView alloc] initWithFrame:CGRectMake(80, 10, 130, 130)];
    [iconShow setImage:showImage];

    var iconQuiz = [[CPImageView alloc] initWithFrame:CGRectMake(80, 10, 130, 130)];
    [iconQuiz setImage:quizImage];

    var iconWork = [[CPImageView alloc] initWithFrame:CGRectMake(80, 10, 130, 130)];
    [iconWork setImage:workImage];

    var iconAsk = [[CPImageView alloc] initWithFrame:CGRectMake(80, 10, 130, 130)];
    [iconAsk setImage:askImage];

    _quitButton = [[CPButton alloc] initWithFrame:CGRectMake(0, 700, 68, 68)];
    [_quitButton setBordered:NO];

    _askQuestion = [[CPButton alloc] initWithFrame:CGRectMake(988, (768 - 192), 291, 192)];
    [_askQuestion setBackgroundColor:[CPColor colorWithCalibratedRed:218.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0]];
    [_askQuestion setBordered:NO];

    _sendWork = [[CPButton alloc] initWithFrame:CGRectMake(988, (768 - 192 * 2), 291, 192)];
    [_sendWork setBackgroundColor:[CPColor colorWithCalibratedRed:139.0/255.0 green:228.0/255.0 blue:66.0/255.0 alpha:1.0]];
    [_sendWork setBordered:NO];

    _playQuiz = [[CPButton alloc] initWithFrame:CGRectMake(988, (768 - 192 * 3), 291, 192)];
    [_playQuiz setBackgroundColor:[CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0.0/255.0 alpha:1.0]];
    [_playQuiz setBordered:NO];

    _watchShow = [[CPButton alloc] initWithFrame:CGRectMake(988, (768 - 192 * 4), 291, 192)];
    [_watchShow setBackgroundColor:[CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0]];
    [_watchShow setBordered:NO];

    var askLabel = [[CPTextField alloc] initWithFrame:CGRectMake(79, 130, 0, 0)];
    [askLabel setStringValue:"Stel je vraag aan de gast"];
    [askLabel sizeToFit];
    [askLabel setTextColor: [CPColor whiteColor]];

    var sendLabel = [[CPTextField alloc] initWithFrame:CGRectMake(73, 130, 0, 0)];
    [sendLabel setStringValue:"Jouw werk in de uitzending!"];
    [sendLabel sizeToFit];
    [sendLabel setTextColor: [CPColor whiteColor]];

    var playLabel = [[CPTextField alloc] initWithFrame:CGRectMake(109, 130, 0, 0)];
    [playLabel setStringValue:"Speel de quiz!"];
    [playLabel sizeToFit];
    [playLabel setTextColor: [CPColor whiteColor]];

    var watchLabel = [[CPTextField alloc] initWithFrame:CGRectMake(80, 130, 0, 0)];
    [watchLabel setStringValue:"Kijk een uitzending terug"];
    [watchLabel sizeToFit];
    [watchLabel setTextColor: [CPColor whiteColor]];

    // Dafuq is this
    [theWindow orderFront:self];

    // Addsubviews
    [contentView addSubview: _baseView];
    [_baseView addSubview:_mainWindow];
    [_baseView addSubview:_maandagButton];
    [_baseView addSubview:_woensdagButton];
    [_baseView addSubview:_vrijdagButton];
    [_baseView addSubview:_quitButton];
    [_baseView addSubview: _askQuestion];
    [_baseView addSubview: _sendWork];
    [_baseView addSubview: _playQuiz];
    [_baseView addSubview: _watchShow]

    //Images
    [_watchShow addSubview:iconShow];
    [_playQuiz addSubview:iconQuiz];
    [_sendWork addSubview:iconWork];
    [_askQuestion addSubview:iconAsk];

    [_askQuestion addSubview: askLabel];
    [_sendWork addSubview: sendLabel];
    [_playQuiz addSubview: playLabel];
    [_watchShow addSubview: watchLabel];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (void) maandagFunction
{
    console.log("Maandag!");
    [_askQuestion setFrame:hideFrame];
}

- (void) woensdagFunction
{
    console.log("Woensdag!");
}

- (void) vrijdagFunction
{
    console.log("Vrijdag!");
}


@end
