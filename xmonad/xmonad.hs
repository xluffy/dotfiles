import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.CycleWS (prevWS, nextWS)
import Graphics.X11.ExtraTypes.XF86
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/xluffy/.xmobarrc"
  
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig
    , modMask = mod4Mask
    } `additionalKeys`
    [ 
      ((mod4Mask, xK_Left), prevWS)
    , ((mod4Mask, xK_Right), nextWS)
    , ((mod4Mask, xK_Return), spawn "urxvt")
    , ((mod4Mask, xK_space), spawn "dmenu_run -f")
    , ((mod4Mask, xK_q), spawn "xmonad --recompile; xmonad --restart")
    , ((0, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 2-")
  	, ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 2+")
  	, ((0, xF86XK_AudioMute          ), spawn "amixer set Master toggle")
  	, ((0, xF86XK_AudioMicMute), spawn "amixer set Capture toggle")
    ]
