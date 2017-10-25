local robot = require("robot")

local RETRY_MAX = 3
local RETRY_DELAY = 1

local retry_cnt = 0

--[[
3
2 
1 2 3
--]]


function up()
    while not robot.up() do
        retry_cnt = retry_cnt + 1
        os.sleep(RETRY_DELAY)
        if retry_cnt > RETRY_MAX then
            os.exit()
        end
    end
    retry_cnt = 0
end


function down()
    while not robot.down() do
        retry_cnt = retry_cnt + 1
        os.sleep(RETRY_DELAY)
        if retry_cnt > RETRY_MAX then
            os.exit()
        end
    end
    retry_cnt = 0
end


function forward()
    while not robot.forward() do
        retry_cnt = retry_cnt + 1
        os.sleep(RETRY_DELAY)
        if retry_cnt > RETRY_MAX then
            os.exit()
        end
    end
    retry_cnt = 0
end


function detectPlaceDown()
    r, type = robot.detectDown()
    if not r then
        robot.placeDown()
    end
end


function detectPlaceUp()
    r, type = robot.detectUp()
    if not r then
        robot.placeUp()
    end
end


function detectPlace()
    r, type = robot.detect()
    if not r then
        robot.place()
    end
end


function swing() robot.swing() end
function swingUp() robot.swingUp() end
function swingDown() robot.swingDown() end
function turnLeft() robot.turnLeft() end
function turnRight() robot.turnRight() end
function turnAround() robot.turnAround() end

for i = 1, 50, 1 do
    swing()
    forward()
    detectPlaceDown()
    turnLeft()

    detectPlace()
    swingUp()
    up()

    detectPlace()
    swingUp()
    up()

    detectPlace()
    detectPlaceUp()

    turnAround()
    --2
    swing()
    forward()
    detectPlaceUp()

    swingDown()
    down()
    swingDown()
    down()

    detectPlaceDown()
    -- 3
    swing()
    forward()
    detectPlaceDown()
    detectPlace()

    swingUp()
    up()
    detectPlace()

    swingUp()
    up()
    detectPlace()

    detectPlaceUp()

    down()
    down()

    turnAround()

    forward()
    forward()

    turnRight()
    
end
