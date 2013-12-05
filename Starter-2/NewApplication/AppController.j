/*
 * AppController.j
 * NewApplication
 *
 * Created by You on January 29, 2013.
 * Copyright 2013, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPButton.j>
@import "CPPropertyAnimation.j"


@implementation AppController : CPObject
{
    CGRect hideFrame;
    CPColor inactiveBlueColor, activeBlueColor;

    //Text
    CPTextField headerTitle, introText, descriptionText, videoTitle, dayAnnouncement, timeMon, timeWed, timeFri;

    CPWebView videoWebView;

    //Bottom
    CPButton _maandagButton;
    CPButton _woensdagButton;
    CPButton _vrijdagButton;
    CPButton _quitButton;
    CPTextField _label;
    CPView _baseView;
    CPView _mainWindow;

    // Aside Menu
    CPButton _askQuestion;
    CPButton _sendWork;
    CPButton _playQuiz;
    CPButton _watchShow;

    CPPropertyAnimation animator;

    //UITZENDING TERUG BEKIJKEN
    CPButton _findGuest, _searchSub, _searchDate;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    hideFrame = CGRectMake(0,0,0,0);
    inactiveBlueColor = [CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0];
    activeBlueColor = [CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0];

    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    _baseView = [[CPView alloc] initWithFrame: CGRectMake(0,0,1280,800)];
    [_baseView setBackgroundColor: [CPColor colorWithCalibratedRed:255.0/255.0 green:238.0/255.0 blue:190.0/255.0 alpha:1.0]];

    _mainWindow = [[CPView alloc] initWithFrame: CGRectMake(51, 125, 850, 450)];
    [_mainWindow setBackgroundColor: [CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0]];

    headerTitle =[[CPTextField alloc] initWithFrame:CGRectMake(55, 75, 0, 0)];
    [headerTitle setFont:[CPFont fontWithName:"Helvetica" size: 34.0]];
    [headerTitle setStringValue:"Te gast"];
    [headerTitle sizeToFit];
    [headerTitle setTextColor:activeBlueColor];

    introText = [[CPTextField alloc] initWithFrame:CGRectMake(25, 25, 250, 100)];
    [introText setFont:[CPFont fontWithName:"Helvetica-Bold" size: 12.0]];
    [introText setStringValue:"Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan  Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan"];
    [introText setTextColor:[CPColor whiteColor]];
    [introText setLineBreakMode: CPLineBreakByCharWrapping];

    descriptionText = [[CPTextField alloc] initWithFrame:CGRectMake(25, 150, 250, 300)];
    [descriptionText setFont:[CPFont fontWithName:"Helvetica" size: 12.0]];
    [descriptionText setStringValue:"Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan naan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem Banaan Lorem "];
    [descriptionText setTextColor:[CPColor whiteColor]];
    [descriptionText setLineBreakMode: CPLineBreakByWordWrapping];

    dayAnnouncement = [[CPTextField alloc] initWithFrame:CGRectMake(320, 25, 500, 100)];
    [dayAnnouncement setFont:[CPFont fontWithName:"Helvetica-Bold" size: 12.0]];
    [dayAnnouncement setStringValue:"Te gast bij Babbels, woensdag om 15:00"];
    [dayAnnouncement setTextColor:[CPColor whiteColor]];

    videoTitle = [[CPTextField alloc] initWithFrame:CGRectMake(320, 50, 500, 100)];
    [videoTitle setFont:[CPFont fontWithName:"Helvetica" size: 50.0]];
    [videoTitle setStringValue:"Nick en Simon!"];
    [videoTitle setTextColor:[CPColor whiteColor]];


    videoWebView = [[CPWebView alloc] initWithFrame:CGRectMake(300, 100, 500, 300)];
    [videoWebView setMainFrameURL:"http://rizkicalame.com/test"];
    [videoWebView setBackgroundColor:activeBlueColor];
    [videoWebView setScrollMode:CPWebViewScrollNone];

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

    var homeImage = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_home.png" size:CPSizeMake(80, 80)];

    //Bottom Menu
    _quitButton = [[CPButton alloc] initWithFrame:CGRectMake(0, 710, 80, 80)];
    [_quitButton setBordered:NO];
    [_quitButton setImage:homeImage];
    [_quitButton setAction:@selector(homeFunction)];

    _maandagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25, 125 + 450, 250, 125)];
    [_maandagButton setTarget:self];
    [_maandagButton setAction:@selector(maandagFunction)];
    [_maandagButton setBordered:NO];
    [_maandagButton setBackgroundColor:[CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [_maandagButton setAlternateImage: nil];
    [_maandagButton setTitle:"Confetti"];
    [_maandagButton setTextColor:[CPColor grayColor]];
    [_maandagButton setFont:[CPFont fontWithName:"Helvetica" size: 26.0]];

    _woensdagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25 + 250 + 25, 125 + 450, 250, 125)];
    [_woensdagButton setTarget:self];
    [_woensdagButton setAction:@selector(woensdagFunction)];
    [_woensdagButton setBordered:NO];
    [_woensdagButton setBackgroundColor:[CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0]];
    [_woensdagButton setTitle:"Babbels"];
    [_woensdagButton setTextColor:[CPColor whiteColor]];
    [_woensdagButton setFont:[CPFont fontWithName:"Helvetica" size: 26.0]];

    _vrijdagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25 + 250 + 250 + 25 + 25, 125 + 450, 250, 125)];
    [_vrijdagButton setTarget:self];
    [_vrijdagButton setAction:@selector(vrijdagFunction)];
    [_vrijdagButton setBackgroundColor:[CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [_vrijdagButton setBordered:NO];
    [_vrijdagButton setTitle:"Strak!"];
    [_vrijdagButton setTextColor:[CPColor grayColor]];
    [_vrijdagButton setFont:[CPFont fontWithName:"Helvetica" size: 26.0]];



    //Timelabels
    timeMon = [[CPTextField alloc] initWithFrame:CGRectMake(60, 20, 0, 0)];
    [timeMon setFont:[CPFont fontWithName:"Helvetica" size:18.0]];
    [timeMon setStringValue:"Maandag 15:00"];
    [timeMon sizeToFit];
    [timeMon setTextColor: [CPColor grayColor]];

    timeWed = [[CPTextField alloc] initWithFrame:CGRectMake(60, 20, 0, 0)];
    [timeWed setFont:[CPFont fontWithName:"Helvetica" size:18.0]];
    [timeWed setStringValue:"Woensdag 15:00"];
    [timeWed sizeToFit];
    [timeWed setTextColor: [CPColor whiteColor]];

    timeFri = [[CPTextField alloc] initWithFrame:CGRectMake(70, 20, 0, 0)];
    [timeFri setFont:[CPFont fontWithName:"Helvetica" size:18.0]];
    [timeFri setStringValue:"Vrijdag 20:00"];
    [timeFri sizeToFit];
    [timeFri setTextColor: [CPColor grayColor]];



    //Aside Menu Icons
    var iconShow = [[CPImageView alloc] initWithFrame:CGRectMake(70, 2, 130, 130)];
    [iconShow setImage:showImage];

    var iconQuiz = [[CPImageView alloc] initWithFrame:CGRectMake(70, 2, 130, 130)];
    [iconQuiz setImage:quizImage];

    var iconWork = [[CPImageView alloc] initWithFrame:CGRectMake(70, 2, 130, 130)];
    [iconWork setImage:workImage];

    var iconAsk = [[CPImageView alloc] initWithFrame:CGRectMake(70, 2, 130, 130)];
    [iconAsk setImage:askImage];





    //Aside menu
    _watchShow = [[CPButton alloc] initWithFrame:CGRectMake(952, 75, 275, 150)];
    [_watchShow setBackgroundColor:[CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0]];
    [_watchShow setAction:@selector(watchShow)];
    [_watchShow setBordered:NO];

    _playQuiz = [[CPButton alloc] initWithFrame:CGRectMake(952, 75 + 150 + 25, 275, 150)];
    [_playQuiz setBackgroundColor:[CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0.0/255.0 alpha:1.0]];
    [_playQuiz setBordered:NO];

    _sendWork = [[CPButton alloc] initWithFrame:CGRectMake(952, 75 + 150 + 25 + 150 + 25, 275, 150)];
    [_sendWork setBackgroundColor:[CPColor colorWithCalibratedRed:139.0/255.0 green:228.0/255.0 blue:66.0/255.0 alpha:1.0]];
    [_sendWork setBordered:NO];

    _askQuestion = [[CPButton alloc] initWithFrame:CGRectMake(952, 75 + 150 + 25 + 150 + 25 + 150 + 25, 275, 150)];
    [_askQuestion setBackgroundColor:[CPColor colorWithCalibratedRed:218.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0]];
    [_askQuestion setBordered:NO];




    //Labels on Buttons
    var askLabel = [[CPTextField alloc] initWithFrame:CGRectMake(60, 125, 0, 0)];
    [askLabel setFont:[CPFont fontWithName:"Helvetica" size:14.0]];
    [askLabel setStringValue:"Stel je vraag aan de gast"];
    [askLabel sizeToFit];
    [askLabel setTextColor: [CPColor whiteColor]];

    var sendLabel = [[CPTextField alloc] initWithFrame:CGRectMake(53, 125, 0, 0)];
    [sendLabel setFont:[CPFont fontWithName:"Helvetica" size:14.0]];
    [sendLabel setStringValue:"Jouw werk in de uitzending!"];
    [sendLabel sizeToFit];
    [sendLabel setTextColor: [CPColor whiteColor]];

    var playLabel = [[CPTextField alloc] initWithFrame:CGRectMake(92, 125, 0, 0)];
    [playLabel setFont:[CPFont fontWithName:"Helvetica" size:14.0]];
    [playLabel setStringValue:"Speel de quiz!"];
    [playLabel sizeToFit];
    [playLabel setTextColor: [CPColor whiteColor]];

    var watchLabel = [[CPTextField alloc] initWithFrame:CGRectMake(62, 125, 0, 0)];
    [watchLabel setFont:[CPFont fontWithName:"Helvetica" size:14.0]];
    [watchLabel setStringValue:"Kijk een uitzending terug"];
    [watchLabel sizeToFit];
    [watchLabel setTextColor: [CPColor whiteColor]];



    //Animations
    // var animator = [[CPPropertyAnimation alloc] initWithView:headerTitle property:@"alphaValue"];
    // [animator setStart:1.0];
    // [animator setEnd:0.0];
    // [animator setDuration:10];
    // [animator startAnimation];

    // Dafuq is this
    [theWindow orderFront:self];


    // Addsubviews
    [contentView addSubview: _baseView];
    [_baseView addSubview:_mainWindow];
    [_mainWindow addSubview: videoWebView];
    [_mainWindow addSubview: introText];
    [_mainWindow addSubview: descriptionText];
    [_mainWindow addSubview: dayAnnouncement];
    [_mainWindow addSubview: videoTitle];
    [_baseView addSubview:headerTitle];
    [_baseView addSubview:_maandagButton];
    [_baseView addSubview:_woensdagButton];
    [_baseView addSubview:_vrijdagButton];
    [_baseView addSubview:_quitButton];
    [_baseView addSubview: _askQuestion];
    [_baseView addSubview: _sendWork];
    [_baseView addSubview: _playQuiz];
    [_baseView addSubview: _watchShow]

    //Maandagbuttons
    [_maandagButton addSubview:timeMon];
    [_woensdagButton addSubview:timeWed];
    [_vrijdagButton addSubview:timeFri];

    //Images aside menu
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
    [_maandagButton setBackgroundColor:activeBlueColor];
    [_woensdagButton setBackgroundColor:inactiveBlueColor];
    [_vrijdagButton setBackgroundColor:inactiveBlueColor];

    [_maandagButton setTextColor:[CPColor whiteColor]];
    [_woensdagButton setTextColor:[CPColor grayColor]];
    [_vrijdagButton setTextColor:[CPColor grayColor]];
    [timeMon setTextColor: [CPColor whiteColor]];
    [timeWed setTextColor: [CPColor grayColor]];
    [timeFri setTextColor: [CPColor grayColor]];
}

- (void) woensdagFunction
{
    [_maandagButton setBackgroundColor:inactiveBlueColor];
    [_woensdagButton setBackgroundColor:activeBlueColor];
    [_vrijdagButton setBackgroundColor:inactiveBlueColor];

    [_maandagButton setTextColor:[CPColor grayColor]];
    [_woensdagButton setTextColor:[CPColor whiteColor]];
    [_vrijdagButton setTextColor:[CPColor grayColor]];
    [timeMon setTextColor: [CPColor grayColor]];
    [timeWed setTextColor: [CPColor whiteColor]];
    [timeFri setTextColor: [CPColor grayColor]];
}

- (void) vrijdagFunction
{
    [_maandagButton setBackgroundColor:inactiveBlueColor];
    [_woensdagButton setBackgroundColor:inactiveBlueColor];
    [_vrijdagButton setBackgroundColor:activeBlueColor];


    [_maandagButton setTextColor:[CPColor grayColor]];
    [_woensdagButton setTextColor:[CPColor grayColor]];
    [_vrijdagButton setTextColor:[CPColor whiteColor]];
    [timeMon setTextColor: [CPColor grayColor]];
    [timeWed setTextColor: [CPColor grayColor]];
    [timeFri setTextColor: [CPColor whiteColor]];
}




- (void) watchShow {
    [headerTitle setStringValue:"Kijk een uitzending terug"];
    [headerTitle sizeToFit];

    [_maandagButton setAlphaValue:0];
    [_woensdagButton setAlphaValue:0];
    [_vrijdagButton setAlphaValue:0];
    [_mainWindow setAlphaValue:0];

    _findGuest = [[CPButton alloc] initWithFrame: CGRectMake(76, 200, 250, 370)];
    [_findGuest setBackgroundColor: activeBlueColor];
    [_findGuest setAction:@selector(findGuest)];
    [_findGuest setBordered:NO];

    _searchSub = [[CPButton alloc] initWithFrame: CGRectMake(76 + 250 + 25, 200, 250, 370)];
    [_searchSub setBackgroundColor: activeBlueColor];
    [_searchSub setAction:@selector(findGuest)];
    [_searchSub setBordered:NO];

    _searchDate = [[CPButton alloc] initWithFrame: CGRectMake(76 + 250 + 25 + 250 + 25, 200, 250, 370)];
    [_searchDate setBackgroundColor: activeBlueColor];
    [_searchDate setAction:@selector(findGuest)];
    [_searchDate setBordered:NO];


    //Images
    var guestIm = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_guest.png" size:CPSizeMake(220, 220)];
    var subIm = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_sub.png" size:CPSizeMake(220, 220)];
    var dateIm = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_date.png" size:CPSizeMake(220, 220)];

    var icongGuestIm = [[CPImageView alloc] initWithFrame:CGRectMake(17, 40, 220, 220)];
    [icongGuestIm setImage:guestIm];
    var iconSubIm = [[CPImageView alloc] initWithFrame:CGRectMake(17, 40, 220, 220)];
    [iconSubIm setImage:subIm];
    var iconDateIm = [[CPImageView alloc] initWithFrame:CGRectMake(17, 40, 220, 220)];
    [iconDateIm setImage:dateIm];



    var guestLabel = [[CPTextField alloc] initWithFrame:CGRectMake(403, 270, 170, 80)];
    [guestLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [guestLabel setStringValue:"Vind een gast!"];
    [guestLabel setTextColor: [CPColor whiteColor]];
    [guestLabel setLineBreakMode: CPLineBreakByWordWrapping];
    [guestLabel setAlignment: CPCenterTextAlignment];

    var subjectLabel = [[CPTextField alloc] initWithFrame:CGRectMake(40, 270, 170, 80)];
    [subjectLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [subjectLabel setStringValue:"Zoek op onderwerp"];
    [subjectLabel setTextColor: [CPColor whiteColor]];
    [subjectLabel setLineBreakMode: CPLineBreakByWordWrapping];
    [subjectLabel setAlignment: CPCenterTextAlignment];

    var dateLabel = [[CPTextField alloc] initWithFrame:CGRectMake(40, 270, 170, 80)];
    [dateLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [dateLabel setStringValue:"Zoek op datum"];
    [dateLabel setTextColor: [CPColor whiteColor]];
    [dateLabel setLineBreakMode: CPLineBreakByWordWrapping];
    [dateLabel setAlignment: CPCenterTextAlignment];




    [_baseView addSubview:_findGuest];
    [_baseView addSubview:_searchSub];
    [_baseView addSubview:_searchDate];
    [_findGuest addSubview:icongGuestIm];
    [_findGuest addSubview:guestLabel]
    [_searchSub addSubview:iconSubIm];
    [_searchSub addSubview:subjectLabel];
    [_searchDate addSubview:iconDateIm];
    [_searchDate addSubview:dateLabel];
}

- (void) homeFunction {
    [headerTitle setStringValue:"Te gast"];
    [headerTitle sizeToFit];

    [_maandagButton setAlphaValue:1];
    [_woensdagButton setAlphaValue:1];
    [_vrijdagButton setAlphaValue:1];
    [_mainWindow setAlphaValue:1];


    //To set nil
    [_findGuest setAlphaValue:0];
    [_searchSub setAlphaValue:0];
    [_searchDate setAlphaValue:0];
}


@end
