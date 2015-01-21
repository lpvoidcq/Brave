Progress = class("Progress", function(backgroud, fill)
    local progress = display.newSprite(backgroud)
    local fillbar = display.newProgressTimer(fill,display.PROGRESS_TIMER_BAR)
    fillbar:setMidpoint(CCPoint(0, 0.5))
    fillbar:setBarChangeRate(CCPoint(1.0, 0))
    fillbar:setPosition(progress:getContentSize().width/2, progress:getContentSize().height/2)
    progress:addChild(fillbar)
    fillbar:setPercentage(100)
    
    return progress
end)

function Progress:ctor()

end

function Progress:setProgress(progress)
    self.fillbar:setPercentage(progress)
end

return Progress