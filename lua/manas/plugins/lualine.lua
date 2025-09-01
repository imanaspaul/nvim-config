-- This file configures the lualine status bar plugin to your specifications.
-- It provides a minimalist and highly customized status line with a single-character
-- mode indicator, Git branch info, and cursor position.

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Required for icons and a better look

  -- We need to enable the plugin and configure it.
  config = function()
    -- This table defines the custom mode indicator.
    -- We use a single character for each mode.
    local mode_map = {
      n = 'N',       -- Normal
      i = 'I',       -- Insert
      v = 'V',       -- Visual
      V = 'L',       -- Visual Line
      ['\22'] = 'B', -- Visual Block
      c = 'C',       -- Command
      s = 'S',       -- Select
      S = 'L',       -- Select Line
      ['\19'] = 'B', -- Select Block
      R = 'R',       -- Replace
      t = 'T',       -- Terminal
      ['r\2'] = 'R', -- R Prompt
      ['!'] = '!',   -- Shell
    }

    -- Set up lualine with your custom configuration.
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' }, -- This removes separators.
        section_separators = { left = '', right = '' },   -- This makes the sections squared.
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        -- Left section of the status line
        lualine_a = {
          {
            'mode',
            -- Use a fallback character if the mode is not in the map
            fmt = function(str)
              local current_mode = vim.fn.mode()
              return mode_map[current_mode] or string.upper(current_mode)
            end,
            -- This makes the mode indicator a square.
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = { 'filename' },
        lualine_c = {},
        -- Right section of the status line
        lualine_x = { 'diagnostics' },
        lualine_y = { 'branch' },   -- Git branch
        lualine_z = { 'location' }, -- Cursor position
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    })
  end,
}
