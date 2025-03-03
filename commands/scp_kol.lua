local function scp_current_file()
  -- Get the full path of the current file.
  local full_path = vim.fn.expand("%:p")
  if full_path == "" then
    print("No file path found!")
    return
  end

  -- Remove the local project directory from the full path.
  -- Note: The dash in "web_phase3-main" is escaped with a "%" for Lua patterns.
  local trimmed_path = full_path:gsub("^/home/juliano/Documents/Github/kol/", "")

  -- Build the SCP command.
  local key_path = "~/Documents/pemkeys/vmjulianotest_key.pem"
  local remote_destination = "azureuser@172.207.26.41:~/" .. trimmed_path
  local cmd = "Terminal scp -i " .. key_path .. " " .. vim.fn.shellescape(full_path) .. " " .. remote_destination

  vim.cmd(cmd)
end

-- Create a Neovim user command to run the function.
vim.api.nvim_create_user_command("SCPFile", scp_current_file, {})

local function sync_src_folder()
  -- Define the local and remote paths.
  local local_src = "/home/juliano/Documents/Github/kol/web_phase3-main/src/"
  local remote_src = "azureuser@172.207.26.41:~/web_phase3-main/src/"
  local key_path = "~/Documents/pemkeys/vmjulianotest_key.pem"

  -- Build the rsync command.
  -- The -avz options are for archiving, verbosity, and compression.
  -- The -e option lets us specify the ssh command with the identity key.
  local cmd = string.format("Terminal rsync -avz -e 'ssh -i %s' %s %s", key_path, local_src, remote_src)

  vim.cmd(cmd)
end

-- Create a Neovim user command :SyncSrc that runs the sync_src_folder function.
vim.api.nvim_create_user_command("SyncSrc", sync_src_folder, {})

