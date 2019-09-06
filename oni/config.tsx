
import * as React from "react"
import * as Oni from "oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    oni.input.bind("@", () => oni.editors.activeEditor.neovim.command("tabnew +terminal"))
    oni.input.bind("<c-space>", "sidebar.toggle")
    oni.input.resolvers.addResolver((event, key) => {
        // console.log(key)
        if(key === '·') return '<esc>';
        if(event.altKey && event.shiftKey) return key.toString().toUpperCase();
        return key;
    })
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    "oni.hideMenu": true,
    "ui.colorscheme": "gruvbox",
    "editor.fontSize": "16px",
    "editor.fontFamily": "SauceCodePro Nerd Font Mono",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",
    "loadInitVim": true,
    "autoClosingPairs": false,
    "editor.clipboard.enabled": false,
    "sidebar.width": "22em",
    "language.scala.languageServer.command": "metals-vscode",
    "language.scala.languageServer.rootFiles": ["build.sbt", ".git"],
}
