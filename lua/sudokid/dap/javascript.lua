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

local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact"
}

for _, lang in ipairs(js_based_languages) do
  dap.configurations[lang] = {
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

    -- Divider for the launch.json derived configs
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },
  }
end
