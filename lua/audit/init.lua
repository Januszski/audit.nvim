local M = {}

function M.setup(opts)
	opts = opts or {}

	vim.notify("weaudit.nvim loaded 🚀", vim.log.levels.INFO)

	vim.api.nvim_create_user_command("WeAudit", function()
		require("weaudit").run()
	end, {})
end

function M.run()
	local bufnr = vim.api.nvim_get_current_buf()
	local file = vim.api.nvim_buf_get_name(bufnr)

	if file == "" then
		vim.notify("No file open", vim.log.levels.WARN)
		return
	end

	vim.notify("Running audit on: " .. file)

	print("Audit complete for: " .. file)
end

return M
