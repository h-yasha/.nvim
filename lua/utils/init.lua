M = {}

--- @type fun(o: any): string
M.dump = function(o)
  if vim.inspect then
    return vim.inspect(o)
  end

  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

--- @type fun(name: string): boolean
M.isModuleAvailable = function(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        -- package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

return M
