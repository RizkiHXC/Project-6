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
    CGRect backFrame;
    CPColor inactiveBlueColor, activeBlueColor, activeOrangeColor;

    //Text
    CPTextField headerTitle, introText, descriptionText, videoTitle, dayAnnouncement, timeMon, timeWed, timeFri;

    CPWebView videoWebView, detailedWebView;

    //Bottom
    CPButton _maandagButton;
    CPButton _woensdagButton;
    CPButton _vrijdagButton;
    CPButton _quitButton;
    CPButton _backButton;
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
    CPView _fg2MainWindow;
    CPView _catMainWindow;
    CPButton _upButton, _bottomButton, guest1IV, guest2IV, guest3IV, guestUp, guestDown;
    CPTextField titleLabel;

    //PLAYQUIZ
    CPView _quizMainWindow;
    CPView _quiz2MainWindow;
    CPView _quiz3MainWindow;
    CPView _quiz4MainWindow;
    CPButton _puppyButton, _labradorButton, _bulldogButton;
    CPImageView answerImageView1, answerImageView2, answerImageView3;

    //ACTUALLY PLAY QUIZ
    CPButton topleft, topRight, bottomLeft, bottomRight, answerA, answerB, answerC;
    CPTextField answerALabel, answerBLabel, answerCLabel, question, questionTitle;

    //SEND WORK
    CPView _sw1MainWindow;
    CPView _sw2MainWindow;
    CPView _sw3MainWindow;
    CPTextField descriptionLabelSW;
    CPView cameraActivate;

    //ASK QUESTION
    CPView _aQ1MainWindow;
    CPView _aQ2MainWindow;


    BOOL isFirstQ;
    CPMutableArray vcArray;

}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    hideFrame = CGRectMake(0,0,0,0);
    backFrame = CGRectMake(80, 710, 80, 80);

    inactiveBlueColor = [CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0];
    activeBlueColor = [CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0];
    activeOrangeColor = [CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0/255.0 alpha:1.0];

    vcArray = [[CPMutableArray alloc] init];

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
    [introText setStringValue:"Een kerstviering in 4 vwo zorgt ervoor dat Nick Schilder en Simon Keizer voor het eerst samen zingen. Het is meteen  duidelijk: dat smaakt naar meer.   "];
    [introText setTextColor:[CPColor whiteColor]];
    [introText setLineBreakMode: CPLineBreakByCharWrapping];

    descriptionText = [[CPTextField alloc] initWithFrame:CGRectMake(25, 100, 250, 300)];
    [descriptionText setFont:[CPFont fontWithName:"Helvetica" size: 12.0]];
    [descriptionText setStringValue:"Gewapend met Engelstalige covers van onder meer Simon & Garfunkel krijgt het zangduo steeds meer bekendheid in en rond Volendam. Simon schrijft hiernaast nummers met en voor Jan Smit. Als ‘vrienden van’ komen Nick & Simon regelmatig aan bod in de realitysoap Gewoon Jan Smit. Topmanager Jaap Buijs pikt de zangers op en brengt ze in contact met  platenmaatschappij Artist & Company."];
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
    [videoWebView setMainFrameURL:"http://rizkicalame.com/test/woensdag.html"];
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
    var backImage = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_back.png" size:CPSizeMake(80, 80)];

    //Bottom Menu
    _quitButton = [[CPButton alloc] initWithFrame:CGRectMake(0, 710, 80, 80)];
    [_quitButton setBordered:NO];
    [_quitButton setImage:homeImage];
    [_quitButton setAction:@selector(homeFunction)];

    _maandagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25, 115 + 450, 250, 125)];
    [_maandagButton setTarget:self];
    [_maandagButton setAction:@selector(maandagFunction)];
    [_maandagButton setBordered:NO];
    [_maandagButton setBackgroundColor:[CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [_maandagButton setAlternateImage: nil];
    [_maandagButton setTitle:"Confetti"];
    [_maandagButton setTextColor:[CPColor grayColor]];
    [_maandagButton setFont:[CPFont fontWithName:"Helvetica" size: 26.0]];

    _woensdagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25 + 250 + 25, 115 + 450, 250, 125)];
    [_woensdagButton setTarget:self];
    [_woensdagButton setAction:@selector(woensdagFunction)];
    [_woensdagButton setBordered:NO];
    [_woensdagButton setBackgroundColor:[CPColor colorWithCalibratedRed:73.0/255.0 green:187.0/255.0 blue:218.0/255.0 alpha:1.0]];
    [_woensdagButton setTitle:"Babbels"];
    [_woensdagButton setTextColor:[CPColor whiteColor]];
    [_woensdagButton setFont:[CPFont fontWithName:"Helvetica" size: 26.0]];

    _vrijdagButton = [[CPButton alloc] initWithFrame: CGRectMake(51 + 25 + 250 + 250 + 25 + 25, 115 + 450, 250, 125)];
    [_vrijdagButton setTarget:self];
    [_vrijdagButton setAction:@selector(vrijdagFunction)];
    [_vrijdagButton setBackgroundColor:[CPColor colorWithCalibratedRed:158.0/255.0 green:243.0/255.0 blue:248.0/255.0 alpha:1.0]];
    [_vrijdagButton setBordered:NO];
    [_vrijdagButton setTitle:"Strak!"];
    [_vrijdagButton setTextColor:[CPColor grayColor]];
    [_vrijdagButton setFont:[CPFont fontWithName:"Helvetica" size: 26.0]];

    _backButton = [[CPButton alloc] initWithFrame:hideFrame];
    [_backButton setBordered:NO];
    [_backButton setImage:backImage];
    [_backButton setAction:@selector(backFunction)];




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
    [_sendWork setAction:@selector(sendWork)];
    [_sendWork setBordered:NO];

    _askQuestion = [[CPButton alloc] initWithFrame:CGRectMake(952, 75 + 150 + 25 + 150 + 25 + 150 + 25, 275, 150)];
    [_askQuestion setBackgroundColor:[CPColor colorWithCalibratedRed:218.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0]];
    [_askQuestion setAction:@selector(askQuestion)];
    [_askQuestion setBordered:NO];




    //Labels on Buttons
    var askLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0, 125, 275, 30)];
    [askLabel setFont:[CPFont fontWithName:"Helvetica" size:14.0]];
    [askLabel setStringValue:"Stel je vraag!"];
    [askLabel setAlignment:CPCenterTextAlignment];
    [askLabel setTextColor: [CPColor whiteColor]];

    var sendLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0, 125, 275, 30)];
    [sendLabel setFont:[CPFont fontWithName:"Helvetica" size:14.0]];
    [sendLabel setStringValue:"Jouw werk inzending!"];
    [sendLabel setAlignment:CPCenterTextAlignment];
    [sendLabel setTextColor: [CPColor whiteColor]];

    var playLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0, 125, 275, 30)];
    [playLabel setFont:[CPFont fontWithName:"Helvetica" size:14.0]];
    [playLabel setStringValue:"Speel een quiz!"];
    [playLabel setAlignment:CPCenterTextAlignment];
    [playLabel setTextColor: [CPColor whiteColor]];

    var watchLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0, 125, 275, 30)];
    [watchLabel setFont:[CPFont fontWithName:"Helvetica" size:14.0]];
    [watchLabel setStringValue:"Uitzending terugkijken"];
    [watchLabel setAlignment:CPCenterTextAlignment];
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

    // Pre allocation
    _puppyButton = [[CPButton alloc] initWithFrame: CGRectMake(76, 200, 250, 370)];
    _labradorButton = [[CPButton alloc] initWithFrame: CGRectMake(76 + 250 + 25, 200, 250, 370)];
    _bulldogButton = [[CPButton alloc] initWithFrame: CGRectMake(76 + 250 + 25 + 250 + 25, 200, 250, 370)];

    _fg2MainWindow = [[CPView alloc] initWithFrame:hideFrame];
    _quiz2MainWindow = [[CPView alloc] initWithFrame:hideFrame];
    _quiz3MainWindow = [[CPView alloc] initWithFrame:hideFrame];
    _quiz4MainWindow = [[CPView alloc] initWithFrame:hideFrame];
    _sw1MainWindow = [[CPView alloc] initWithFrame:hideFrame];
    _sw2MainWindow = [[CPView alloc] initWithFrame:hideFrame];
    _sw3MainWindow = [[CPView alloc] initWithFrame:hideFrame];
    _aQ1MainWindow = [[CPView alloc] initWithFrame:hideFrame];
    _aQ2MainWindow = [[CPView alloc] initWithFrame:hideFrame];
    cameraActivate = [[CPView alloc] initWithFrame:hideFrame];
     question = [[CPTextField alloc] initWithFrame:hideFrame];
     questionTitle = [[CPTextField alloc] initWithFrame:hideFrame];

    [self setID:"camera" ofView:cameraActivate];








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
    [_baseView addSubview:_backButton];
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

    var DOMScriptElement = document.createElement("script");
    DOMScriptElement.src = "http://rizkicalame.com/p6/javascript/app.js";
    DOMScriptElement.type = "text/javascript";
    document.getElementsByTagName("head")[0].appendChild(DOMScriptElement);
    needsInitialization = YES;


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
    [vcArray addObject:"Maandag"];

    [introText setStringValue:"Vandaag komt Mega Mindy in de uitzending! Je kent haar misschien al van de televisie show ‘Mega Mindy’.  Mieke Fonkel en Toby zijn agenten op het politiebureau. In het geheim is Mieke ‘Mega Mindy’  en beleeft allerlei avonturen samen met Toby. "];
    [descriptionText setStringValue:"Kom meer over Mega Mindy te weten in deze uitzendingen. Je kan je vragen stellen door op ‘Stel je vraag!’ te klikken. Ook kan je meedoen aan de quiz door op ‘Speel de Quiz!’ te klikken."];
    [descriptionText setFrame:CGRectMake(25, 130, 250, 300)];
    [dayAnnouncement setStringValue:"Maandag om 15:00, te gast bij Confetti:"];
    [videoTitle setStringValue:"Mega Mindy!"];
    [videoWebView setMainFrameURL:"http://rizkicalame.com/test/maandag.html"];
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
    [vcArray addObject:"Woensdag"];

    [introText setStringValue:"Een kerstviering in 4 vwo zorgt ervoor dat Nick Schilder en Simon Keizer voor het eerst samen zingen. Het is meteen  duidelijk: dat smaakt naar meer.   "];
    [descriptionText setStringValue:"Gewapend met Engelstalige covers van onder meer Simon & Garfunkel krijgt het zangduo steeds meer bekendheid in en rond Volendam. Simon schrijft hiernaast nummers met en voor Jan Smit. Als ‘vrienden van’ komen Nick & Simon regelmatig aan bod in de realitysoap Gewoon Jan Smit. Topmanager Jaap Buijs pikt de zangers op en brengt ze in contact met  platenmaatschappij Artist & Company."];
    [descriptionText setFrame:CGRectMake(25, 100, 250, 300)];
    [dayAnnouncement setStringValue:"Te gast bij Babbels, woensdag om 15:00"];
    [videoTitle setStringValue:"Nick en Simon!"];
    [videoWebView setMainFrameURL:"http://rizkicalame.com/test/woensdag.html"];
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
    [vcArray addObject:"Vrijdag"];

    [introText setStringValue:"Ruud Feltkamp is een Nederlandse acteur die vooral bekend is van de serie Goede Tijden Slechte Tijden waar hij nu al zeven jaar lang in speelt. Zijn acteer carrière startte met hoofdrollen in de films Kruimeltje en Kees de Jongen. Daarnaast is Ruud actief als DJ. "];
    [descriptionText setStringValue:"Vanavond verteld Ruud je over acteren en hoe het er achter de schermen bij Goede Tijden Slechte Tijden aan toe gaat. Heb jij nog leuke vragen? Stuur ze dan in voor of tijdens de uitzending! Ook kan je deelnemen aan de quiz zodra de uitzending gestart is!"];
    [descriptionText setFrame:CGRectMake(25, 130, 250, 300)];
    [dayAnnouncement setStringValue:"Vrijdag om 20:00, te gast bij Strak!:"];
    [videoTitle setStringValue:"Ruud Feltkamp!"];
    [videoWebView setMainFrameURL:"http://rizkicalame.com/test/vrijdag.html"];
}

