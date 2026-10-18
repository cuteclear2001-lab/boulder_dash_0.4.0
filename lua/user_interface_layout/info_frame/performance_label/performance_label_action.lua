--res://lua/user_interface_layout/info_frame/performance_label/performance_label_action.lua
local Data = require("lua.user_interface_layout.info_frame.performance_label.performance_label_data")

---@class Action.Performance_Label
local Performance_Label = {
}

---@param label Label
function Performance_Label:init(label)
    Data.label = label
end

---@param delta float
function Performance_Label:heart(delta)
    local label = Data.label
    if not is_instance_valid(label) then
        return
    end
    if not Data.begin_flag then
        label.text = string.format("%.3f, %.3f", Performance:get_monitor(Performance.TIME_PROCESS) * 1000, Performance:get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
        --Performance:get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME)
        Data.begin_flag = true
        return
    end
    Data.begin_time = Data.begin_time + delta
    Data.tick_count = Data.tick_count + 1
    Data.performance_count = Data.performance_count + Performance:get_monitor(Performance.TIME_PROCESS)
    Data.render_draw_calls = Data.render_draw_calls + Performance:get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME)
    if Data.begin_time >= Data.END_TIME then
        label.text = string.format("%.3f, %.3f"
                        , Data.performance_count * 1000 / Data.tick_count
                        , Data.render_draw_calls / Data.tick_count
                    )
        Data.begin_time = Data.begin_time - Data.END_TIME
        Data.tick_count = 0
        Data.performance_count = .0
        Data.render_draw_calls = 0
    end
end

return Performance_Label
