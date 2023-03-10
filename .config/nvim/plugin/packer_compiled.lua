-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/anthony/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/bufdelete.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["fern.vim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/fern.vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n?\4\0\0\5\1\r\0\0295\0\0\0006\1\1\0009\1\2\0019\1\3\1\a\1\4\0X\1\n?6\1\1\0009\1\5\0019\1\6\1\18\3\1\0009\1\a\1B\1\2\2\a\1\b\0X\1\2?5\0\t\0X\1\n?6\1\1\0009\1\2\0019\1\3\1\18\3\1\0009\1\n\1'\4\v\0B\1\3\2\15\0\1\0X\2\1?5\0\f\0-\1\0\0008\1\1\0L\1\2\0\0?\1\0\n\fmagenta\f#d3869b\bred\f#ea6962\vorange\f#e78a4e\ngreen\f#a9b665\vfg_alt\f#ddc7a1\tcyan\f#89b482\vyellow\f#d8a657\abg\f#32302f\afg\f#d4be98\tblue\f#7daea3\fgruvbox\tfind\1\0\n\fmagenta\f#a626a4\bred\f#e45649\vorange\f#da8548\ngreen\f#50a14f\vfg_alt\f#9ca0a4\tcyan\f#0184bc\vyellow\f#986801\abg\f#c6c7c7\afg\f#383a42\tblue\f#4078f2\nlight\bget\15background\bopt\rdoom-one\16colors_name\6g\bvim\1\0\n\fmagenta\f#c678dd\bred\f#ff6c6b\vorange\f#da8548\ngreen\f#98be65\tcyan\f#46D9FF\vyellow\f#ECBE7B\abg\f#23272e\15section_bg\f#5B6268\afg\f#bbc2cf\tblue\f#51afef\20\1\1\2\0\1\0\0033\1\0\0002\0\0?L\1\2\0\0G\0\0\2\1\2\0\b-\0\0\0009\0\0\0B\0\1\2\a\0\1\0X\1\2?+\1\2\0L\1\2\0K\0\1\0\3?\14DASHBOARD\24get_buffer_filetypeG\0\0\2\1\2\0\b-\0\0\0009\0\0\0B\0\1\2\6\0\1\0X\1\2?+\1\2\0L\1\2\0K\0\1\0\3?\14DASHBOARD\24get_buffer_filetype\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t??? ?\4\0\0\6\1#\0r5\0\1\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\2\0-\1\0\0'\3\3\0B\1\2\2B\1\1\2=\1\4\0-\1\0\0'\3\5\0B\1\2\2B\1\1\2=\1\6\0-\1\0\0'\3\5\0B\1\2\2B\1\1\2=\1\a\0-\1\0\0'\3\5\0B\1\2\2B\1\1\2=\1\b\0-\1\0\0'\3\t\0B\1\2\2B\1\1\2=\1\n\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\v\0-\1\0\0'\3\f\0B\1\2\2B\1\1\2=\1\r\0-\1\0\0'\3\f\0B\1\2\2B\1\1\2=\1\14\0-\1\0\0'\3\f\0B\1\2\2B\1\1\2=\1\15\0-\1\0\0'\3\16\0B\1\2\2B\1\1\2=\1\17\0-\1\0\0'\3\t\0B\1\2\2B\1\1\2=\1\18\0-\1\0\0'\3\t\0B\1\2\2B\1\1\2=\1\19\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\20\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\21\0-\1\0\0'\3\22\0B\1\2\2B\1\1\2=\1\23\0-\1\0\0'\3\22\0B\1\2\2B\1\1\2=\1\24\0-\1\0\0'\3\22\0B\1\2\2B\1\1\2=\1\25\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\26\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\27\0006\1\28\0009\1\29\0019\1\30\1'\3\31\0006\4\28\0009\4 \0049\4!\4B\4\1\0028\4\4\0&\3\4\3B\1\2\1'\1\"\0L\1\2\0\6?\n???  \tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\breds\0\0\a\0\b\0\0166\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\0026\2\5\0009\2\6\2'\4\a\0\18\5\0\0\18\6\1\0D\2\4\0\16%3d : %2d  \vformat\vstring\bcol\6.\tline\afn\bvim?\1\0\0\6\1\v\0\31-\0\0\0009\0\0\0B\0\1\2\6\0\1\0X\0\r?'\0\2\0-\1\0\0009\1\0\1B\1\1\2\18\3\1\0009\1\3\1'\4\4\0006\5\5\0009\5\6\5B\1\4\2&\0\1\0L\0\2\0X\0\f?'\0\a\0006\1\b\0009\1\t\0019\1\n\1\18\3\1\0009\1\3\1'\4\4\0006\5\5\0009\5\6\5B\1\4\2&\0\1\0L\0\2\0K\0\1\0\2?\rfiletype\abo\bvim\t??? \nupper\vstring\b^%l\tgsub\t??? \18No Active Lsp\19get_lsp_clientJ\0\0\2\1\2\0\n5\0\0\0-\1\0\0009\1\1\0018\1\1\0\15\0\1\0X\2\2?+\1\1\0L\1\2\0+\1\2\0L\1\2\0\0?\rfiletype\1\0\2\14dashboard\2\5\2\21\0\0\1\0\1\0\2'\0\0\0L\0\2\0\n ??? \19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b   \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ???\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t??? \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ????\26\1\0\16\0w\1?\0046\0\0\0009\0\1\0006\1\2\0'\3\3\0B\1\2\0026\2\2\0'\4\4\0B\2\2\0026\3\2\0'\5\5\0B\3\2\0026\4\2\0'\6\6\0B\4\2\0029\5\a\0015\6\t\0=\6\b\0013\6\n\0003\a\v\0003\b\f\0009\t\r\0055\n\20\0005\v\15\0003\f\14\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v\21\n>\n\1\t9\t\r\0055\n\26\0005\v\23\0003\f\22\0=\f\16\v5\f\25\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\2>\r\2\f=\f\19\v=\v\27\n>\n\2\t9\t\r\0055\n!\0005\v\28\0009\f\29\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\v\"\n>\n\3\t9\t\r\0055\n&\0005\v#\0009\f\29\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0006\r\2\0'\15$\0B\r\2\0029\r%\r>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v'\n>\n\4\t9\t\r\0055\n*\0005\v(\0009\f\29\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v5\f)\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\2>\r\2\f=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\v+\n>\n\5\t9\t\r\0055\n/\0005\v-\0003\f,\0=\f\16\v=\b\30\v4\f\3\0\18\r\6\0'\15.\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v0\n>\n\6\t9\t\r\0055\n2\0005\v1\0=\b\30\v4\f\3\0\18\r\6\0'\15.\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\v3\n>\n\a\t9\t\r\0055\n5\0005\v4\0=\b\30\v4\f\3\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v6\n>\n\b\t9\t\r\0055\n9\0005\v7\0=\b\30\v4\f\3\0\18\r\6\0'\0158\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v:\n>\n\t\t9\t\r\0055\n<\0005\v;\0=\b\30\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v=\n>\n\n\t9\t>\0055\nA\0005\v?\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vB\n>\n\1\t9\t>\0055\nD\0005\vC\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vE\n>\n\2\t9\t>\0055\nI\0005\vG\0003\fF\0=\f\16\v3\fH\0=\f\30\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vJ\n>\n\3\t9\t>\0055\nN\0005\vL\0003\fK\0=\f\16\v9\fM\4=\f\30\v4\f\3\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vO\n>\n\4\t9\t>\0055\nS\0005\vP\0009\fM\4=\f\30\v5\fR\0\18\r\6\0'\15Q\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\2>\r\2\f=\f\19\v=\vT\n>\n\5\t9\t>\0055\nW\0005\vV\0003\fU\0=\f\16\v=\b\30\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vX\n>\n\6\t9\t>\0055\nZ\0005\vY\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15Q\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v[\n>\n\a\t9\t>\0055\n]\0005\v\\\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\0158\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v^\n>\n\b\t9\t>\0055\n`\0005\v_\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\va\n>\n\t\t9\t>\0055\nd\0005\vc\0003\fb\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\ve\n>\n\v\t9\tf\0055\ni\0005\vh\0003\fg\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vj\n>\n\1\t9\tf\0055\nl\0005\vk\0=\b\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vm\n>\n\2\t9\tn\0055\nq\0005\vo\0=\b\30\v4\f\3\0\18\r\6\0'\15p\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vr\n>\n\1\t9\tn\0055\nu\0005\vt\0003\fs\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vv\n>\n\2\t2\0\0?K\0\1\0\22ShortRainbowRight\1\0\0\1\0\0\0\15BufferIcon\1\0\0\vyellow\1\0\1\rprovider\15BufferIcon\21short_line_right\15BufferType\1\0\0\1\0\1\rprovider\17FileTypeName\21ShortRainbowLeft\1\0\0\1\0\0\0\20short_line_left\17RainbowRight\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\2\rprovider\15DiffRemove\ticon\t??? \17DiffModified\1\0\0\1\0\2\rprovider\17DiffModified\ticon\t??? \fDiffAdd\1\0\0\1\0\2\rprovider\fDiffAdd\ticon\t??? \18DiffSeparator\1\0\0\1\0\0\0\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\ngreen\1\0\1\rprovider\14GitBranch\fGitIcon\1\0\0\24check_git_workspace\1\0\1\14separator\6 \0\28ShowLspClientOrFileType\1\0\0\0\1\0\1\14separator\a  \0\15FileEncode\1\0\0\1\0\2\14separator\6 \rprovider\15FileEncode\15FileFormat\1\0\0\18hide_in_width\1\0\2\14separator\a  \rprovider\15FileFormat\nright\19DiagnosticInfo\1\0\0\1\0\2\rprovider\19DiagnosticInfo\ticon\b???\19DiagnosticWarn\1\0\0\vorange\1\0\2\rprovider\19DiagnosticWarn\ticon\b???\20DiagnosticError\1\0\0\1\0\2\rprovider\20DiagnosticError\ticon\b???\16LinePercent\1\0\0\1\0\2\14separator\a  \rprovider\16LinePercent\rLineInfo\1\0\0\vfg_alt\1\0\0\0\rFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\2\14separator\6 \rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color!galaxyline.provider_fileinfo\1\0\1\rprovider\rFileIcon\rFileSize\1\0\0\24separator_highlight\afg\14condition\21buffer_not_empty\1\0\2\14separator\6 \rprovider\rFileSize\vViMode\1\0\0\1\4\0\0\0\0\tbold\bred\1\0\0\0\16RainbowLeft\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\0\0\0\1\5\0\0\rNvimTree\vpacker\fOutline\15toggleterm\20short_line_list\fsection\25galaxyline.condition\31galaxyline.provider_buffer\28galaxyline.provider_lsp\15galaxyline\frequire\abo\bvim\5????\4\0" },
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  ["mkdir.nvim"] = {
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0" },
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/mkdir.nvim"
  },
  neogit = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/neogit"
  },
  neon = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/neon"
  },
  neorg = {
    config = { "\27LJ\2\n?\1\0\0\a\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0005\6\6\0=\6\b\5=\5\n\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/neorg"
  },
  nerdtree = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nerdtree"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nvim-base16"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0" },
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nvim-peekup"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["shade.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/shade.nvim"
  },
  ["specs.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/specs.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/suda.vim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-afterimage"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/vim-afterimage"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-lessmess"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/vim-lessmess"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["virtual-types.nvim"] = {
    loaded = true,
    path = "/Users/anthony/.local/share/nvim/site/pack/packer/start/virtual-types.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n?\1\0\0\a\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0035\4\t\0005\5\a\0005\6\6\0=\6\b\5=\5\n\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\tload\1\0\0\21core.norg.dirman\vconfig\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n?\4\0\0\5\1\r\0\0295\0\0\0006\1\1\0009\1\2\0019\1\3\1\a\1\4\0X\1\n?6\1\1\0009\1\5\0019\1\6\1\18\3\1\0009\1\a\1B\1\2\2\a\1\b\0X\1\2?5\0\t\0X\1\n?6\1\1\0009\1\2\0019\1\3\1\18\3\1\0009\1\n\1'\4\v\0B\1\3\2\15\0\1\0X\2\1?5\0\f\0-\1\0\0008\1\1\0L\1\2\0\0?\1\0\n\fmagenta\f#d3869b\bred\f#ea6962\vorange\f#e78a4e\ngreen\f#a9b665\vfg_alt\f#ddc7a1\tcyan\f#89b482\vyellow\f#d8a657\abg\f#32302f\afg\f#d4be98\tblue\f#7daea3\fgruvbox\tfind\1\0\n\fmagenta\f#a626a4\bred\f#e45649\vorange\f#da8548\ngreen\f#50a14f\vfg_alt\f#9ca0a4\tcyan\f#0184bc\vyellow\f#986801\abg\f#c6c7c7\afg\f#383a42\tblue\f#4078f2\nlight\bget\15background\bopt\rdoom-one\16colors_name\6g\bvim\1\0\n\fmagenta\f#c678dd\bred\f#ff6c6b\vorange\f#da8548\ngreen\f#98be65\tcyan\f#46D9FF\vyellow\f#ECBE7B\abg\f#23272e\15section_bg\f#5B6268\afg\f#bbc2cf\tblue\f#51afef\20\1\1\2\0\1\0\0033\1\0\0002\0\0?L\1\2\0\0G\0\0\2\1\2\0\b-\0\0\0009\0\0\0B\0\1\2\a\0\1\0X\1\2?+\1\2\0L\1\2\0K\0\1\0\3?\14DASHBOARD\24get_buffer_filetypeG\0\0\2\1\2\0\b-\0\0\0009\0\0\0B\0\1\2\6\0\1\0X\1\2?+\1\2\0L\1\2\0K\0\1\0\3?\14DASHBOARD\24get_buffer_filetype\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t??? ?\4\0\0\6\1#\0r5\0\1\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\2\0-\1\0\0'\3\3\0B\1\2\2B\1\1\2=\1\4\0-\1\0\0'\3\5\0B\1\2\2B\1\1\2=\1\6\0-\1\0\0'\3\5\0B\1\2\2B\1\1\2=\1\a\0-\1\0\0'\3\5\0B\1\2\2B\1\1\2=\1\b\0-\1\0\0'\3\t\0B\1\2\2B\1\1\2=\1\n\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\v\0-\1\0\0'\3\f\0B\1\2\2B\1\1\2=\1\r\0-\1\0\0'\3\f\0B\1\2\2B\1\1\2=\1\14\0-\1\0\0'\3\f\0B\1\2\2B\1\1\2=\1\15\0-\1\0\0'\3\16\0B\1\2\2B\1\1\2=\1\17\0-\1\0\0'\3\t\0B\1\2\2B\1\1\2=\1\18\0-\1\0\0'\3\t\0B\1\2\2B\1\1\2=\1\19\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\20\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\21\0-\1\0\0'\3\22\0B\1\2\2B\1\1\2=\1\23\0-\1\0\0'\3\22\0B\1\2\2B\1\1\2=\1\24\0-\1\0\0'\3\22\0B\1\2\2B\1\1\2=\1\25\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\26\0-\1\0\0'\3\0\0B\1\2\2B\1\1\2=\1\27\0006\1\28\0009\1\29\0019\1\30\1'\3\31\0006\4\28\0009\4 \0049\4!\4B\4\1\0028\4\4\0&\3\4\3B\1\2\1'\1\"\0L\1\2\0\6?\n???  \tmode\afn\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\breds\0\0\a\0\b\0\0166\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\0026\2\5\0009\2\6\2'\4\a\0\18\5\0\0\18\6\1\0D\2\4\0\16%3d : %2d  \vformat\vstring\bcol\6.\tline\afn\bvim?\1\0\0\6\1\v\0\31-\0\0\0009\0\0\0B\0\1\2\6\0\1\0X\0\r?'\0\2\0-\1\0\0009\1\0\1B\1\1\2\18\3\1\0009\1\3\1'\4\4\0006\5\5\0009\5\6\5B\1\4\2&\0\1\0L\0\2\0X\0\f?'\0\a\0006\1\b\0009\1\t\0019\1\n\1\18\3\1\0009\1\3\1'\4\4\0006\5\5\0009\5\6\5B\1\4\2&\0\1\0L\0\2\0K\0\1\0\2?\rfiletype\abo\bvim\t??? \nupper\vstring\b^%l\tgsub\t??? \18No Active Lsp\19get_lsp_clientJ\0\0\2\1\2\0\n5\0\0\0-\1\0\0009\1\1\0018\1\1\0\15\0\1\0X\2\2?+\1\1\0L\1\2\0+\1\2\0L\1\2\0\0?\rfiletype\1\0\2\14dashboard\2\5\2\21\0\0\1\0\1\0\2'\0\0\0L\0\2\0\n ??? \19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b   \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ???\20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t??? \20\0\0\1\0\1\0\2'\0\0\0L\0\2\0\t ????\26\1\0\16\0w\1?\0046\0\0\0009\0\1\0006\1\2\0'\3\3\0B\1\2\0026\2\2\0'\4\4\0B\2\2\0026\3\2\0'\5\5\0B\3\2\0026\4\2\0'\6\6\0B\4\2\0029\5\a\0015\6\t\0=\6\b\0013\6\n\0003\a\v\0003\b\f\0009\t\r\0055\n\20\0005\v\15\0003\f\14\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v\21\n>\n\1\t9\t\r\0055\n\26\0005\v\23\0003\f\22\0=\f\16\v5\f\25\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\2>\r\2\f=\f\19\v=\v\27\n>\n\2\t9\t\r\0055\n!\0005\v\28\0009\f\29\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\v\"\n>\n\3\t9\t\r\0055\n&\0005\v#\0009\f\29\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0006\r\2\0'\15$\0B\r\2\0029\r%\r>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v'\n>\n\4\t9\t\r\0055\n*\0005\v(\0009\f\29\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v5\f)\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\2>\r\2\f=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\v+\n>\n\5\t9\t\r\0055\n/\0005\v-\0003\f,\0=\f\16\v=\b\30\v4\f\3\0\18\r\6\0'\15.\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v0\n>\n\6\t9\t\r\0055\n2\0005\v1\0=\b\30\v4\f\3\0\18\r\6\0'\15.\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\v3\n>\n\a\t9\t\r\0055\n5\0005\v4\0=\b\30\v4\f\3\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v6\n>\n\b\t9\t\r\0055\n9\0005\v7\0=\b\30\v4\f\3\0\18\r\6\0'\0158\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v:\n>\n\t\t9\t\r\0055\n<\0005\v;\0=\b\30\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v=\n>\n\n\t9\t>\0055\nA\0005\v?\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vB\n>\n\1\t9\t>\0055\nD\0005\vC\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vE\n>\n\2\t9\t>\0055\nI\0005\vG\0003\fF\0=\f\16\v3\fH\0=\f\30\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vJ\n>\n\3\t9\t>\0055\nN\0005\vL\0003\fK\0=\f\16\v9\fM\4=\f\30\v4\f\3\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f \v=\vO\n>\n\4\t9\t>\0055\nS\0005\vP\0009\fM\4=\f\30\v5\fR\0\18\r\6\0'\15Q\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\2>\r\2\f=\f\19\v=\vT\n>\n\5\t9\t>\0055\nW\0005\vV\0003\fU\0=\f\16\v=\b\30\v4\f\3\0\18\r\6\0'\15\18\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vX\n>\n\6\t9\t>\0055\nZ\0005\vY\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15Q\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v[\n>\n\a\t9\t>\0055\n]\0005\v\\\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\0158\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\v^\n>\n\b\t9\t>\0055\n`\0005\v_\0009\f@\4\15\0\f\0X\r\1?\18\f\b\0=\f\30\v4\f\3\0\18\r\6\0'\15\24\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\va\n>\n\t\t9\t>\0055\nd\0005\vc\0003\fb\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\ve\n>\n\v\t9\tf\0055\ni\0005\vh\0003\fg\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vj\n>\n\1\t9\tf\0055\nl\0005\vk\0=\b\30\v4\f\3\0\18\r\6\0'\15\31\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vm\n>\n\2\t9\tn\0055\nq\0005\vo\0=\b\30\v4\f\3\0\18\r\6\0'\15p\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vr\n>\n\1\t9\tn\0055\nu\0005\vt\0003\fs\0=\f\16\v4\f\3\0\18\r\6\0'\15\17\0B\r\2\2>\r\1\f\18\r\6\0'\15\18\0B\r\2\0?\r\0\0=\f\19\v=\vv\n>\n\2\t2\0\0?K\0\1\0\22ShortRainbowRight\1\0\0\1\0\0\0\15BufferIcon\1\0\0\vyellow\1\0\1\rprovider\15BufferIcon\21short_line_right\15BufferType\1\0\0\1\0\1\rprovider\17FileTypeName\21ShortRainbowLeft\1\0\0\1\0\0\0\20short_line_left\17RainbowRight\1\0\0\1\0\0\0\15DiffRemove\1\0\0\1\0\2\rprovider\15DiffRemove\ticon\t??? \17DiffModified\1\0\0\1\0\2\rprovider\17DiffModified\ticon\t??? \fDiffAdd\1\0\0\1\0\2\rprovider\fDiffAdd\ticon\t??? \18DiffSeparator\1\0\0\1\0\0\0\14GitBranch\1\0\0\1\4\0\0\0\0\tbold\ngreen\1\0\1\rprovider\14GitBranch\fGitIcon\1\0\0\24check_git_workspace\1\0\1\14separator\6 \0\28ShowLspClientOrFileType\1\0\0\0\1\0\1\14separator\a  \0\15FileEncode\1\0\0\1\0\2\14separator\6 \rprovider\15FileEncode\15FileFormat\1\0\0\18hide_in_width\1\0\2\14separator\a  \rprovider\15FileFormat\nright\19DiagnosticInfo\1\0\0\1\0\2\rprovider\19DiagnosticInfo\ticon\b???\19DiagnosticWarn\1\0\0\vorange\1\0\2\rprovider\19DiagnosticWarn\ticon\b???\20DiagnosticError\1\0\0\1\0\2\rprovider\20DiagnosticError\ticon\b???\16LinePercent\1\0\0\1\0\2\14separator\a  \rprovider\16LinePercent\rLineInfo\1\0\0\vfg_alt\1\0\0\0\rFileName\1\0\0\1\4\0\0\0\0\tbold\1\0\2\14separator\6 \rprovider\rFileName\rFileIcon\1\0\0\24get_file_icon_color!galaxyline.provider_fileinfo\1\0\1\rprovider\rFileIcon\rFileSize\1\0\0\24separator_highlight\afg\14condition\21buffer_not_empty\1\0\2\14separator\6 \rprovider\rFileSize\vViMode\1\0\0\1\4\0\0\0\0\tbold\bred\1\0\0\0\16RainbowLeft\1\0\0\14highlight\abg\tblue\rprovider\1\0\0\0\tleft\0\0\0\1\5\0\0\rNvimTree\vpacker\fOutline\15toggleterm\20short_line_list\fsection\25galaxyline.condition\31galaxyline.provider_buffer\28galaxyline.provider_lsp\15galaxyline\frequire\abo\bvim\5????\4\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17nvim_comment\frequire\0", "config", "nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: mkdir.nvim
time([[Config for mkdir.nvim]], true)
try_loadstring("\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0", "config", "mkdir.nvim")
time([[Config for mkdir.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