- (void) watchShow
{
    [headerTitle setStringValue:"Kijk een uitzending terug"];
    [headerTitle setTextColor:activeBlueColor];
    [headerTitle sizeToFit];

    [_upButton setAlphaValue:0];
    [_bottomButton setAlphaValue:0];
    [_quizMainWindow setAlphaValue:0];
    [_maandagButton setAlphaValue:0];
    [_woensdagButton setAlphaValue:0];
    [_vrijdagButton setAlphaValue:0];
    [_mainWindow setAlphaValue:0];
    [_fgMainWindow setAlphaValue:0];
    [_catMainWindow setFrame: hideFrame];
    [_quiz2MainWindow setFrame:hideFrame];
    [_quiz3MainWindow setFrame:hideFrame];
    [_quiz4MainWindow setFrame:hideFrame];

    [_aQ1MainWindow setFrame:hideFrame];
    [_aQ2MainWindow setFrame:hideFrame];

    [_sw1MainWindow setFrame:hideFrame];
    [_sw2MainWindow setFrame:hideFrame];
    [_sw3MainWindow setFrame:hideFrame];

    [vcArray removeLastObject];
    console.log(vcArray);

    [_backButton setFrame:backFrame];

    [_fg2MainWindow setFrame:CGRectMake(51, 125, 840, 575)];
    [_fg2MainWindow setBackgroundColor:[CPColor clearColor]];

    _upButton = [[CPButton alloc] initWithFrame:CGRectMake(300, 720, 200, 50)];
    _bottomButton = [[CPButton alloc] initWithFrame:CGRectMake(525, 720, 200, 50)];

    _findGuest = [[CPButton alloc] initWithFrame: CGRectMake(20, 50, 250, 370)];
    [_findGuest setBackgroundColor: activeBlueColor];
    [_findGuest setAction:@selector(findGuest)];
    [_findGuest setBordered:NO];

    _searchSub = [[CPButton alloc] initWithFrame: CGRectMake(20 + 250 + 25, 50, 250, 370)];
    [_searchSub setBackgroundColor: activeBlueColor];
    [_searchSub setAction:@selector(searchSub)];
    [_searchSub setBordered:NO];

    _searchDate = [[CPButton alloc] initWithFrame: CGRectMake(20 + 250 + 25 + 250 + 25, 50, 250, 370)];
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



    [_baseView addSubview: _fg2MainWindow];
    [_fg2MainWindow addSubview:_findGuest];
    [_fg2MainWindow addSubview:_searchSub];
    [_fg2MainWindow addSubview:_searchDate];
    [_findGuest addSubview:icongGuestIm];
    [_findGuest addSubview:guestLabel];
    [_searchSub addSubview:iconSubIm];
    [_searchSub addSubview:subjectLabel];
    [_searchDate addSubview:iconDateIm];
    [_searchDate addSubview:dateLabel];
}

