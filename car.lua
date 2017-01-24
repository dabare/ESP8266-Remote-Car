
FH = 5
FL = 6

BLH = 1
BLL = 2

BRH = 7
BRL = 8

ind = 4
gpio.mode(ind, gpio.OUTPUT)

gpio.mode(FH, gpio.OUTPUT)
gpio.mode(FL, gpio.OUTPUT)

gpio.mode(BLH, gpio.OUTPUT)
gpio.mode(BLL, gpio.OUTPUT)

gpio.mode(BRH, gpio.OUTPUT)
gpio.mode(BRL, gpio.OUTPUT)

gpio.write(ind, gpio.HIGH);

gpio.write(FH, gpio.LOW);
gpio.write(FL, gpio.LOW);
gpio.write(BLH, gpio.LOW);
gpio.write(BLL, gpio.LOW);
gpio.write(BRH, gpio.LOW);
gpio.write(BRL, gpio.LOW);


srv=net.createServer(net.TCP)






srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        gpio.write(ind, gpio.LOW);
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        
        

        if (vars ~= nil)then
           buf = buf.."OK";
        elseif(path=="/car.js") then

    file.open("car.js","r") 
    buf=buf..file.read(1000);      
    file.close()
        elseif(path=="/car.css") then

    file.open("car.css","r") 
    buf=buf..file.read(1000);      
    file.close()
        
       else
        print("new user");
    file.open("car.html","r") 
    buf=buf..file.read(1000);      
    file.close()
    end

    print(vars);
    
    if(vars == "brs")then
        gpio.write(BRH, gpio.LOW);
        gpio.write(BRL, gpio.LOW);
        elseif(vars == "bls")then
           gpio.write(BLH, gpio.LOW);
           gpio.write(BLL, gpio.LOW);
           elseif(vars == "fs")then
               gpio.write(FH, gpio.LOW);
               gpio.write(FL, gpio.LOW);
               elseif(vars == "brf")then
                gpio.write(BRH, gpio.LOW);
                gpio.write(BRL, gpio.HIGH);

                elseif(vars == "brb")then
                    gpio.write(BRH, gpio.HIGH);
                    gpio.write(BRL, gpio.LOW);

                    elseif(vars == "blf")then
                        gpio.write(BLH, gpio.LOW);
                        gpio.write(BLL, gpio.HIGH);

                        elseif(vars == "blb")then
                            gpio.write(BLH, gpio.HIGH);
                            gpio.write(BLL, gpio.LOW);

                            elseif(vars == "fl")then
                                gpio.write(FH, gpio.HIGH);
                                gpio.write(FL, gpio.LOW);

                                elseif(vars == "fr")then
                                    gpio.write(FH, gpio.LOW);
                                    gpio.write(FL, gpio.HIGH);

                                end

                                client:send(buf);
                                client:close();
                                buf = nil;
                                collectgarbage();
                                gpio.write(ind, gpio.HIGH);
                                end)
end)


local function forward()

end

local function reverse()

end

local function left()

end

local function right()
    gpio.write(FH, gpio.LOW);
    gpio.write(FL, gpio.HIGH);
end
