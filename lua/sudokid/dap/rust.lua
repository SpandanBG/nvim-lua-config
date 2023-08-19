local dap = require("dap")


local ExecTypes = {
  TEST = "1",
  MAIN = "2"
}

local function getFilesInDir(path)
  local i, t = 0, {}
  local pfile = assert(io.popen('find "'..path..'" -executable -type f '))
  for filename in pfile:lines() do
    i = i + 1
    t[i] = filename
  end
  pfile:close()
  return t
end

local function getNumberOfSymLinks(file)
  local pfile = assert(io.popen('stat "'..file..'" -c %h'))
  local numberOfLinks = pfile:read()
  pfile:close()
  return numberOfLinks
end

local function getFileBySymLinkCount(files, count)
  for _, file in pairs(files) do
    local numberOfLinks = getNumberOfSymLinks(file)
    if numberOfLinks == count then
      return file
    end
  end
end

local function getRustExecutable(fromDir, type)
  local files = getFilesInDir(fromDir)
  local selected_file = getFileBySymLinkCount(files, type)
  local filename = selected_file:match('^.*/(.*)$')
  return vim.fn.getcwd() .. "/" .. fromDir .. filename
end


dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode-14", -- you will have to have `lldb` installed
  name = "lldb"
}

dap.configurations.rust = {
  {
    name = "Debug Test",
    type = "lldb",
    request = "launch",
    program = function ()
      vim.fn.jobstart('cargo build --test')
      return getRustExecutable('target/debug/deps/', ExecTypes.TEST)
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    showDisassembly = "never"
  },
  {
    name = "Debug Main",
    type = "lldb",
    request = "launch",
    program = function ()
      vim.fn.jobstart('cargo build')
      return getRustExecutable('target/debug/', ExecTypes.MAIN)
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    showDisassembly = "never"
  }
}
