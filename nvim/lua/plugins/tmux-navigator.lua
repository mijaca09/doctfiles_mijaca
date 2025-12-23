return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Move left to tmux pane" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Move down to tmux pane" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Move up to tmux pane" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Move right to tmux pane" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Move to previous tmux pane" },
  },
}
