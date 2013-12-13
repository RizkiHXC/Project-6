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
    CPColor inactiveBlueColor, activeBlueColor, activeOrangeColor;

    //Text
    CPTextField headerTitle, introText, descriptionText, videoTitle, dayAnnouncement, timeMon, timeWed, timeFri;

    CPWebView videoWebView, detailedWebView;

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

    //FINDGUEST
    CPView _fgMainWindow;
    CPButton _upButton, _bottomButton, guest1IV, guest2IV, guest3IV, guestUp, guestDown;

    //PLAYQUIZ
    CPView _quizMainWindow;
    CPButton _puppyButton, _labradorButton, _bulldogButton;

    //ACTUALLY PLAY QUIZ LOL
    CPButton topleft, topRight, bottomLeft, bottomRight;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    hideFrame = CGRectMake(0,0,0,0);

    inactiveBlueColor = [CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0];
    activeBlueColor = [CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0];
    activeOrangeColor = [CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0/255.0 alpha:1.0];

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

    _maandagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25, 120 + 450, 250, 125)];
    [_maandagButton setTarget:self];
    [_maandagButton setAction:@selector(maandagFunction)];
    [_maandagButton setBordered:NO];
    [_maandagButton setBackgroundColor:[CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [_maandagButton setAlternateImage: nil];
    [_maandagButton setTitle:"Confetti"];
    [_maandagButton setTextColor:[CPColor grayColor]];
    [_maandagButton setFont:[CPFont fontWithName:"Helvetica" size: 26.0]];

    _woensdagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25 + 250 + 25, 120 + 450, 250, 125)];
    [_woensdagButton setTarget:self];
    [_woensdagButton setAction:@selector(woensdagFunction)];
    [_woensdagButton setBordered:NO];
    [_woensdagButton setBackgroundColor:[CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0]];
    [_woensdagButton setTitle:"Babbels"];
    [_woensdagButton setTextColor:[CPColor whiteColor]];
    [_woensdagButton setFont:[CPFont fontWithName:"Helvetica" size: 26.0]];

    _vrijdagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25 + 250 + 250 + 25 + 25, 120 + 450, 250, 125)];
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
    [_playQuiz setAction:@selector(playQuiz)];
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



    _upButton = [[CPButton alloc] initWithFrame:CGRectMake(300, 720, 200, 50)];
    [_upButton setBackgroundColor:activeBlueColor];
    [_upButton setBordered:NO];
    [_upButton setTitle:"NAAR BOVEN"];
    [_upButton setAlphaValue:0];
    _bottomButton = [[CPButton alloc] initWithFrame:CGRectMake(525, 720, 200, 50)];
    [_bottomButton setBackgroundColor:activeBlueColor];
    [_bottomButton setBordered:NO];
    [_bottomButton setTitle:"NAAR BENEDEN"];
    [_bottomButton setAlphaValue:0];

    //Animations
    // var animator = [[CPPropertyAnimation alloc] initWithView:headerTitle property:@"alphaValue"];
    // [animator setStart:1.0];
    // [animator setEnd:0.0];
    // [animator setDuration:10];
    // [animator startAnimation];


    [self setCornerRadius:10.0 ofView:_mainWindow];
    [self setCornerRadius:10.0 ofButton:_maandagButton];
    [self setCornerRadius:10.0 ofButton:_woensdagButton];
    [self setCornerRadius:10.0 ofButton:_vrijdagButton];
    [self setCornerRadius:10.0 ofButton:_watchShow];
    [self setCornerRadius:10.0 ofButton:_playQuiz];
    [self setCornerRadius:10.0 ofButton:_sendWork];
    [self setCornerRadius:10.0 ofButton:_askQuestion];

    // Dafuq is this
    [theWindow orderFront:self];


    // Addsubviews
    [contentView addSubview: _baseView];
    [_baseView addSubview:_maandagButton];
    [_baseView addSubview:_woensdagButton];
    [_baseView addSubview:_vrijdagButton];
    [_baseView addSubview:_mainWindow];
    [_baseView addSubview: _bottomButton];
    [_baseView addSubview: _upButton];

    [_mainWindow addSubview: videoWebView];
    [_mainWindow addSubview: introText];
    [_mainWindow addSubview: descriptionText];
    [_mainWindow addSubview: dayAnnouncement];
    [_mainWindow addSubview: videoTitle];
    [_baseView addSubview:headerTitle];
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

