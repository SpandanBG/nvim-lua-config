local harpoon = require("harpoon")
harpoon:setup()

-- Open harpoon list in a Telescope picker
local function harpoon_telescope()
  local conf = require("telescope.config").values
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local items = harpoon:list().items
  local entries = {}
  for i, item in ipairs(items) do
    table.insert(entries, { idx = i, value = item.value })
  end

  pickers.new({}, {
    prompt_title = "Harpoon",
    finder = finders.new_table({
      results = entries,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.idx .. ": " .. entry.value,
          ordinal = entry.value,
          path = entry.value,
        }
      end,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        harpoon:list():select(selection.value.idx)
      end)
      return true
    end,
  }):find()
end

-- Harpoon Keymaps
vim.keymap.set("n", "<F1>",       function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hh", harpoon_telescope)
vim.keymap.set("n", "<leader>[",  function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>]",  function() harpoon:list():next() end)
