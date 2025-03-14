local wezterm = require("wezterm")

local config = {
	default_prog = { "nu" },
	font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" }),
	font_size = 12.0,
	color_scheme = "Monokai Pro (Gogh)",
}

wezterm.on("format-tab-title", function(tab)
	-- Get the current working directory
	local cwd_uri = tab.active_pane.current_working_dir

	if cwd_uri then
		-- Extract path from the file URI (removes "file://")
		local cwd = cwd_uri.file_path or cwd_uri

		-- Extract only the last folder name
		local folder_name = cwd:match("([^/\\]+)[/\\]?$") or "?"

		return " " .. folder_name .. " " -- Add spaces for padding
	end

	return " ? " -- Fallback in case of error
end)

return config
