return {
        "rcarriga/nvim-notify",

    config = function()
        require("notify").setup({
            -- stages = "fade_in_slide_out",
            stages = "slide",
            -- Default timeout for notifications
            timeout = 5000,
            -- For stages that change opacity this is treated as the highlight behind the window
            background_highlight = "Normal",
            background_colour = "#000000",
        })
    end
}
