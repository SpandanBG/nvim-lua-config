local dap = require("dap")


local ExecTypes = {
  TEST = "cargo build --tests -q --message-format=json",
  BIN = "cargo build -q --message-format=json"
}

local function runBuild(type)
  local lines = vim.fn.systemlist(type)
  local output = table.concat(lines, "\n")
  local filename = output:match('^.*"executable":"(.*)",.*\n.*,"success":true}$')

  if filename == nil then
    return error("failed to build cargo project")
  end

  return filename
end

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.exepath("codelldb"), -- install `lldb` && use :Mason to install codelldb & cpptools
    args = { "--port", "${port}" },
  },
  name = "codelldb"
}

if vim.fn.has('win32') == 1 then
	dap.adapters.codelldb.executable.detached = false
end

dap.configurations.rust = {
  {
    name = "Debug Test",
    type = "codelldb",
    request = "launch",
    program = function ()
      return runBuild(ExecTypes.TEST)
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    showDisassembly = "never"
  },
  {
    name = "Debug Bin",
    type = "codelldb",
    request = "launch",
    program = function ()
      return runBuild(ExecTypes.BIN)
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    showDisassembly = "never"
  }
}
