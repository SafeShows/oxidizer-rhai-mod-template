# Oxidizer Rhai mod template

A starting point for a [Kitten Space Agency](https://ksa.ahwoo.com) mod written in [Rhai](https://rhai.rs), run by
[Oxidizer](https://github.com/SafeShows/Oxidizer). No compiler or SDK needed: a mod is a text file, and it reloads
while the game runs.

The example mod opens a window with the controlled vehicle and the game time, adds an entry to the game's **Mods**
menu, toggles with **F8**, and remembers whether it was open.

## Start

1. Install Oxidizer: as a StarMap mod (`Oxidizer.StarMap`) or standalone, see
   [Oxidizer's install steps](https://github.com/SafeShows/Oxidizer#install).
2. Click **Use this template** on GitHub to make your own repository from this one.
3. Clone your repository straight into the game's mods folder, so the game runs the files you edit:
   ```sh
   git clone https://github.com/<you>/<your-repo> "<Documents>/My Games/Kitten Space Agency/mods/my_mod"
   ```
4. Start the game, and enable the mod when it asks. Edit `main.rhai` and save: the change shows within a second.
   **Mods > Oxidizer** shows errors and the log.

## Make it yours

The mod's id is its folder name in `mods/`. To rename it from `my_mod`, change these together:
- the folder name,
- `name` in `mod.toml`,
- `MOD_ID` in `.github/workflows/release.yml`,
- `id` in `index-listing.example.toml`.

`LICENSE` is MIT No Attribution, so you can relicense your mod however you like: replace it with your own.

## Write the mod

`main.rhai` has `init`, `frame`, `gui`, `menu` and `reload`, each optional, with comments. The full list of
functions (game objects, hooks, ImGui, keys, settings) is in
[Oxidizer's README](https://github.com/SafeShows/Oxidizer#rhai). To find the game's type and member names, open
`KSA.dll` from the game folder in a .NET decompiler such as ILSpy.

More `.rhai` files or other assets can go in this folder; all of it ends up in the release zip.

## Release

Push a tag:
```sh
git tag v1.0.0
git push origin v1.0.0
```
The workflow publishes a release with `my_mod-1.0.0.zip`, holding a `my_mod/` folder, the layout mod managers
install.

## List it in the content index

So players can find and install the mod with managers like Borea, list it in the
[KSA content index](https://github.com/KSAModding/content-index): copy `index-listing.example.toml` to
`listings/<id>.toml` in a fork of that repository, fill it in, and open a pull request. Publish your release
**first**, because the index checks it when you open the pull request. The listing also needs a thread for the mod
on the [KSA forums](https://forums.ahwoo.com).
