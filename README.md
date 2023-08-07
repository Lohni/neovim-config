1. Install Neovim from the official website
2. Create a cofiguration folder wherever you prefer. (e.g. C:\Users\<User>\.neovim)
3. Create the environment variable $XDG_CONFIG_HOME and set it to this path
4. Install mingw for the plugin manager (e.g. w64devkit)
5. (Optional: run OpenNeovimInContextMenu.reg to create an entry to the context menu - similar to Git Bash)
    - Background: Open Neovim here
    - File: Open with Neovim
6. Get the plugin manager "wbthomason/packer.nvim" via the "git clone" command from the Quickstart section
7. Open "lua/config/packer.lua" in Neovim and execute ":PackerSync" to install all defined plugins. To get more information on each plugin, please visit their Github repo.
8. Regarding lsp servers, see their individual requirements via :Mason (or their GitHub)
