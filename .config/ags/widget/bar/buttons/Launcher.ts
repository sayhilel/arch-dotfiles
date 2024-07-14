import PanelButton from "../PanelButton"
import options from "options"
const { icon, label } = options.bar.launcher
const { spawn_command_line_async } = imports.gi.GLib

function LaunchRofi() {
    const child = Widget.Icon({
        icon: icon.icon.bind(),
    })

    return Widget.Revealer({
        child,
        reveal_child:
            icon.icon.bind(),
    })
}

function launchRofi() {
    spawn_command_line_async("rofi -show drun")
}

export default () => PanelButton({
    window: "launcher",
    on_clicked: launchRofi,
    child: Widget.Box([
        LaunchRofi(),
        Widget.Label({
            class_name: label.colored.bind().as(c => c ? "colored" : ""),
            visible: label.label.bind().as(v => !!v),
            label: label.label.bind(),
        }),
    ]),
})

