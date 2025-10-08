-- abs_time_auto.lua
local mp = require 'mp'
local msg = require 'mp.msg'
local utils = require 'mp.utils'

-- get modify date of file（Windows PowerShell）
local function get_file_modified_time(path)
    local cmd = {
        "powershell",
        "-NoProfile", "-Command",
        "(Get-Item '" .. path .. "').LastWriteTime.ToString('yyyy-MM-dd HH:mm:ss')"
    }
    local res = utils.subprocess({ args = cmd, cancellable = false })
    if res and res.stdout and #res.stdout > 0 then
        return res.stdout:gsub("%s+$", "")  -- del enter
    end
    return nil
end

-- analyse timestamp
local function parse_time(s)
    local Y, M, D, h, m, sec = s:match("(%d+)%-(%d+)%-(%d+)%s+(%d+):(%d+):(%d+)")
    if not Y then return nil end
    return os.time{
        year=tonumber(Y), month=tonumber(M), day=tonumber(D),
        hour=tonumber(h), min=tonumber(m), sec=tonumber(sec)
    }
end

-- triger when file load ok
mp.register_event("file-loaded", function()
    local path = mp.get_property("path")
    local modified_str = get_file_modified_time(path)
    local duration = mp.get_property_number("duration")
    
    if not modified_str then
        msg.error("fail to get file modify date")
        return
    end
    if not duration then
        msg.error("fail to get media duration/length")
        return
    end

    local modified_ts = parse_time(modified_str)
    local start_ts = modified_ts - duration
    msg.info("录制起始时间（根据修改时间计算）: " .. os.date("%Y-%m-%d %H:%M:%S", start_ts))

    -- 定时器显示绝对时间
    local timer = mp.add_periodic_timer(0.5, function()
        local pos = mp.get_property_number("time-pos")
        if pos then
            local abs_ts = start_ts + pos
            local abs_time_str = os.date("%Y-%m-%d %H:%M:%S", abs_ts)
            mp.osd_message("绝对时间: " .. abs_time_str, 0.5)
        end
    end)

    -- 播放结束时停止定时器
    mp.register_event("end-file", function()
        timer:stop()
    end)
end)
