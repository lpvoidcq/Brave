Player = class("Player",function()
    return display.newSprite("#player1-1-1.png")
end)

function Player:addAnimation()
    local animationNames = {"walk","attack","dead"}
    local animationFrameNum = {4,4,4}
    
    for i=1, #animationNames do
        local frames = display.newFrames("player1-"..i.."-%d.png", i, animationFrameNum[i])
        local animation = display.newAnimation(frames, 0.2)
        display.setAnimationCache("player1-"..animationNames[i], animation)
    end
end

function Player:walkTo(pos, callback)
	local function moveStop()
	   transition.stopTarget(self)
	   if callback then
	       callback()
	   end
    end
    
    local curPos = CCPoint(CCNode.getPositionX(self), CCNode.getPositionY(self))
    local desPos = CCPoint(pos.x, pos.y)
    local posDis = cc.PointDistance(curPos, desPos)
    local seq = transition.sequence({CCMoveTo:create(5*posDis / display.width, desPos), CCCallFunc:create(moveStop)})
    transition.playAnimationForever(self,display.getAnimationCache("player1-walk"))
    self:runAction(seq)
end

function Player:attack()
	transition.playAnimationOnce(self,display.getAnimationCache("player1-attack"))
end

function Player:dead()
    transition.playAnimationOnce(self,display.getAnimationCache("player1-dead"))
end

return Player