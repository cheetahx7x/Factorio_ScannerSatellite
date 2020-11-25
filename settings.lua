data:extend({
    {
       type = "int-setting",
       name = "initial-scan-radius",
       setting_type = "runtime-global",
       default_value = 50,
       minimum_value = 1,
       maximum_value = 1000,
       order = "a",
    },
    {
        type = "int-setting",
        name = "consecutive-scan-radius-expansion",
        setting_type = "runtime-global",
        default_value = 10,
        minimum_value = 1,
        maximum_value = 1000,
        order = "a",
     }
 })