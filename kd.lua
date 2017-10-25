local robot = require("robot")
local cnt = 0
local hcnt = 0

for i = 1, 50, 1 do

    r, type = robot.detect()
    if type == "liquid" then
        os.exit()
    end

    robot.swing()
    while not robot.forward() do
        cnt = cnt + 1
        os.sleep(1)
        if cnt > 3 then
            os.exit()
        end
    end
    
    robot.swingUp()
    robot.swingDown()

    robot.turnLeft()
    robot.swing()
    robot.forward()
    robot.swingUp()
    robot.swingDown()

    while not robot.back() do
        cnt = cnt + 1
        os.sleep(1)
        if cnt > 3 then
            os.exit()
        end
    end

    hcnt = hcnt + 1
    if hcnt >= 10 then
        hcnt = 0
        robot.select(2)
        robot.place()
    end

    robot.turnAround()

    robot.swing()
    while not robot.forward() do
        cnt = cnt + 1
        os.sleep(1)
        if cnt > 3 then
            os.exit()
        end
    end
    robot.swingUp()
    robot.swingDown()
    robot.turnAround()
    while not robot.forward() do
        cnt = cnt + 1
        os.sleep(1)
        if cnt > 3 then
            os.exit()
        end
    end
    robot.turnRight()

    --os.sleep(0.3)
end