- (void) watchShow
{
    [headerTitle setStringValue:"Kijk een uitzending terug"];
    [headerTitle setTextColor:activeBlueColor];
    [headerTitle sizeToFit];

    [_maandagButton setAlphaValue:0];
    [_woensdagButton setAlphaValue:0];
    [_vrijdagButton setAlphaValue:0];
    [_mainWindow setAlphaValue:0];
    [_fgMainWindow setAlphaValue:0];
    [_upButton setAlphaValue:0];
    [_bottomButton setAlphaValue:0];
    [_quizMainWindow setAlphaValue:0];

    _upButton = [[CPButton alloc] initWithFrame:CGRectMake(300, 720, 200, 50)];
    _bottomButton = [[CPButton alloc] initWithFrame:CGRectMake(525, 720, 200, 50)];

    _findGuest = [[CPButton alloc] initWithFrame: CGRectMake(76, 200, 250, 370)];
    [_findGuest setBackgroundColor: activeBlueColor];
    [_findGuest setAction:@selector(findGuest)];
    [_findGuest setBordered:NO];

    _searchSub = [[CPButton alloc] initWithFrame: CGRectMake(76 + 250 + 25, 200, 250, 370)];
    [_searchSub setBackgroundColor: activeBlueColor];
    [_searchSub setAction:@selector(searchSub)];
    [_searchSub setBordered:NO];

    _searchDate = [[CPButton alloc] initWithFrame: CGRectMake(76 + 250 + 25 + 250 + 25, 200, 250, 370)];
    [_searchDate setBackgroundColor: activeBlueColor];
    [_searchDate setAction:@selector(searchDate)];
    [_searchDate setBordered:NO];

    [self setCornerRadius:10.0 ofButton:_findGuest];
    [self setCornerRadius:10.0 ofButton:_searchSub];
    [self setCornerRadius:10.0 ofButton:_searchDate];


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



    var guestLabel = [[CPTextField alloc] initWithFrame:CGRectMake(40, 270, 170, 80)];
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
    [_findGuest addSubview:guestLabel];
    [_searchSub addSubview:iconSubIm];
    [_searchSub addSubview:subjectLabel];
    [_searchDate addSubview:iconDateIm];
    [_searchDate addSubview:dateLabel];
}

