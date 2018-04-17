-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Wendi Yu
-- Created on: Apr 2018
--
-- update the button
-----------------------------------------------------------------------------------------

-- simple touch code

local theBall = display.newImage( "./assets/sprites/ball.png" )
theBall.x = display.contentCenterX - 150
theBall.y = display.contentCenterY
theBall.id = "ball object"
 
local function onBallTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
  
    return true
end

theBall:addEventListener( "touch", onBallTouched )

-- Comprehensive touch code

local thegirl = display.newImage( "./assets/sprites/girl.png" )
thegirl.x = display.contentCenterX + 500
thegirl.y = display.contentCenterY
thegirl.id = "sprite girl"
 
function thegirl:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

thegirl:addEventListener( "touch", thegirl )