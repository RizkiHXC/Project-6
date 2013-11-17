/*
 * AppController.j
 * NewApplication
 *
 * Created by You on January 29, 2013.
 * Copyright 2013, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPButton _maandagButton;
    CPButton _woensdagButton;
    CPButton _vrijdagButton;
    CPTextField _label;
    CPWindow _mainWindow;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    _mainWindow = [[CPView alloc] initWithFrame: CGRectMake(0, 0, 1280, 768)];
    [_mainWindow setBackgroundColor: [CPColor blueColor]];

    _label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [_label setStringValue:@"Hello World!"];
    [_label setFont:[CPFont boldSystemFontOfSize:24.0]];
    [_label sizeToFit];
    [_label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [_label setCenter:[contentView center]];

    var text = [[CPTextField alloc] initWithFrame: CGRectMake(10, 10, 100, 100)];
    [text setStringValue:"Swag"];

    var _buttonImage = [[CPImage alloc] initWithContentsOfFile:"Resources/gray.png" size:CPSizeMake(100, 200)];

    _maandagButton = [[CPButton alloc] initWithFrame: CGRectMake(0, 0, 60, 200)];
    [_maandagButton setTarget:self];
    [_maandagButton setAction:@selector(maandagFunction)];
    //[_maandagButton setBackgroundColor:[CPColor redColor]];
    //[_maandagButton setImage:_buttonImage];
    [_maandagButton setAlternateImage: nil];
    [_maandagButton setTitle:"Maandag"];

    //SET BORDERED IS NO?

    _woensdagButton = [[CPButton alloc] initWithFrame: CGRectMake(0, 200, 60, 200)];
    [_woensdagButton setTarget:self];
    [_woensdagButton setAction:@selector(woensdagFunction)];
    [_woensdagButton setBackgroundColor:[CPColor redColor]];
    [_woensdagButton setImage:_buttonImage];
    [_woensdagButton setTitle:"Woensdag"];

    _vrijdagButton = [[CPButton alloc] initWithFrame: CGRectMake(0, 400, 60, 200)];
    [_vrijdagButton setTarget:self];
    [_vrijdagButton setAction:@selector(vrijdagFunction)];
    [_vrijdagButton setBackgroundColor:[CPColor redColor]];
    [_vrijdagButton setImage:_buttonImage];
    [_vrijdagButton setTitle:"Vrijdag"];


    // Dafuq is this
    [theWindow orderFront:self];

    // Addsubviews
    [contentView addSubview:_mainWindow];
    [contentView addSubview:_label];
    [contentView addSubview: text];
    [contentView addSubview:_maandagButton];
    [contentView addSubview:_woensdagButton];
    [contentView addSubview:_vrijdagButton];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (void) maandagFunction
{
    console.log("Maandag!");
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
