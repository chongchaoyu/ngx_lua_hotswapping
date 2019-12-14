local _M = {}
function _M.execute(name, version)
    local cached = package.loaded
    local versions = ngx.shared.hotswappingVersions
    if string.lower(name) == 'all' then
        local _tmp
        for k, _v in pairs(cached) do
            ngx.say("Set version for " .. k .. "," .. version)
            versions:set(k, version)
        end
    else
        ngx.say("Set version for " .. name .. "," .. version)
        versions:set(name, version)
    end
end

return _M