-(void) findGuest
{
    [_fg2MainWindow setFrame:hideFrame];
    [_upButton setAlphaValue: 1];
    [_bottomButton setAlphaValue: 1];


    _fgMainWindow = [[CPView alloc] initWithFrame:CGRectMake(51, 125, 840, 575)];
    [_fgMainWindow setBackgroundColor:activeBlueColor];

    titleLabel = [[CPTextField alloc] initWithFrame:CGRectMake(25, 30, 170, 80)];
    [titleLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [titleLabel setStringValue:"Vind een gast!"];
    [titleLabel sizeToFit];
    [titleLabel setTextColor: [CPColor whiteColor]];
    [titleLabel setLineBreakMode: CPLineBreakByWordWrapping];

    var guest1 = [[CPImage alloc] initWithContentsOfFile:"Resources/NickEnSimon01.png" size:CPSizeMake(150, 150)];
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
    [_quiz2MainWindow setFrame:hideFrame];


    [_fgMainWindow setBackgroundColor:[CPColor clearColor]];

    var oneImage = [[CPImage alloc] initWithContentsOfFile:"Resources/q1.png" size:CGSizeMake(200,152)];
    var twoImage = [[CPImage alloc] initWithContentsOfFile:"Resources/q2.png" size:CGSizeMake(200,152)];
    var bovenim = [[CPImage alloc] initWithContentsOfFile:"Resources/Knop-boven01.png" size:CPSizeMake(200, 50)];
    var benedenim = [[CPImage alloc] initWithContentsOfFile:"Resources/knop-beneden01.png" size:CPSizeMake(200, 50)];

    var contentWindow = [[CPView alloc] initWithFrame:CGRectMake(290, 50, 530, 427)];
    [contentWindow setBackgroundColor:activeBlueColor];
    [titleLabel setStringValue: ""];
    [self setCornerRadius:10.0 ofView:contentWindow];

    var guestTitleLabel = [[CPTextField alloc] initWithFrame:CGRectMake(18, 10, 0, 0)];
    [guestTitleLabel setStringValue:"Nick en Simon"];
    [guestTitleLabel setTextColor:[CPColor whiteColor]];
    [guestTitleLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [guestTitleLabel sizeToFit];


    guestUp = [[CPButton alloc] initWithFrame:CGRectMake(30, 50, 200, 50)];
    [guestUp setBackgroundColor:activeBlueColor];
    [guestUp setBordered:NO];
    [guestUp setTitle:"NAAR BOVEN"];
    [guestUp setAlphaValue:1];
    [guestUp setImage:bovenim];
    [self setCornerRadius:10.0 ofButton:guestUp];

    guestDown = [[CPButton alloc] initWithFrame:CGRectMake(30, 434, 200, 50)];
    [guestDown setBackgroundColor:activeBlueColor];
    [guestDown setBordered:NO];
    [guestDown setTitle:"NAAR BENEDEN"];
    [guestDown setAlphaValue:1];
    [guestDown setImage:benedenim];
    [self setCornerRadius:10.0 ofButton:guestDown];

    detailedWebView = [[CPWebView alloc] initWithFrame:CGRectMake(300, 100, 520, 330)];
    [detailedWebView setMainFrameURL:"http://rizkicalame.com/test"];
    [detailedWebView setBackgroundColor:activeBlueColor];
    [detailedWebView setScrollMode:CPWebViewScrollNone];

    var buttonOne = [[CPButton alloc] initWithFrame: CGRectMake(30, 110, 200, 152)];
    [buttonOne setBackgroundColor: [CPColor clearColor]];
    [buttonOne setBordered:NO];
    [buttonOne setImage:oneImage];
    [self setCornerRadius:10.0 ofButton:buttonOne];

    var buttonTwo = [[CPButton alloc] initWithFrame: CGRectMake(30, 272, 200, 152)];
    [buttonTwo setBackgroundColor: [CPColor clearColor]];
    [buttonTwo setBordered:NO];
    [buttonTwo setImage:twoImage];
    [self setCornerRadius:10.0 ofButton:buttonTwo];

    [contentWindow addSubview:guestTitleLabel];
    [_fgMainWindow addSubview: contentWindow];
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

    [questionTitle setStringValue:"Vraag 1 van de 2"];
    [question setStringValue:"empty"];

    [_maandagButton setAlphaValue:0];
    [_woensdagButton setAlphaValue:0];
    [_vrijdagButton setAlphaValue:0];
    [_mainWindow setAlphaValue:0];
    [_fgMainWindow setAlphaValue:0];
    [_upButton setAlphaValue:0];
    [_bottomButton setAlphaValue:0];
    [_fgMainWindow setAlphaValue:0];
    [_quizMainWindow setAlphaValue:0];
    [_quiz3MainWindow setFrame:hideFrame];
    [_quiz4MainWindow setFrame:hideFrame];

    [_fg2MainWindow setFrame:hideFrame];

    [_catMainWindow setFrame:hideFrame];

    [_sw1MainWindow setFrame:hideFrame];
    [_sw2MainWindow setFrame:hideFrame];
    [_sw3MainWindow setFrame:hideFrame];

    [_aQ1MainWindow setFrame:hideFrame];
    [_aQ2MainWindow setFrame:hideFrame];

    [_backButton setFrame:backFrame];


    [_quiz2MainWindow setFrame:CGRectMake(51, 125, 840, 575)];
    [_quiz2MainWindow setBackgroundColor:[CPColor clearColor]];

    var oneStarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_ster1.png" size:CGSizeMake(200,150)];
    var oneStar = [[CPImageView alloc] initWithFrame:CGRectMake(20, 100, 200, 150)];
    [oneStar setImage:oneStarImage];

    var twoStarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_ster2.png" size:CGSizeMake(200,150)];
    var twoStar = [[CPImageView alloc] initWithFrame:CGRectMake(20, 100, 200, 150)];
    [twoStar setImage:twoStarImage];

    var threeStarImage = [[CPImage alloc] initWithContentsOfFile:"Resources/ico_ster3.png" size:CGSizeMake(200,150)];
    var threeStar = [[CPImageView alloc] initWithFrame:CGRectMake(20, 100, 200, 150)];
    [threeStar setImage:threeStarImage];

    var puppyLabel = [[CPTextField alloc] initWithFrame:CGRectMake(50, 300, 170, 80)];
    [puppyLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [puppyLabel setStringValue:"4 t/m 6 jaar"];
    [puppyLabel sizeToFit];
    [puppyLabel setTextColor: [CPColor whiteColor]];
    [puppyLabel setLineBreakMode: CPLineBreakByWordWrapping];

    var labradorLabel = [[CPTextField alloc] initWithFrame:CGRectMake(40, 300, 170, 80)];
    [labradorLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [labradorLabel setStringValue:"6 t/m 12 jaar"];
    [labradorLabel sizeToFit];
    [labradorLabel setTextColor: [CPColor whiteColor]];
    [labradorLabel setLineBreakMode: CPLineBreakByWordWrapping];

    var bulldogLabel = [[CPTextField alloc] initWithFrame:CGRectMake(35, 300, 170, 80)];
    [bulldogLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [bulldogLabel setStringValue:"12 t/m 18 jaar"];
    [bulldogLabel sizeToFit];
    [bulldogLabel setTextColor: [CPColor whiteColor]];
    [bulldogLabel setLineBreakMode: CPLineBreakByWordWrapping];

    _puppyButton = [[CPButton alloc] initWithFrame: CGRectMake(20, 50, 250, 370)];
    [_puppyButton setBackgroundColor: activeOrangeColor];
    [_puppyButton setAction:@selector(puppy)];
    [_puppyButton setBordered:NO];

    _labradorButton = [[CPButton alloc] initWithFrame: CGRectMake(20 + 250 + 25, 50, 250, 370)];
    [_labradorButton setBackgroundColor: activeOrangeColor];
    [_labradorButton setAction:@selector(labrador)];
    [_labradorButton setBordered:NO];

    _bulldogButton = [[CPButton alloc] initWithFrame: CGRectMake(20 + 250 + 25 + 250 + 25, 50, 250, 370)];
    [_bulldogButton setBackgroundColor: activeOrangeColor];
    [_bulldogButton setAction:@selector(bulldog)];
    [_bulldogButton setBordered:NO];

    [self setCornerRadius:10.0 ofButton:_puppyButton];
    [self setCornerRadius:10.0 ofButton:_labradorButton];
    [self setCornerRadius:10.0 ofButton:_bulldogButton];

    [_baseView addSubview:_quiz2MainWindow];
    [_quiz2MainWindow addSubview:_puppyButton];
    [_quiz2MainWindow addSubview:_labradorButton];
    [_quiz2MainWindow addSubview:_bulldogButton];
    [_puppyButton addSubview:oneStar];
    [_labradorButton addSubview:twoStar];
    [_bulldogButton addSubview:threeStar];
    [_puppyButton addSubview: puppyLabel];
    [_labradorButton addSubview: labradorLabel];
    [_bulldogButton addSubview: bulldogLabel];
}


- (void) puppy {
    [_quiz2MainWindow setFrame:hideFrame];

    _quizMainWindow = [[CPView alloc] initWithFrame:CGRectMake(51, 125, 840, 575)];
    [_quizMainWindow setBackgroundColor:[CPColor clearColor]];
    [self setCornerRadius: 10.0 ofView:_quizMainWindow]



    var titleLabel = [[CPTextField alloc] initWithFrame:CGRectMake(110, 30, 170, 80)];
    [titleLabel setFont:[CPFont fontWithName:"Helvetica" size:40.0]];
    [titleLabel setStringValue:"Kies een aflevering"];
    [titleLabel sizeToFit];
    [titleLabel setTextColor: [CPColor darkGrayColor]];
    [titleLabel setLineBreakMode: CPLineBreakByWordWrapping];

    var newLabel = [[CPTextField alloc] initWithFrame:CGRectMake(110, 115, 170, 80)];
    [newLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [newLabel setStringValue:"Nieuwste afleveringen"];
    [newLabel sizeToFit];
    [newLabel setTextColor:activeOrangeColor];
    [newLabel setLineBreakMode: CPLineBreakByWordWrapping];

    var latestLabel = [[CPTextField alloc] initWithFrame:CGRectMake(110, 315, 170, 80)];
    [latestLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [latestLabel setStringValue:"Laatste afleveringen"];
    [latestLabel sizeToFit];
    [latestLabel setTextColor:activeOrangeColor];
    [latestLabel setLineBreakMode: CPLineBreakByWordWrapping];

    var rechtsim = [[CPImage alloc] initWithContentsOfFile:"Resources/knop-rechts01.png" size:CPSizeMake(50, 130)];
    var linksim = [[CPImage alloc] initWithContentsOfFile:"Resources/knop-links01.png" size:CPSizeMake(50, 130)];

    topleft = [[CPButton alloc] initWithFrame:CGRectMake(30, 150, 50, 130)];
    [topleft setBackgroundColor:[CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0.0/255.0 alpha:1.0]];
    [topleft setBordered:NO];
    [topleft setTitle:"<"];
    [topleft setAlphaValue:1];
    [topleft setImage:linksim];

    topRight = [[CPButton alloc] initWithFrame:CGRectMake(740, 150, 50, 130)];
    [topRight setBackgroundColor:[CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0.0/255.0 alpha:1.0]];
    [topRight setBordered:NO];
    [topRight setTitle:">"];
    [topRight setAlphaValue:1];
    [topRight setImage:rechtsim];

    bottomLeft = [[CPButton alloc] initWithFrame:CGRectMake(30, 350, 50, 130)];
    [bottomLeft setBackgroundColor:[CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0.0/255.0 alpha:1.0]];
    [bottomLeft setBordered:NO];
    [bottomLeft setTitle:"<"];
    [bottomLeft setAlphaValue:1];
    [bottomLeft setImage:linksim];


    bottomRight = [[CPButton alloc] initWithFrame:CGRectMake(740, 350, 50, 130)];
    [bottomRight setBackgroundColor:[CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0.0/255.0 alpha:1.0]];
    [bottomRight setBordered:NO];
    [bottomRight setTitle:">"];
    [bottomRight setAlphaValue:1];
    [bottomRight setImage:rechtsim];

    [self setCornerRadius: 10.0 ofButton:topleft];
    [self setCornerRadius: 10.0 ofButton:topRight];
    [self setCornerRadius: 10.0 ofButton:bottomLeft];
    [self setCornerRadius: 10.0 ofButton:bottomRight];

    var oneImage = [[CPImage alloc] initWithContentsOfFile:"Resources/q1.png" size:CGSizeMake(200,152)];
    var twoImage = [[CPImage alloc] initWithContentsOfFile:"Resources/q2.png" size:CGSizeMake(200,152)];


    var one = [[CPButton alloc] initWithFrame:CGRectMake(110, 150, 190, 130)];
    [one setBackgroundColor:[CPColor clearColor]];
    [one setAction:@selector(oneClick)];
    [one setBordered:NO];
    [one setAlphaValue:1];
    [one setImage:oneImage];

    var two = [[CPButton alloc] initWithFrame:CGRectMake(230 + 80, 150, 190, 130)];
    [two setBackgroundColor:[CPColor clearColor]];
    [two setBordered:NO];
    [two setTitle:"Vid 1"];
    [two setAlphaValue:1];
    [two setImage:twoImage];

    var three = [[CPButton alloc] initWithFrame:CGRectMake(425  + 85, 150, 190, 130)];
    [three setBackgroundColor:[CPColor clearColor]];
    [three setBordered:NO];
    [three setTitle:"Vid 1"];
    [three setAlphaValue:1];
    [three setImage:oneImage];

    var four = [[CPButton alloc] initWithFrame:CGRectMake(35  + 75, 350, 190, 130)];
    [four setBackgroundColor:[CPColor clearColor]];
    [four setBordered:NO];
    [four setTitle:"Vid 1"];
    [four setAlphaValue:1];
    [four setImage:twoImage];

    var five = [[CPButton alloc] initWithFrame:CGRectMake(230  + 80, 350, 190, 130)];
    [five setBackgroundColor:[CPColor clearColor]];
    [five setBordered:NO];
    [five setTitle:"Vid 1"];
    [five setAlphaValue:1];
    [five setImage:oneImage];

    var six = [[CPButton alloc] initWithFrame:CGRectMake(425  + 85, 350, 190, 130)];
    [six setBackgroundColor:[CPColor clearColor]];
    [six setBordered:NO];
    [six setTitle:"Vid 1"];
    [six setAlphaValue:1];
    [six setImage:twoImage];

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
    [_quizMainWindow addSubview:newLabel];
    [_quizMainWindow addSubview:latestLabel];

}

- (void) oneClick {
    [_quizMainWindow setFrame:hideFrame];


    [_quiz3MainWindow setFrame:CGRectMake(51, 125, 840, 575)];
    [_quiz3MainWindow setBackgroundColor:[CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0.0/255.0 alpha:1.0]];
    [self setCornerRadius: 10.0 ofView:_quiz3MainWindow];

    [questionTitle setFrame:CGRectMake(0, 40, 840, 40)];
    [questionTitle setStringValue:"Vraag 1 van de 2"];
    [questionTitle setAlignment:CPCenterTextAlignment];
    [questionTitle setFont:[CPFont fontWithName:"Helvetica-Bold" size: 30.0]];

    [question setFrame:CGRectMake(0, 80, 840, 40)];
    [question setStringValue:"Waar op de aarde leeft koraal?"];
    [question setFont:[CPFont fontWithName:"Helvetica-Bold" size: 30.0]];
    [question setAlignment:CPCenterTextAlignment];

    var answerImage1 = [[CPImage alloc] initWithContentsOfFile:"Resources/oerwoud01.png" size:CPSizeMake(225, 225)];
    var answerImage2 = [[CPImage alloc] initWithContentsOfFile:"Resources/woestijn01.png" size:CPSizeMake(225, 225)];
    var answerImage3 = [[CPImage alloc] initWithContentsOfFile:"Resources/zeebodem01.png" size:CPSizeMake(225, 225)];

    answerImageView1 = [[CPImageView alloc] initWithFrame:CGRectMake(12, 20, 225, 225)];
    [answerImageView1 setImage:answerImage1];
    [answerImageView1 setBackgroundColor:[CPColor clearColor]];

    answerImageView2 = [[CPImageView alloc] initWithFrame:CGRectMake(12, 20, 225, 225)];
    [answerImageView2 setImage:answerImage2];
    [answerImageView2 setBackgroundColor:[CPColor clearColor]];

    answerImageView3 = [[CPImageView alloc] initWithFrame:CGRectMake(12, 20, 225, 225)];
    [answerImageView3 setImage:answerImage3];
    [answerImageView3 setBackgroundColor:[CPColor clearColor]];

    answerA = [[CPButton alloc] initWithFrame: CGRectMake(20, 130, 250, 370)];
    [answerA setBackgroundColor: [CPColor whiteColor]];
    [answerA setAction:@selector(answerA1)];
    [answerA setBordered:NO];

    answerB = [[CPButton alloc] initWithFrame: CGRectMake(20 + 250 + 25, 130, 250, 370)];
    [answerB setBackgroundColor:[CPColor whiteColor]];
    [answerB setAction:@selector(answerB1)];
    [answerB setBordered:NO];

    answerC = [[CPButton alloc] initWithFrame: CGRectMake(20 + 250 + 25 + 250 + 25, 130, 250, 370)];
    [answerC setBackgroundColor: [CPColor whiteColor]];
    [answerC setAction:@selector(answerCFunc)];
    [answerC setBordered:NO];

    answerALabel = [[CPTextField alloc] initWithFrame:CGRectMake(0, 300, 250, 40)];
    [answerALabel setStringValue:"Oerwoud"];
    [answerALabel setAlignment:CPCenterTextAlignment];
    [answerALabel setFont:[CPFont fontWithName:"Helvetica-Bold" size: 30.0]];

    answerBLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0, 300, 250, 40)];
    [answerBLabel setStringValue:"Woestijn"];
    [answerBLabel setAlignment:CPCenterTextAlignment];
    [answerBLabel setFont:[CPFont fontWithName:"Helvetica-Bold" size: 30.0]];

    answerCLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0, 300, 250, 40)];
    [answerCLabel setStringValue:"Zeebodem"];
    [answerCLabel setAlignment:CPCenterTextAlignment];
    [answerCLabel setFont:[CPFont fontWithName:"Helvetica-Bold" size: 30.0]];

    [answerCLabel setTextColor:[CPColor blackColor]];
    [answerBLabel setTextColor:[CPColor blackColor]];
    [answerALabel setTextColor:[CPColor blackColor]];



    [_baseView addSubview:_quiz3MainWindow];
    [_quiz3MainWindow addSubview:questionTitle];
    [_quiz3MainWindow addSubview:question];
    [_quiz3MainWindow addSubview:answerA];
    [_quiz3MainWindow addSubview:answerB];
    [_quiz3MainWindow addSubview:answerC];
    [answerA addSubview:answerALabel];
    [answerB addSubview:answerBLabel];
    [answerC addSubview:answerCLabel];
    [answerA addSubview:answerImageView1];
    [answerB addSubview:answerImageView2];
    [answerC addSubview:answerImageView3];
}

- (void) answerCFunc {
    [answerCLabel setTextColor:[CPColor greenColor]];
        setTimeout(
            function() {
                [self answerCFunc2];
        },2000);
}

- (void) answerCFunc2 {
    [questionTitle setStringValue:"Vraag 2 van de 2"];
    [question setStringValue:"Hoe kun je koraal het beste van dichtbij bekijken?"];

    var answerImage1 = [[CPImage alloc] initWithContentsOfFile:"Resources/duiken01.png" size:CPSizeMake(225, 225)];
    var answerImage2 = [[CPImage alloc] initWithContentsOfFile:"Resources/luchtballon01.png" size:CPSizeMake(225, 225)];
    var answerImage3 = [[CPImage alloc] initWithContentsOfFile:"Resources/fietsen01.png" size:CPSizeMake(225, 225)];
    [answerImageView1 setImage:answerImage1];
    [answerImageView2 setImage:answerImage2];
    [answerImageView3 setImage:answerImage3];

    [answerALabel setStringValue:"Duiken"];
    [answerA setAction:@selector(answerAFunc)];
    [answerBLabel setStringValue:"Luchtballon"];
    [answerCLabel setStringValue:"Fietsen"];
    [answerCLabel setTextColor:[CPColor blackColor]];
    [answerBLabel setTextColor:[CPColor blackColor]];
    [answerALabel setTextColor:[CPColor blackColor]];
    [answerC setAction:nil];
    [answerC setAction:@selector(answerC1)];
}

- (void) answerAFunc {
        [answerALabel setTextColor:[CPColor greenColor]];
        setTimeout(
            function() {
                [self answerAFunc2];
        },2000);
}

- (void) answerAFunc2 {
    [_quiz3MainWindow setFrame:hideFrame];

    [_quiz4MainWindow setFrame:CGRectMake(51, 125, 840, 575)];
    [_quiz4MainWindow setBackgroundColor:[CPColor clearColor]];
    [self setCornerRadius: 10.0 ofView:_quiz4MainWindow];

    var firstLine = [[CPTextField alloc] initWithFrame:CGRectMake(0, 40, 840, 40)];
    [firstLine setStringValue:"Goed gedaan!"];
    [firstLine setAlignment:CPCenterTextAlignment];
    [firstLine setTextColor:[CPColor colorWithCalibratedRed:124.0/255.0 green:124.0/255.0 blue:124.0/255.0 alpha:1.0]];
    [firstLine setFont:[CPFont fontWithName:"Helvetica-Bold" size: 30.0]];

    var secondLine = [[CPTextField alloc] initWithFrame:CGRectMake(0, 80, 840, 40)];
    [secondLine setStringValue:"Kijk ook hoe Joris gaat duiken!"];
    [secondLine setFont:[CPFont fontWithName:"Helvetica-Bold" size: 30.0]];
    [secondLine setTextColor:[CPColor colorWithCalibratedRed:124.0/255.0 green:124.0/255.0 blue:124.0/255.0 alpha:1.0]];
    [secondLine setAlignment:CPCenterTextAlignment];

    var videoWebView = [[CPWebView alloc] initWithFrame:CGRectMake(170, 140, 500, 300)];
    [videoWebView setMainFrameURL:"http://rizkicalame.com/test/joris.html"];
    [videoWebView setBackgroundColor:[CPColor clearColor]];
    [videoWebView setScrollMode:CPWebViewScrollNone];

    var doneButton = [[CPButton alloc] initWithFrame:CGRectMake(320, 480, 200, 50)];
    [doneButton setBackgroundColor:[CPColor colorWithCalibratedRed:255.0/255.0 green:162.0/255.0 blue:0.0/255.0 alpha:1.0]];
    [doneButton setBordered:NO];
    [doneButton setTextColor:[CPColor whiteColor]];
    [doneButton setFont:[CPFont fontWithName:"Helvetica-Bold" size: 20.0]];
    [doneButton setTitle:"Speel nog een quiz!"];
    [doneButton setAction:@selector(playQuiz)];
    [self setCornerRadius:10.0 ofButton:doneButton];

    [_baseView addSubview: _quiz4MainWindow];
    [_quiz4MainWindow addSubview: firstLine];
    [_quiz4MainWindow addSubview: secondLine];
    [_quiz4MainWindow addSubview: doneButton];
    [_quiz4MainWindow addSubview: videoWebView];
}

- (void) answerC1 {
    [answerCLabel setTextColor:[CPColor redColor]];
}

- (void) answerA1 {
    [answerALabel setTextColor:[CPColor redColor]];
}

- (void) answerB1 {
    [answerBLabel setTextColor:[CPColor redColor]];
}

- (void) homeFunction {
    [headerTitle setStringValue:"Te gast"];
    [headerTitle setTextColor:activeBlueColor];
    [headerTitle sizeToFit];

    [_fgMainWindow setFrame:hideFrame];
    [_fg2MainWindow setFrame:hideFrame];
    [_quizMainWindow setFrame:hideFrame];
    [_quiz2MainWindow setFrame:hideFrame];
    [_quiz3MainWindow setFrame:hideFrame];
    [_quiz4MainWindow setFrame:hideFrame];
    [_catMainWindow setFrame:hideFrame];
    [_sw1MainWindow setFrame:hideFrame];
    [_sw2MainWindow setFrame:hideFrame];
    [_sw3MainWindow setFrame:hideFrame];
    [_aQ1MainWindow setFrame:hideFrame];
    [_aQ2MainWindow setFrame:hideFrame];

    [_backButton setFrame:hideFrame];

    [_maandagButton setAlphaValue:1];
    [_woensdagButton setAlphaValue:1];
    [_vrijdagButton setAlphaValue:1];
    [_mainWindow setAlphaValue:1];


    //To set nil
    [_fgMainWindow setAlphaValue:0];
    [_upButton setAlphaValue:0];
    [_bottomButton setAlphaValue:0];
    [_quizMainWindow setAlphaValue:0];

    [_maandagButton setAction:@selector(maandagFunction)];
    [_woensdagButton setAction:@selector(woensdagFunction)];
    [_vrijdagButton setAction:@selector(vrijdagFunction)];
}

- (void) backFunction {
    var arrayCount = [vcArray count];

    console.log([vcArray lastObject]);

    switch ([vcArray lastObject]) {
        case 0 :
            console.log("Maandag");
            [vcArray removeLastObject];
            break;

        case 1 :
            console.log("Woensdag");
            [vcArray removeLastObject];
            break;

        case 2 :
            console.log("Woensdag");
            [vcArray removeLastObject];
            break;

        default:
            console.log("Nothing...");
            [vcArray removeLastObject];
    }
}

- (void) searchSub {
    [_fg2MainWindow setFrame:hideFrame];
    [_upButton setAlphaValue: 1];
    [_bottomButton setAlphaValue: 1];

    var muziekim = [[CPImage alloc] initWithContentsOfFile:"Resources/Muziek01.png" size:CPSizeMake(170, 170)];
    var sportim = [[CPImage alloc] initWithContentsOfFile:"Resources/Sport01.png" size:CPSizeMake(170, 170)];
    var weerim = [[CPImage alloc] initWithContentsOfFile:"Resources/Weer01.png" size:CPSizeMake(170, 170)];
    var hobbiesim = [[CPImage alloc] initWithContentsOfFile:"Resources/Hobbies01.png" size:CPSizeMake(170, 170)];
    var natuurim = [[CPImage alloc] initWithContentsOfFile:"Resources/Natuur01.png" size:CPSizeMake(170, 170)];
    var nieuwsim = [[CPImage alloc] initWithContentsOfFile:"Resources/Nieuws01.png" size:CPSizeMake(170, 170)];
    var filmim = [[CPImage alloc] initWithContentsOfFile:"Resources/Film01.png" size:CPSizeMake(170, 170)];
    var gameim = [[CPImage alloc] initWithContentsOfFile:"Resources/Games01.png" size:CPSizeMake(170, 170)];


    _catMainWindow = [[CPView alloc] initWithFrame:CGRectMake(51, 125, 840, 575)];
    [_catMainWindow setBackgroundColor:[CPColor clearColor]];

    var textLabel = [[CPTextField alloc] initWithFrame:CGRectMake(25, 0, 0, 0)];
    [textLabel setStringValue:"Kies een genre"];
    [textLabel setFont:[CPFont fontWithName:"Helvetica" size:30.0]];
    [textLabel setTextColor:[CPColor darkGrayColor]];
    [textLabel sizeToFit];

    var muziekButton = [[CPButton alloc] initWithFrame:CGRectMake(50, 50, 170, 170)];
    [muziekButton setBackgroundColor:activeBlueColor];
    [muziekButton setTitle:"Muziek"];
    [muziekButton setBordered:NO];
    [muziekButton setImage:muziekim];
    [self setCornerRadius:10.0 ofButton:muziekButton];

    var sportButton = [[CPButton alloc] initWithFrame:CGRectMake(50 + 170 + 20, 50, 170, 170)];
    [sportButton setBackgroundColor:activeBlueColor];
    [sportButton setTitle:"Sport"];
    [sportButton setBordered:NO];
    [sportButton setImage:sportim];
    [self setCornerRadius:10.0 ofButton:sportButton];


    var weerButton = [[CPButton alloc] initWithFrame:CGRectMake(50 + 170 + 20 + 170 + 20, 50, 170, 170)];
    [weerButton setBackgroundColor:activeBlueColor];
    [weerButton setTitle:"Weer"];
    [weerButton setBordered:NO];
    [weerButton setImage:weerim];
    [self setCornerRadius:10.0 ofButton:weerButton];

    var hobbiesButton = [[CPButton alloc] initWithFrame:CGRectMake(50 + 170 + 20 + 170 + 20 + 170 + 20, 50, 170, 170)];
    [hobbiesButton setBackgroundColor:activeBlueColor];
    [hobbiesButton setTitle:"Hobbies"];
    [hobbiesButton setBordered:NO];
    [hobbiesButton setImage:hobbiesim];
    [self setCornerRadius:10.0 ofButton:hobbiesButton];

    var natuurButton = [[CPButton alloc] initWithFrame:CGRectMake(50, 250, 170, 170)];
    [natuurButton setBackgroundColor:activeBlueColor];
    [natuurButton setTitle:"Natuur"];
    [natuurButton setBordered:NO];
    [natuurButton setImage:natuurim];
    [self setCornerRadius:10.0 ofButton:natuurButton];

    var nieuwsButton = [[CPButton alloc] initWithFrame:CGRectMake(50 + 170 + 20, 250, 170, 170)];
    [nieuwsButton setBackgroundColor:activeBlueColor];
    [nieuwsButton setTitle:"Nieuws"];
    [nieuwsButton setBordered:NO];
    [nieuwsButton setImage:nieuwsim];
    [self setCornerRadius:10.0 ofButton:nieuwsButton];

    var filmButton = [[CPButton alloc] initWithFrame:CGRectMake(50 + 170 + 20 + 170 + 20, 250, 170, 170)];
    [filmButton setBackgroundColor:activeBlueColor];
    [filmButton setTitle:"Film"];
    [filmButton setBordered:NO];
    [filmButton setImage:filmim];
    [self setCornerRadius:10.0 ofButton:filmButton];

    var gameButton = [[CPButton alloc] initWithFrame:CGRectMake(50 + 170 + 20 + 170 + 20 + 170 + 20, 250, 170, 170)];
    [gameButton setBackgroundColor:activeBlueColor];
    [gameButton setTitle:"Games"];
    [gameButton setBordered:NO];
    [gameButton setImage:gameim];
    [self setCornerRadius:10.0 ofButton:gameButton];

    [_baseView addSubview:_catMainWindow];
    [_catMainWindow addSubview:textLabel];
    [_catMainWindow addSubview:muziekButton];
    [_catMainWindow addSubview:sportButton];
    [_catMainWindow addSubview:weerButton];
    [_catMainWindow addSubview:hobbiesButton];
    [_catMainWindow addSubview:natuurButton];
    [_catMainWindow addSubview:nieuwsButton];
    [_catMainWindow addSubview:filmButton];
    [_catMainWindow addSubview:gameButton];


}

- (void) sendWork {
    [_maandagButton setAlphaValue:0];
    [_woensdagButton setAlphaValue:0];
    [_vrijdagButton setAlphaValue:0];
    [_mainWindow setAlphaValue:0];
    [_catMainWindow setFrame:hideFrame];
    [_fgMainWindow setFrame:hideFrame];
    [_fg2MainWindow setFrame:hideFrame];
    [_quizMainWindow setFrame:hideFrame];
    [_quiz2MainWindow setFrame:hideFrame];
    [_quiz3MainWindow setFrame:hideFrame];
    [_quiz4MainWindow setFrame:hideFrame];
    [_aQ1MainWindow setFrame:hideFrame];
    [_aQ2MainWindow setFrame:hideFrame];

    [_backButton setFrame:backFrame];

    [_sw2MainWindow setFrame:hideFrame];
    [_sw3MainWindow setFrame:hideFrame];

    [headerTitle setStringValue:"Jouw werk in de uitzending"];
    [headerTitle sizeToFit];
    [headerTitle setTextColor:[CPColor colorWithCalibratedRed:139.0/255.0 green:228.0/255.0 blue:66.0/255.0 alpha:1.0]]

    [_sw1MainWindow setFrame:CGRectMake(51, 125, 840, 575)];
    [_sw1MainWindow setBackgroundColor:[CPColor colorWithCalibratedRed:139.0/255.0 green:228.0/255.0 blue:66.0/255.0 alpha:1.0]];
    [self setCornerRadius: 10.0 ofView:_sw1MainWindow];

    var cameraBG = [[CPView alloc] initWithFrame:CGRectMake(21, 80, 388, 291)];
    [cameraBG setBackgroundColor:[CPColor blackColor]];

    var cameraView = [[CPButton alloc] initWithFrame:CGRectMake(26, 30, 336, 231)];
    [cameraView setBackgroundColor:[CPColor colorWithCalibratedRed:139.0/255.0 green:228.0/255.0 blue:66.0/255.0 alpha:1.0]];
    [cameraView setAction:@selector(cameraOn)];
    [cameraView setBordered:NO];

    var cameraImage = [[CPImage alloc] initWithContentsOfFile:"Resources/Symbool-camera01.png" size:CPSizeMake(130, 130)];
    var cameraImageView = [[CPImageView alloc] initWithFrame:CGRectMake(40, 10, 256, 211)];
    [cameraImageView setImage:cameraImage];
    [cameraImageView setBackgroundColor:[CPColor clearColor]];

    var description = [[CPView alloc] initWithFrame:CGRectMake(21 + 21 + 388, 80, 388, 291)];
    [description setBackgroundColor:[CPColor whiteColor]];

    descriptionLabelSW = [[CPTextField alloc] initWithFrame:CGRectMake(10, 10, 380, 260)];
    [descriptionLabelSW setFont:[CPFont fontWithName:"Helvetica-Bold" size: 20.0]];
    [descriptionLabelSW setDelegate:self];
    [descriptionLabelSW setStringValue:"voer hier een omschrijving in!"];
    [descriptionLabelSW setEditable:YES];
    [descriptionLabelSW setTextColor:[CPColor colorWithCalibratedRed:124.0/255.0 green:124.0/255.0 blue:124.0/255.0 alpha:1.0]];

    var checkBox = [[CPCheckBox alloc] initWithFrame:CGRectMake(21, 80 + 291 + 10, 20, 20)];
    [checkBox setBackgroundColor:[CPColor clearColor]];

    var checkLabel = [[CPTextField alloc] initWithFrame:CGRectMake(21 + 25, 80 + 291 + 12, 0, 0)];
    [checkLabel setFont:[CPFont fontWithName:"Helvetica-Bold" size: 15.0]];
    [checkLabel setStringValue:"Ik wil het graag zelf presenteren!"];
    [checkLabel sizeToFit];
    [checkLabel setTextColor:[CPColor whiteColor]];

    var doneButton = [[CPButton alloc] initWithFrame:CGRectMake(335, 505, 170, 50)];
    [doneButton setBackgroundColor:[CPColor colorWithCalibratedRed:100.0/255.0 green:189.0/255.0 blue:27.0/255.0 alpha:1.0]];
    [doneButton setBordered:NO];
    [doneButton setTextColor:[CPColor whiteColor]];
    [doneButton setFont:[CPFont fontWithName:"Helvetica-Bold" size:20.0]];
    [doneButton setTitle:"Klaar!"];
    [doneButton setAction:@selector(sendWorkDone)];
    [self setCornerRadius: 10.0 ofButton:doneButton];



    [_baseView addSubview:_sw1MainWindow];
    [_sw1MainWindow addSubview:cameraBG];
    [cameraBG addSubview:cameraView];
    [cameraView addSubview:cameraImageView];
    [_sw1MainWindow addSubview:description];
    [_sw1MainWindow addSubview:checkBox];
    [_sw1MainWindow addSubview:checkLabel];
    [_sw1MainWindow addSubview:doneButton];
    [description addSubview:descriptionLabelSW];
}

- (void)controlTextDidChange: (CPTextField)aTextField {
    console.log("textfield change lol");
}

- (void) sendWorkDone {
    [_sw1MainWindow setFrame: hideFrame];
    [_sw2MainWindow setFrame: hideFrame];

    [_sw3MainWindow setFrame:CGRectMake(51, 125, 840, 575)];
    [_sw3MainWindow setBackgroundColor:[CPColor clearColor]];
    [self setCornerRadius: 10.0 ofView:_sw3MainWindow];

    var title = [[CPTextField alloc] initWithFrame:CGRectMake(260, 40, 0, 0)];
    [title setStringValue:"Je werk is opgestuurd!"];
    [title setFont:[CPFont fontWithName:"Helvetica-Bold" size: 30.0]];
    [title setTextColor:[CPColor colorWithCalibratedRed:123.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0]]
    [title sizeToFit];

    var thumbsUp = [[CPImage alloc] initWithContentsOfFile:"Resources/symbool-hand01.png" size:CPSizeMake(130, 130)];
    var thumbsUpImage = [[CPImageView alloc] initWithFrame:CGRectMake(290, 100, 260, 260)];
    [thumbsUpImage setImage:thumbsUp];
    [thumbsUpImage setBackgroundColor:[CPColor colorWithCalibratedRed:139.0/255.0 green:228.0/255.0 blue:66.0/255.0 alpha:1.0]];
    [self setCornerRadius:10.0 ofImage:thumbsUpImage];

    var doneButton = [[CPButton alloc] initWithFrame:CGRectMake(320, 480, 200, 50)];
    [doneButton setBackgroundColor:[CPColor colorWithCalibratedRed:139.0/255.0 green:228.0/255.0 blue:66.0/255.0 alpha:1.0]];
    [doneButton setBordered:NO];
    [doneButton setTitle:"Naar home"];
    [doneButton setAction:@selector(homeFunction)];
    [doneButton setTextColor:[CPColor whiteColor]];
    [doneButton setFont:[CPFont fontWithName:"Helvetica-Bold" size:20.0]];
    [self setCornerRadius: 10.0 ofButton:doneButton];

    [_baseView addSubview:_sw3MainWindow];
    [_sw3MainWindow addSubview: title];
    [_sw3MainWindow addSubview:thumbsUpImage];
    [_sw3MainWindow addSubview:doneButton];
}

- (void) cameraOn {
    [_sw1MainWindow setFrame:hideFrame];

    console.log("remove");

    [_sw2MainWindow setFrame:CGRectMake(51, 125, 840, 575)];
    [_sw2MainWindow setBackgroundColor:[CPColor colorWithCalibratedRed:139.0/255.0 green:228.0/255.0 blue:66.0/255.0 alpha:1.0]];
    [self setCornerRadius: 10.0 ofView:_sw2MainWindow];

    [cameraActivate setFrame:CGRectMake(21, 21, 798, 485)];
    [cameraActivate setBackgroundColor:[CPColor blackColor]];


    var doneButton = [[CPButton alloc] initWithFrame:CGRectMake(441, 520, 379, 50)];
    [doneButton setBackgroundColor:[CPColor colorWithCalibratedRed:100.0/255.0 green:189.0/255.0 blue:27.0/255.0 alpha:1.0]];
    [doneButton setBordered:NO];
    [doneButton setAction:@selector(sendWork)];

    var againButton = [[CPButton alloc] initWithFrame:CGRectMake(21, 520, 379, 50)];
    [againButton setBackgroundColor:[CPColor colorWithCalibratedRed:100.0/255.0 green:189.0/255.0 blue:27.0/255.0 alpha:1.0]];
    [againButton setBordered:NO];


    [_baseView addSubview:_sw2MainWindow];
    [_sw2MainWindow addSubview:cameraActivate];
    [_sw2MainWindow addSubview: doneButton];
    [_sw2MainWindow addSubview: againButton];
}

- (void)askQuestion {
    [_maandagButton setAlphaValue:0];
    [_woensdagButton setAlphaValue:0];
    [_vrijdagButton setAlphaValue:0];
    [_mainWindow setAlphaValue:0];
    [_catMainWindow setFrame:hideFrame];

    [_backButton setFrame:backFrame];

    [_aQ2MainWindow setFrame:hideFrame];

    [_fgMainWindow setFrame:hideFrame];
    [_fg2MainWindow setFrame:hideFrame];

    [_quizMainWindow setFrame:hideFrame];
    [_quiz2MainWindow setFrame:hideFrame];
    [_quiz3MainWindow setFrame:hideFrame];
    [_quiz4MainWindow setFrame:hideFrame];

    [_sw1MainWindow setFrame:hideFrame];
    [_sw2MainWindow setFrame:hideFrame];
    [_sw3MainWindow setFrame:hideFrame];

    [headerTitle setStringValue:"Stel je vraag aan de gast!"];
    [headerTitle sizeToFit];
    [headerTitle setTextColor:[CPColor colorWithCalibratedRed:218.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0]];

    var guestName = [[CPTextField alloc] initWithFrame:CGRectMake(21, 21, 0, 0)];
    [guestName setStringValue:"Nick en Simon"];
    [guestName setTextColor:[CPColor whiteColor]];
    [guestName setFont:[CPFont fontWithName:"Helvetica-Bold" size: 25.0]];
    [guestName sizeToFit];

    var guestImage = [[CPImage alloc] initWithContentsOfFile:"Resources/NickEnSimon02.png" size:CPSizeMake(350, 280)];
    var guestImageView = [[CPImageView alloc] initWithFrame:CGRectMake(21, 70, 350, 280)];
    [guestImageView setImage:guestImage];
    [guestImageView setBackgroundColor:[CPColor clearColor]];

    var sectionName = [[CPTextField alloc] initWithFrame:CGRectMake(21, 360, 0, 0)];
    [sectionName setStringValue:"Bij Babbels"];
    [sectionName setTextColor:[CPColor whiteColor]];
    [sectionName setFont:[CPFont fontWithName:"Helvetica-Bold" size: 25.0]];
    [sectionName sizeToFit];

    var genreName = [[CPTextField alloc] initWithFrame:CGRectMake(21, 390, 0, 0)];
    [genreName setStringValue:"Genre: muziek"];
    [genreName setTextColor:[CPColor whiteColor]];
    [genreName setFont:[CPFont fontWithName:"Helvetica-Bold" size: 25.0]];
    [genreName sizeToFit];

    var checkBox = [[CPCheckBox alloc] initWithFrame:CGRectMake(21, 423, 20, 20)];
    [checkBox setBackgroundColor:[CPColor clearColor]];

    var checkLabel = [[CPTextField alloc] initWithFrame:CGRectMake(21 + 25, 425, 0, 0)];
    [checkLabel setFont:[CPFont fontWithName:"Helvetica-Bold" size: 15.0]];
    [checkLabel setStringValue:"Ik wil het graag zelf in de uitzending vragen"];
    [checkLabel setTextColor:[CPColor whiteColor]];
    [checkLabel sizeToFit];

    var doneButton = [[CPButton alloc] initWithFrame:CGRectMake(335, 505, 170, 50)];
    [doneButton setBackgroundColor:[CPColor colorWithCalibratedRed:163.0/255.0 green:48.0/255.0 blue:48.0/255.0 alpha:1.0]];
    [doneButton setBordered:NO];
    [doneButton setFont:[CPFont fontWithName:"Helvetica-Bold" size: 20.0]];
    [doneButton setTitle:"Opsturen!"];
    [doneButton setTextColor:[CPColor whiteColor]];
    [doneButton setAction:@selector(doneAsk)];
    [self setCornerRadius: 10.0 ofButton:doneButton];

    var description = [[CPView alloc] initWithFrame:CGRectMake(423, 70, 396, 350)];
    [description setBackgroundColor:[CPColor whiteColor]];

    var descriptionLabel = [[CPTextField alloc] initWithFrame:CGRectMake(10, 10, 380, 330)];
    [descriptionLabel setFont:[CPFont fontWithName:"Helvetica-Bold" size: 20.0]];
    [descriptionLabel setDelegate:self];
    [descriptionLabel setStringValue:"Stel hier je vraag!"];
    [descriptionLabel setTextColor:[CPColor colorWithCalibratedRed:124.0/255.0 green:124.0/255.0 blue:124.0/255.0 alpha:1.0]];
    [descriptionLabel setEditable:YES];
    [descriptionLabel setLineBreakMode:CPLineBreakByWordWrapping]




    [_aQ1MainWindow setFrame:CGRectMake(51, 125, 840, 575)];
    [_aQ1MainWindow setBackgroundColor:[CPColor colorWithCalibratedRed:218.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0]];
    [self setCornerRadius: 10.0 ofView:_aQ1MainWindow]

    [_baseView addSubview:_aQ1MainWindow];
    [_aQ1MainWindow addSubview: guestName];
    [_aQ1MainWindow addSubview: guestImageView];
    [_aQ1MainWindow addSubview: sectionName];
    [_aQ1MainWindow addSubview: genreName];
    [_aQ1MainWindow addSubview:checkBox];
    [_aQ1MainWindow addSubview:checkLabel];
    [_aQ1MainWindow addSubview:doneButton];
    [_aQ1MainWindow addSubview:description];
    [description addSubview:descriptionLabel];
}

- (void) doneAsk {
    [_aQ1MainWindow setFrame:hideFrame];

    [_aQ2MainWindow setFrame:CGRectMake(51, 125, 840, 575)];
    [_aQ2MainWindow setBackgroundColor:[CPColor clearColor]];
    [self setCornerRadius: 10.0 ofView:_aQ2MainWindow]

    var title = [[CPTextField alloc] initWithFrame:CGRectMake(260, 40, 0, 0)];
    [title setStringValue:"Je vraag is opgestuurd!"];
    [title setTextColor:[CPColor colorWithCalibratedRed:123.0/255.0 green:123.0/255.0 blue:123.0/255.0 alpha:1.0]]
    [title setFont:[CPFont fontWithName:"Helvetica-Bold" size: 30.0]];
    [title sizeToFit];

    var thumbsUp = [[CPImage alloc] initWithContentsOfFile:"Resources/symbool-hand01.png" size:CPSizeMake(130, 130)];
    var thumbsUpImage = [[CPImageView alloc] initWithFrame:CGRectMake(290, 100, 260, 260)];
    [thumbsUpImage setBackgroundColor:[CPColor colorWithCalibratedRed:218.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0]];
    [thumbsUpImage setImage:thumbsUp];
    [self setCornerRadius:10.0 ofView:thumbsUpImage];

    var doneButton = [[CPButton alloc] initWithFrame:CGRectMake(320, 480, 200, 50)];
    [doneButton setBackgroundColor:[CPColor colorWithCalibratedRed:218.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1.0]];
    [doneButton setBordered:NO];
    [doneButton setTitle:"Naar home"];
    [doneButton setTextColor:[CPColor whiteColor]];
    [doneButton setAction:@selector(homeFunction)];
    [self setCornerRadius: 10.0 ofButton:doneButton];
    [doneButton setFont:[CPFont fontWithName:"Helvetica-Bold" size:20.0]];


    [_aQ2MainWindow addSubview: title];
    [_aQ2MainWindow addSubview:thumbsUpImage];
    [_aQ2MainWindow addSubview:doneButton];
    [_baseView addSubview:_aQ2MainWindow];

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

- (void)setCornerRadius:(CPNumber)radius ofImage:(CPImageView)imageview{
    radius = (radius != null) ? radius : 0;
    imageview._DOMElement.style.setProperty('border-radius', radius+'px', null);
    imageview._DOMElement.style.setProperty('-moz-border-radius', radius+'px', null);
    imageview._DOMElement.style.setProperty('-webkit-border-radius', radius+'px', null);
    imageview._DOMElement.style.setProperty('border-radius', radius+'px', null);
}

- (void)setID:(CPString)id ofView:(CPView)view {
    id = (id != null) ? id : "";
    view._DOMElement.setAttribute("id", id);
}


@end
