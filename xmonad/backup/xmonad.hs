import XMonad
import Control.Monad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys, additionalMouseBindings)
import XMonad.Util.SpawnOnce
import XMonad.Util.Loggers

import qualified XMonad.StackSet as W
import qualified Data.Map as M
import GHC.IO.Handle.Types as H

import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.WindowArranger

import XMonad.Actions.CycleWS (prevWS, nextWS)

import System.IO

mkeys =	[ ((mod4Mask, xK_Return), spawn "urxvt")
	, ((mod4Mask, xK_Left), prevWS)
	, ((mod4Mask, xK_Right), nextWS)
	, ((mod4Mask, xK_Up), sendMessage MirrorExpand)
	, ((mod4Mask, xK_Down), sendMessage MirrorShrink)
	, ((mod4Mask, xK_r), spawn "dmenu_run -b")
	, ((mod4Mask .|. shiftMask, xK_r), spawn "killall dzen2 && xmonad --restart")
	-- sound and others --
  , ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)


    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

	  ] where modm = mod4Mask

main = do
	xmonad $ defaultConfig
				{
 				modMask = mod4Mask
 				, focusedBorderColor = "#b84130"
 				, normalBorderColor = "#02151B"
 				, borderWidth = 2
 				, terminal = "urxvt"
 				} `additionalKeys` mkeys