-(void) findGuest
{
    [_findGuest setAlphaValue: 0];
    [_searchSub setAlphaValue: 0];
    [_searchDate setAlphaValue: 0];
    [_upButton setAlphaValue: 1];
    [_bottomButton setAlphaValue: 1];


    _fgMainWindow = [[CPView alloc] initWithFrame:CGRectMake(51, 125, 840, 575)];
    [_fgMainWindow setBackgroundColor:activeBlueColor];

    var titleLabel = [[CPTextField alloc] initWithFrame:CGRectMake(25, 30, 170, 80)];
    [titleLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [titleLabel setStringValue:"Vind een gast!"];
    [titleLabel sizeToFit];
    [titleLabel setTextColor: [CPColor whiteColor]];
    [titleLabel setLineBreakMode: CPLineBreakByWordWrapping];

    var guest1 = [[CPImage alloc] initWithContentsOfFile:"Resources/gast01.png" size:CPSizeMake(150, 150)];
    var guest2 = [[CPImage alloc] initWithContentsOfFile:"Resources/gast02.png" size:CPSizeMake(150, 150)];
    var guest3 = [[CPImage alloc] initWithContentsOfFile:"Resources/gast03.png" size:CPSizeMake(150, 150)];

    guest1IV = [[CPButton alloc] initWithFrame:CGRectMake(25, 80, 150, 150)];
    [guest1IV setImage:guest1];
    [guest1IV setBordered: NO];
    [guest1IV setAction:@selector(nickEnSimon)];
    guest2IV = [[CPButton alloc] initWithFrame:CGRectMake(25 + 150 + 25, 80, 150, 150)];
    [guest2IV setImage:guest2];
    [guest2IV setBordered: NO];
    guest3IV = [[CPButton alloc] initWithFrame:CGRectMake(25 + 150 + 25 + 150 + 25, 80, 150, 150)];
    [guest3IV setImage:guest3];
    [guest3IV setBordered: NO];

    [self setCornerRadius:10.0 ofButton:_fgMainWindow];

    [_baseView addSubview:_fgMainWindow]
    [_fgMainWindow addSubview: titleLabel];
    [_fgMainWindow addSubview:guest1IV];
    [_fgMainWindow addSubview:guest2IV];
    [_fgMainWindow addSubview:guest3IV];
}

- (void) nickEnSimon
{
    [guest1IV setFrame:hideFrame];
    [guest2IV setFrame:hideFrame];
    [guest3IV setFrame:hideFrame];

    guestUp = [[CPButton alloc] initWithFrame:CGRectMake(30, 100, 200, 50)];
    [guestUp setBackgroundColor:inactiveBlueColor];
    [guestUp setBordered:NO];
    [guestUp setTitle:"NAAR BOVEN"];
    [guestUp setAlphaValue:1];

    guestDown = [[CPButton alloc] initWithFrame:CGRectMake(30, 390, 200, 50)];
    [guestDown setBackgroundColor:inactiveBlueColor];
    [guestDown setBordered:NO];
    [guestDown setTitle:"NAAR BENEDEN"];
    [guestDown setAlphaValue:1];

    detailedWebView = [[CPWebView alloc] initWithFrame:CGRectMake(300, 100, 500, 300)];
    [detailedWebView setMainFrameURL:"http://rizkicalame.com/test"];
    [detailedWebView setBackgroundColor:activeBlueColor];
    [detailedWebView setScrollMode:CPWebViewScrollNone];

    var buttonOne = [[CPButton alloc] initWithFrame: CGRectMake(30, 160, 200, 100)];
    [buttonOne setBackgroundColor: inactiveBlueColor];
    [buttonOne setBordered:NO];

    var buttonTwo = [[CPButton alloc] initWithFrame: CGRectMake(30, 280, 200, 100)];
    [buttonTwo setBackgroundColor: inactiveBlueColor];
    [buttonTwo setBordered:NO];

    [_fgMainWindow addSubview: detailedWebView];
    [_fgMainWindow addSubview: buttonOne];
    [_fgMainWindow addSubview: buttonTwo];
    [_fgMainWindow addSubview:guestUp];
    [_fgMainWindow addSubview:guestDown];

}


- (void) playQuiz {
    [headerTitle setStringValue:"Speel de Quiz!"];
    [headerTitle setTextColor:activeOrangeColor];
    [headerTitle sizeToFit];

    [_maandagButton setAlphaValue:0];
    [_woensdagButton setAlphaValue:0];
    [_vrijdagButton setAlphaValue:0];
    [_mainWindow setAlphaValue:0];
    [_fgMainWindow setAlphaValue:0];
    [_upButton setAlphaValue:0];
    [_bottomButton setAlphaValue:0];
    [_fgMainWindow setAlphaValue:0];
    [_quizMainWindow setAlphaValue:0];


    _puppyButton = [[CPButton alloc] initWithFrame: CGRectMake(76, 200, 250, 370)];
    [_puppyButton setBackgroundColor: activeOrangeColor];
    [_puppyButton setAction:@selector(puppy)];
    [_puppyButton setBordered:NO];
    [_puppyButton setTitle:"1 Ster"];

    _labradorButton = [[CPButton alloc] initWithFrame: CGRectMake(76 + 250 + 25, 200, 250, 370)];
    [_labradorButton setBackgroundColor: activeOrangeColor];
    [_labradorButton setAction:@selector(labrador)];
    [_labradorButton setBordered:NO];
    [_labradorButton setTitle:"2 Sterren"];

    _bulldogButton = [[CPButton alloc] initWithFrame: CGRectMake(76 + 250 + 25 + 250 + 25, 200, 250, 370)];
    [_bulldogButton setBackgroundColor: activeOrangeColor];
    [_bulldogButton setAction:@selector(bulldog)];
    [_bulldogButton setBordered:NO];
    [_bulldogButton setTitle:"3 Sterren"];

    [self setCornerRadius:10.0 ofButton:_puppyButton];
    [self setCornerRadius:10.0 ofButton:_labradorButton];
    [self setCornerRadius:10.0 ofButton:_bulldogButton];

    [_baseView addSubview:_puppyButton];
    [_baseView addSubview:_labradorButton];
    [_baseView addSubview:_bulldogButton];
}


- (void) puppy {
    [_puppyButton setAlphaValue:0];
    [_labradorButton setAlphaValue:0];
    [_bulldogButton setAlphaValue:0];

    _quizMainWindow = [[CPView alloc] initWithFrame:CGRectMake(51, 125, 840, 575)];
    [_quizMainWindow setBackgroundColor:activeOrangeColor];

    var titleLabel = [[CPTextField alloc] initWithFrame:CGRectMake(25, 30, 170, 80)];
    [titleLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [titleLabel setStringValue:"Kies een aflevering"];
    [titleLabel sizeToFit];
    [titleLabel setTextColor: [CPColor whiteColor]];
    [titleLabel setLineBreakMode: CPLineBreakByWordWrapping];

    topleft = [[CPButton alloc] initWithFrame:CGRectMake(30, 150, 50, 130)];
    [topleft setBackgroundColor:inactiveBlueColor];
    [topleft setBordered:NO];
    [topleft setTitle:"<"];
    [topleft setAlphaValue:1];

    topRight = [[CPButton alloc] initWithFrame:CGRectMake(745, 150, 50, 130)];
    [topRight setBackgroundColor:inactiveBlueColor];
    [topRight setBordered:NO];
    [topRight setTitle:">"];
    [topRight setAlphaValue:1];

    bottomLeft = [[CPButton alloc] initWithFrame:CGRectMake(30, 400, 50, 130)];
    [bottomLeft setBackgroundColor:inactiveBlueColor];
    [bottomLeft setBordered:NO];
    [bottomLeft setTitle:"<"];
    [bottomLeft setAlphaValue:1];

    bottomRight = [[CPButton alloc] initWithFrame:CGRectMake(745, 400, 50, 130)];
    [bottomRight setBackgroundColor:inactiveBlueColor];
    [bottomRight setBordered:NO];
    [bottomRight setTitle:">"];
    [bottomRight setAlphaValue:1];

    var one = [[CPButton alloc] initWithFrame:CGRectMake(110, 150, 190, 130)];
    [one setBackgroundColor:inactiveBlueColor];
    [one setBordered:NO];
    [one setTitle:"Vid 1"];
    [one setAlphaValue:1];

    var two = [[CPButton alloc] initWithFrame:CGRectMake(230 + 80, 150, 190, 130)];
    [two setBackgroundColor:inactiveBlueColor];
    [two setBordered:NO];
    [two setTitle:"Vid 1"];
    [two setAlphaValue:1];

    var three = [[CPButton alloc] initWithFrame:CGRectMake(425  + 85, 150, 190, 130)];
    [three setBackgroundColor:inactiveBlueColor];
    [three setBordered:NO];
    [three setTitle:"Vid 1"];
    [three setAlphaValue:1];

    var four = [[CPButton alloc] initWithFrame:CGRectMake(35  + 75, 400, 190, 130)];
    [four setBackgroundColor:inactiveBlueColor];
    [four setBordered:NO];
    [four setTitle:"Vid 1"];
    [four setAlphaValue:1];

    var five = [[CPButton alloc] initWithFrame:CGRectMake(230  + 80, 400, 190, 130)];
    [five setBackgroundColor:inactiveBlueColor];
    [five setBordered:NO];
    [five setTitle:"Vid 1"];
    [five setAlphaValue:1];

    var six = [[CPButton alloc] initWithFrame:CGRectMake(425  + 85, 400, 190, 130)];
    [six setBackgroundColor:inactiveBlueColor];
    [six setBordered:NO];
    [six setTitle:"Vid 1"];
    [six setAlphaValue:1];

    [_baseView addSubview:_quizMainWindow];
    [_quizMainWindow addSubview:topleft];
    [_quizMainWindow addSubview:topRight];
    [_quizMainWindow addSubview:bottomLeft];
    [_quizMainWindow addSubview:bottomRight];
    [_quizMainWindow addSubview:one];
    [_quizMainWindow addSubview:two];
    [_quizMainWindow addSubview:three];
    [_quizMainWindow addSubview:four];
    [_quizMainWindow addSubview:five];
    [_quizMainWindow addSubview:six];
    [_quizMainWindow addSubview:titleLabel];

}

- (void) homeFunction {
    [headerTitle setStringValue:"Te gast"];
    [headerTitle sizeToFit];

    [_fgMainWindow setFrame:hideFrame];
    [_quizMainWindow setFrame:hideFrame];

    [_maandagButton setAlphaValue:1];
    [_woensdagButton setAlphaValue:1];
    [_vrijdagButton setAlphaValue:1];
    [_mainWindow setAlphaValue:1];


    //To set nil
    [_findGuest setAlphaValue:0];
    [_searchSub setAlphaValue:0];
    [_searchDate setAlphaValue:0];
    [_puppyButton setAlphaValue:0];
    [_labradorButton setAlphaValue:0];
    [_bulldogButton setAlphaValue:0];


    [_fgMainWindow setAlphaValue:0];
    [_upButton setAlphaValue:0];
    [_bottomButton setAlphaValue:0];
    [_quizMainWindow setAlphaValue:0];

    [_maandagButton setAction:@selector(maandagFunction)];
    [_woensdagButton setAction:@selector(woensdagFunction)];
    [_vrijdagButton setAction:@selector(vrijdagFunction)];
}

- (void)setCornerRadius:(CPNumber)radius ofView:(CPView)view{
    radius = (radius != null) ? radius : 0;
    view._DOMElement.style.setProperty('border-radius', radius+'px', null);
    view._DOMElement.style.setProperty('-moz-border-radius', radius+'px', null);
    view._DOMElement.style.setProperty('-webkit-border-radius', radius+'px', null);
    view._DOMElement.style.setProperty('border-radius', radius+'px', null);
}

- (void)setCornerRadius:(CPNumber)radius ofButton:(CPButton)button{
    radius = (radius != null) ? radius : 0;
    button._DOMElement.style.setProperty('border-radius', radius+'px', null);
    button._DOMElement.style.setProperty('-moz-border-radius', radius+'px', null);
    button._DOMElement.style.setProperty('-webkit-border-radius', radius+'px', null);
    button._DOMElement.style.setProperty('border-radius', radius+'px', null);
}
@end
