local _M = {}
_M.NAME = 'hotswapping/autoUpdate'

local dict = {}
function _M.get(name)
    return dict[name]
end

function _M.set(name, version)
    dict[name] = version
end

function _M.require(moduleName)
    local versions = ngx.shared.hotswappingVersions
    local cached = package.loaded

    local lastest = versions:get(moduleName)
    if lastest ~= nil and _M.get(moduleName) ~= lastest then
        cached[moduleName] = nil
        _M.set(moduleName, lastest)
    end

    local _tmp = require(moduleName)
    return _tmp
end

function _M.update()
    local _tmp = _M.require(_M.NAME)
    if _M ~= _tmp then
        for k, _v in pairs(dict) do
            _tmp.set(k, _v)
        end
    end
    return _tmp
end

return _M
