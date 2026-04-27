require('dap-vscode-js').setup({
  -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- node_path = "node",

  -- Path to vscode-js-debug installation.
  -- debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

  -- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
  -- debugger_cmd = { "js-debug-adapter" },

  -- which adapters to register in nvim-dap
  adapters = {
    "chrome",
    "pwa-node",
    "pwa-chrome",
    "pwa-msedge",
    "pwa-extensionHost",
    "node-terminal",
  },

  -- Path for file logging
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

  -- Logging level for output to file. Set to false to disable logging.
  -- log_file_level = false,

  -- Logging level for output to console. Set to false to disable console output.
  -- log_console_level = vim.log.levels.ERROR,
})

local dap = require('dap')

local js_debug_server = vim.fn.stdpath("data")
  .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

local function js_debug_adapter(cb)
  local tcp = vim.uv.new_tcp()
  tcp:bind("127.0.0.1", 0)
  local port = tcp:getsockname().port
  tcp:shutdown()
  tcp:close()
  cb({
    type = "server",
    host = "::1",
    port = port,
    executable = {
      command = "node",
      args = { js_debug_server, tostring(port) },
    },
  })
end

dap.adapters["pwa-node"] = js_debug_adapter
dap.adapters["pwa-chrome"] = js_debug_adapter

local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact"
}

for _, lang in ipairs(js_based_languages) do
  dap.configurations[lang] = {
    -- Debug Vitest
    {
      name                     = "Debug current Vitest file",
      type                     = "pwa-node",
      request                  = "launch",
      program                  = "${workspaceFolder}/node_modules/vitest/vitest.mjs",

      -- ① keep Node in break-and-wait mode
      runtimeExecutable        = "node",
      runtimeArgs              = { "--inspect" },
      stopOnEntry              = false,

      -- ② Vitest CLI arguments
      args                     = {
        "run",
        "--no-file-parallelism", -- ← replaces the old --threads false
        "--test-timeout=0",      -- same effect, new syntax
        "${file}",
      },

      cwd                      = "${workspaceFolder}",
      autoAttachChildProcesses = true,
      smartStep                = true,
      console                  = "integratedTerminal",
      internalConsoleOptions   = "neverOpen",
      sourceMaps               = true,
      skipFiles                = { "<node_internals>/**", "**/node_modules/**" },
    },

    -- Debug Jest
    {
      name = 'Jest Test',
      type = 'pwa-node',
      request = 'launch',
      program = '${workspaceFolder}/node_modules/.bin/jest',
      args = { '${fileBasename}', '--runInBand' },
      cwd = vim.fn.getcwd(),
      protocol = 'inspector',
      console = 'integratedTerminal',
    },

    -- Debug single nodejs files
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    },

    -- Debug nodejs processes (make sure to add --inspect when you run the process)
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
    },

    -- Debug web applications (client side)
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch & Debug Chrome",
      url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({
            prompt = "Enter URL: ",
            default = "http://localhost:3000",
          }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      webRoot = vim.fn.getcwd(),
      protocol = "inspector",
      sourceMaps = true,
      userDataDir = false,
    },

    -- Debug web app in Chrome on Android Emulator (via ADB port forward)
    {
      name = "Attach to Chrome (Android Emulator)",
      type = "pwa-chrome",
      request = "attach",
      port = function()
        local result = vim.fn.system("adb forward tcp:9222 localabstract:chrome_devtools_remote")
        vim.notify("adb forward: " .. vim.trim(result), vim.log.levels.INFO)
        return 9222
      end,
      address = "localhost",
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**", "**/node_modules/**" },
      urlFilter = "*",
      sourceMapPathOverrides = {
        ["/*"]               = "${webRoot}/*",
        ["webpack://_N_E/*"] = "${webRoot}/*",
        ["webpack:///*"]     = "${webRoot}/*",
        ["webpack:///./~/*"] = "${webRoot}/node_modules/*",
      },
    },

    -- Divider for the launch.json derived configs
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },
  }
end
