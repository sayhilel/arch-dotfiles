import '@girs/gjs'
import '@girs/gjs/dom'
import '@girs/gio-2.0'
import '@girs/gtk-4.0'
import '@girs/adw-1'
import Gtk from 'gi://Gtk?version=4.0';
Gtk.init(null);

const win = new Gtk.Window({
    title: 'Hello, GJS!',
});

win.connect('destroy', () => Gtk.main_quit());

const label = new Gtk.Label({
    label: 'Hello, world!',
});

win.set_child(label);
win.present();

Gtk.main();
