-- open nvim tree if I pass in 0 args
if vim.fn.argc(-1) == 0 then
  vim.cmd("Neotree reveal")
end
