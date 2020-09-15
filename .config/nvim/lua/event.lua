local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

function autocmd.load_autocmds()
    local definitions = {
        bufs = {
            {"BufRead, BufNewFile", "*.cmd", "set filetype=cmd"};
            {"BufRead, BufNewFile", "*.ucf", "set filetype=ucf"};

            {"BufNewFile", ".gitignore", "#basic\n.vscode\n*.pdf\n*.doc\n*.docx\n*.rar\n*.txt\n*.html\n*.jpg\n*.chm\n*.log\n*.zip\n*.xml\ntmp\nGPATH\nGRTAGS\nGTAGS*"};
        };
        wins = {
            {"VimLeave", "*", [[mksession! ~/.config/nvim_session.vim]]};
            {"FocusGained", "* checktime"};
        };
    }

    autocmd.nvim_create_augroups(definitions)
end

return autocmd
