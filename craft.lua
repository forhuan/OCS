local robot = require("robot")
local sides = require("sides")
local component = require("component")
local controller = component.inventory_controller

function empty()
    for i = 1, 12, 1 do 
        local item = controller.getStackInInternalSlot(i)
        if item ~= nil then 
            robot.select(i)
            robot.transferTo(24 + i)
        end
    end
end


function craft()

    robot.transferTo(1,1)
    robot.transferTo(2,1)
    robot.transferTo(3,1)

    robot.transferTo(5,1)
    robot.transferTo(6,1)
    robot.transferTo(7,1)

    robot.transferTo(9,1)
    robot.transferTo(10,1)
    robot.transferTo(11,1)

    robot.select(8)
    component.crafting.craft()

end



function isItemCraftable(label)
    if label == "Tiny Pile of Gold Dust" then 
        return true
    elseif label == "Tiny Pile of Silver Dust" then
        return true
    elseif label == "Tiny Pile of Copper Dust" then
        return true
    elseif label == "Tiny Pile of Iron Dust" then
        return true
    elseif label == "Tiny Pile of Tin Dust" then
        return true
    elseif label == "Tiny Pile of Lead Dust" then
        return true
    elseif label == "Tiny Pile of Sulfur Dust" then
        return true
    elseif label == "Stone Dust" then
        return false
    else
        return false
    end
end

while true do 
    for i = 13, 24, 1 do
        local item = controller.getStackInInternalSlot(i)
        if item ~= nil then 
            if item.name == "ic2:dust" then
                if item.size > 9 then
                    if isItemCraftable(item.label) then
                        empty()
                        robot.select(i)
                        robot.turnLeft()
                        craft()
                        robot.turnRight()
                        robot.drop()
                    else
                        robot.select(i)
                        robot.down()
                        robot.turnRight()
                        robot.forward()
                        robot.turnLeft()
                        robot.drop(sides.front, item.size - 1)
                        robot.turnLeft()
                        robot.forward()
                        robot.up()
                        robot.turnRight()
                    end
                end
            else
                robot.select(i)
                robot.down()
                robot.turnRight()
                robot.forward()
                robot.turnLeft()
                robot.drop()
                robot.turnLeft()
                robot.forward()
                robot.up()
                robot.turnRight()
            end
            robot.select(4)
        end
    end
    os.sleep(1)
end
