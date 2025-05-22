local dap = require("dap")

-------------------------------------------------
-- Zig build helpers ----------------------------
-------------------------------------------------
local ExecTypes = {
  BIN  = "zig build",       -- project binary
  TEST = "zig build test",  -- build test runner
}

-- build + return newest executable in zig-out/bin
local function run_build(cmd)
  vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    error("zig build failed: " .. cmd)
  end

  local dir  = vim.fn.getcwd() .. "/zig-out/bin"
  local list = vim.fn.glob(dir .. "/*", 1, 1)
  if #list == 0 then
    error("no executables in zig-out/bin")
  end
  table.sort(list, function(a, b)
    return vim.loop.fs_stat(a).mtime.sec > vim.loop.fs_stat(b).mtime.sec
  end)
  return list[1] -- newest binary
end

-------------------------------------------------
-- codelldb adapter (define once) ---------------
-------------------------------------------------
dap.adapters.codelldb = dap.adapters.codelldb or {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.exepath("codelldb"), -- via Mason
    args = { "--port", "${port}" },
  },
  name = "codelldb",
}
if vim.fn.has("win32") == 1 then
  dap.adapters.codelldb.executable.detached = false
end

-------------------------------------------------
-- Zig configurations ---------------------------
-------------------------------------------------
dap.configurations.zig = {
  {
    name  = "Debug Test",
    type  = "codelldb",
    request = "launch",
    program = function() return run_build(ExecTypes.TEST) end,
    cwd   = "${workspaceFolder}",
    stopOnEntry = false,
    showDisassembly = "never",
  },
  {
    name  = "Debug Bin",
    type  = "codelldb",
    request = "launch",
    program = function() return run_build(ExecTypes.BIN) end,
    cwd   = "${workspaceFolder}",
    stopOnEntry = false,
    showDisassembly = "never",
  },
}

