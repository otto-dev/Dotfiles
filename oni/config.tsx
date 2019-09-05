
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    oni.input.unbind("<C-v>")
    oni.input.resolvers.addResolver((event, key) => {
        if(event.altKey && event.shiftKey) return key.toString().toUpperCase()
        return key;
    })
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    "ui.colorscheme": "nord",
    "editor.fontSize": "16px",
    "editor.fontFamily": "SauceCodePro Nerd Font Mono",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "loadInitVim": true,
}
