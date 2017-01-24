
L = 5
R = 6

FWD = 1
REV = 2

ind = 4
gpio.mode(ind, gpio.OUTPUT)

gpio.mode(L, gpio.OUTPUT)
gpio.mode(R, gpio.OUTPUT)

gpio.mode(FWD, gpio.OUTPUT)
gpio.mode(REV, gpio.OUTPUT)

gpio.write(ind, gpio.HIGH);

gpio.write(L, gpio.LOW);
gpio.write(R, gpio.LOW);
gpio.write(FWD, gpio.LOW);
gpio.write(REV, gpio.LOW);

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

    
    if(vars == "brs")then
        stop();
        elseif(vars == "bls")then
           stop();
           elseif(vars == "fs")then
               center();

               
               elseif(vars == "brf")then
                forward();

                elseif(vars == "brb")then
                    reverse();

                    elseif(vars == "blf")then
                        forward();

                        elseif(vars == "blb")then
                            reverse();

                            elseif(vars == "fl")then
                                left();

                                elseif(vars == "fr")then
                                    right();

                                end

                                client:send(buf);
                                client:close();
                                buf = nil;
                                collectgarbage();
                                gpio.write(ind, gpio.HIGH);
                                end)
end)


function forward()
    gpio.write(FWD, gpio.HIGH);
    gpio.write(REV, gpio.LOW);
end

function reverse()
    gpio.write(FWD, gpio.LOW);
    gpio.write(REV, gpio.HIGH);
end

function stop()
    gpio.write(FWD, gpio.LOW);
    gpio.write(REV, gpio.LOW);
end

function left()
    gpio.write(L, gpio.HIGH);
    gpio.write(R, gpio.LOW);
end

function right()
    gpio.write(L, gpio.LOW);
    gpio.write(R, gpio.HIGH);
end

function center()
    gpio.write(L, gpio.LOW);
    gpio.write(R, gpio.LOW);
end