// my_mod: an Oxidizer mod written in Rhai.
// Save this file while the game runs: the new code takes over within a second.
// All functions are optional. API: https://github.com/SafeShows/Oxidizer#rhai
//
// State lives in `this` (an object map). It is kept across reloads; init() runs only once.

fn init() {
    this.visible = config_get("visible", true);   // saved settings, see toggle()
    this.clicks = 0;
    print("my_mod: hello!");                      // shows in the log and in Mods > Oxidizer
}

// Runs after the file was saved and reloaded.
fn reload() {
    print("my_mod: reloaded");
}

fn toggle() {
    this.visible = !this.visible;
    config_set("visible", this.visible);           // kept for the next game
}

// Every frame. key_pressed is true only on the frame the key went down.
fn frame(t, dt) {
    if key_pressed("F8") {
        this.toggle();
    }
}

// Your entries in the game's Mods menu.
fn menu() {
    if menu_item("My mod", this.visible) {
        this.toggle();
    }
}

// Your windows (ImGui). Always call end() after begin().
fn gui(dt) {
    if !this.visible {
        return;
    }
    if begin("My mod") {
        // The game, typed: ksa::<Type>::<static member>(), and obj.<member> on its objects (snake_case names).
        let vehicle = ksa::Program::controlled_vehicle();
        if vehicle == () {
            text("no vehicle");
        } else {
            text(`vehicle: ${vehicle.id}`);
        }
        text(`time: ${ksa::Universe::get_elapsed_seconds()} s`);
        if button("Click me") {
            this.clicks += 1;
        }
        same_line();
        text(`clicks: ${this.clicks}`);
        text("F8 hides this window");
    }
    end();
}
