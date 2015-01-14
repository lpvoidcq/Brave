Player = class("Player",function()
    return display.newSprite("#player1-1-1.png")
end)

function Player:ctor()
    self:addAnimation()
end

function Player:addAnimation()
    local animationNames = {"walk","attack","dead"}
    local animationFrameNum = {4,4,4}
    
    for i=1, #animationNames do
        local frames = display.newFrames("player1-"..i.."-%d.png", 1, animationFrameNum[i])
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
    
    local curPos = CCPoint(cc.Node.getPositionX(self), cc.Node.getPositionY(self))
    local desPos = CCPoint(pos[1], pos[2])
    local posDis = math.sqrt(math.pow(curPos.x-desPos.x, 2) + math.pow(curPos.y-desPos.y, 2))
    local seq = transition.sequence({cc.MoveTo:create(5*posDis / display.width, desPos), cc.CallFunc:create(moveStop)})
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