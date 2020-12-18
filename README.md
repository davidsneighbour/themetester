### Setup themetester

**Requirements:**

-   Hugo needs to be installed and configured in the path 
-   @todo make hugo installation part of the script

**Step 1:** Run `bin/themetester-setup.sh` to load all configured themes

**Step 2:** Check the [STOML binaries](https://github.com/freshautomations/stoml/releases) in `bin/stoml-bins` and copy the version that is compiled for your system to `bin/stoml` (remove the individual ending). Then make it executable (`chmod +x bin/stoml`)

### Update dev environment

Run `bin/themetester-update.sh` to update the system and themes.

### Run dev environment

Run `bin/themetester-serve.sh` and select the theme to set up. The Hugo development server will run in the end. To stop the current process press CTRL+C.

### Adding new themes to the repository

Add the Repository to `etc/configuration.toml`. If no repository is available then add the files directly to a folder in `themes`. No need to update the configuration then.
