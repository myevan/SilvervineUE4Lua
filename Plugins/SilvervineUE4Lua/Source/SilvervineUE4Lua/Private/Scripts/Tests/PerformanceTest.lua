-- SilvervineUE4Lua / devCAT studio
-- Copyright 2016 - 2019. Nexon Korea Corporation. All rights reserved.


SUE4Lua.Log("# PerformanceTest")

local IterationCount = 100*100

do
    local TestUObject = UE4.NewObject(UE4.FindClass("SUE4LuaTestUObject"))
    TestUObject.UObjectProperty = TestUObject
    local StartTime = UE4.PlatformTime.Seconds()
    for i = 1, IterationCount do
        local a = TestUObject.UObjectProperty
    end
    local EndTime = UE4.PlatformTime.Seconds() 
    SUE4Lua.Log(string.format("UObjectProperty getter: ElapsedTime=%f", EndTime - StartTime))
end

do
    local TestUObject = UE4.NewObject(UE4.FindClass("SUE4LuaTestUObject"))
    TestUObject.UObjectProperty = TestUObject
    local StartTime = UE4.PlatformTime.Seconds()
    for i = 1, IterationCount do
        TestUObject.UObjectProperty = TestUObject
    end
    local EndTime = UE4.PlatformTime.Seconds() 
    SUE4Lua.Log(string.format("UObjectProperty setter: ElapsedTime=%f", EndTime - StartTime))
end

do
    local TestUObject = UE4.NewObject(UE4.FindClass("SUE4LuaTestUObject"))
    local StartTime = UE4.PlatformTime.Seconds()
    for i = 1, IterationCount do
        local a = TestUObject.IntProperty
    end
    local EndTime = UE4.PlatformTime.Seconds() 
    SUE4Lua.Log(string.format("IntProperty getter: ElapsedTime=%f", EndTime - StartTime))
end

do
    local TestUObject = UE4.NewObject(UE4.FindClass("SUE4LuaTestUObject"))
    local StartTime = UE4.PlatformTime.Seconds()
    for i = 1, IterationCount do
        TestUObject.IntProperty = 1
    end
    local EndTime = UE4.PlatformTime.Seconds() 
    SUE4Lua.Log(string.format("IntProperty setter: ElapsedTime=%f", EndTime - StartTime))
end

do
    local TestUObject = UE4.NewObject(UE4.FindClass("SUE4LuaTestUObject"))
    local StartTime = UE4.PlatformTime.Seconds()
    for i = 1, IterationCount do
        TestUObject:TestArgs(1, 2, 3)
    end
    local EndTime = UE4.PlatformTime.Seconds() 
    SUE4Lua.Log(string.format("TestArgs(...): ElapsedTime=%f", EndTime - StartTime))
end

do
    local TestUObject = UE4.NewObject(UE4.FindClass("SUE4LuaTestUObject"))
    local StartTime = UE4.PlatformTime.Seconds()
    local Args = {
        InIntArg1 = 1,
        InIntArg2 = 2,
        InIntArg3 = 3,
    }
    for i = 1, IterationCount do
        TestUObject:TestArgs(Args)
    end
    local EndTime = UE4.PlatformTime.Seconds() 
    SUE4Lua.Log(string.format("TestArgs(Args): ElapsedTime=%f", EndTime - StartTime))
end
