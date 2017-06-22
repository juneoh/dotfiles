// Color theme for blink shell, adopted from sindresorhus/hyper-snazzy

black       = '#282a36';
red         = '#ff5c57'; // red
green       = '#5af78e'; // green
yellow      = '#f3f99d'; // yellow
blue        = '#57c7ff'; // blue
magenta     = '#ff6ac1'; // pink
cyan        = '#9aedfe'; // cyan
white       = '#f1f1f0'; // light gray
lightBlack  = '#686868'; // medium gray
lightRed    = red; // red
lightGreen  = green; // green
lightYellow = yellow; // yellow
lightBlue   = blue; // blue
lightMagenta= magenta; // pink
lightCyan   = cyan; // cyan
lightWhite  = "eff0eb"; // white

t.prefs_.set('color-palette-overrides',
                   [ black , red     , green  , yellow,
                                       blue     , magenta , cyan   , white,
                                       lightBlack   , lightRed  , lightGreen , lightYellow,
                                       lightBlue    , lightMagenta  , lightCyan  , lightWhite ]);

t.prefs_.set('cursor-color', 'rgba(0, 0, 0, 0.5)');
t.prefs_.set('foreground-color', lightWhite);
t.prefs_.set('background-color', black);
t.prefs_.set('cursor-blink', true);
