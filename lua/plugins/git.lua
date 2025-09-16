return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "sindrets/diffview.nvim",
    },
    lazy = false,
    config = function()
      require("neogit").setup({
        disable_signs = false,
        disable_hint = false,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        auto_refresh = true,
        disable_builtin_notifications = false,
        use_magit_keybindings = false,
        commit_popup = {
          kind = "split",
        },
        popup = {
          kind = "split",
        },
        kind = "split",
        signs = {
          -- { CLOSED, OPENED }
          section = { ">", "v" },
          item = { ">", ">" },
          hunk = { "", "" },
        },
        integrations = {
          diffview = true,
        },
        sections = {
          untracked = {
            folded = false,
          },
          unstaged = {
            folded = false,
          },
          staged = {
            folded = false,
          },
          stashes = {
            folded = true,
          },
          unpulled_upstream = {
            folded = true,
          },
          unmerged_upstream = {
            folded = false,
          },
          recent = {
            folded = true,
          },
          rebase = {
            folded = true,
          },
        },
        mappings = {
          finder = {
            ["<cr>"] = "Select",
            ["<c-c>"] = "Close",
            ["<esc>"] = "Close",
            ["<c-n>"] = "Next",
            ["<c-p>"] = "Previous",
            ["<down>"] = "Next",
            ["<up>"] = "Previous",
          },
          main = {
            ["<c-n>"] = "Next",
            ["<c-p>"] = "Previous",
            ["<down>"] = "Next",
            ["<up>"] = "Previous",
            ["<cr>"] = "Toggle",
            ["<c-v>"] = "VSplitOpen",
            ["<c-x>"] = "SplitOpen",
            ["<c-t>"] = "TabOpen",
            ["?"] = "HelpPopup",
            ["c"] = "CommitPopup",
            ["P"] = "PushPopup",
            ["p"] = "PullPopup",
            ["r"] = "RebasePopup",
            ["m"] = "MergePopup",
            ["R"] = "ResetPopup",
            ["X"] = "ResetSoftPopup",
            ["D"] = "DiffPopup",
            ["z"] = "StashPopup",
            ["<c-r>"] = "RefreshBuffer",
            ["<enter>"] = "GoToFile",
          },
          textinput = {
            ["<c-c>"] = "Close",
            ["<cr>"] = "Confirm",
            ["<c-n>"] = "Next",
            ["<c-p>"] = "Previous",
            ["<c-u>"] = "ScrollUp",
            ["<c-d>"] = "ScrollDown",
          },
        },
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
        icons = {
          folder_closed = "",
          folder_open = "",
        },
        signs = {
          fold_closed = "",
          fold_open = "",
        },
        file_panel = {
          win_config = {
            width = 35,
          },
        },
      })
    end,
  },
} 