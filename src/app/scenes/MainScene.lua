import("..roles.Player")
import("..roles.Enemy1")
import("..ui.Progress")
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    local bg = display.newSprite("image/background.png",display.cx,display.cy)
    self:addChild(bg)
    
    self.player = Player.new()
    self.player:setPosition(display.left + self.player:getContentSize().width/2,display.cy)
    self:addChild(self.player)
    
    self.enemy = Enemy1.new()
    self.enemy:setPosition(display.right - self.enemy:getContentSize().width/2, display.cy)
    self:addChild(self.enemy)
    
    self.progress = Progress.new("#player-progress-bg.png", "#player-progress-fill.png")
    self.progress:setPosition(display.left + self.progress:getContentSize().width/2, display.top - self.progress:getContentSize().height/2)
    self:addChild(self.progress)
    
    self:addTouchLayer()
--[[    cc.ui.UILabel.new({
            UILabelType = 2, text = "Hello, World", size = 64})
        :align(display.CENTER, display.cx, display.cy)
        :addTo(self)]]
    
end

function MainScene:addTouchLayer()
    local function onTouch(eventName, x, y)
        if eventName == "began" then
    	   self.player:walkTo({x, y})
    	end
    end
    self.layerTouch = display.newLayer()
    self.layerTouch:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event)
        return onTouch(event.name,event.x,event.y)
    end)
    
    self.layerTouch:setTouchEnabled(true)
    self.layerTouch:setPosition(cc.p(0,0))
    self.layerTouch:setContentSize(cc.size(display.width,display.height))
    self:addChild(self.layerTouch)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
