function HeapUsage()
    return collectgarbage('count')*1024
end

function CallToC(x, y)
    cCall(x, y)
end

