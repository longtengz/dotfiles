-- https://github.com/asmagill/hs._asm.undocumented.spaces
local spaces = require('hs._asm.undocumented.spaces') 

-- Switch kitty
hs.hotkey.bind({'ctrl'}, '5', function ()
  local APP_NAME = 'kitty'
  function moveWindow(kitty, space, mainScreen)
    -- move to main space
    local win = nil
    while win == nil do
      win = kitty:mainWindow()
    end
    print(win)
    print(space)
    print(win:screen())
    print(mainScreen)
    local fullScreen = not win:isStandard()
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, kitty)
    end
    winFrame = win:frame()
    scrFrame = mainScreen:fullFrame()
    print(winFrame)
    print(scrFrame)
    winFrame.w = scrFrame.w
    winFrame.y = scrFrame.y
    winFrame.x = scrFrame.x
    print(winFrame)
    win:setFrame(winFrame, 0)
    print(win:frame())
    win:spacesMoveTo(space)
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, kitty)
    end
    win:focus()
  end
  local kitty = hs.application.get(APP_NAME)
  if kitty ~= nil and kitty:isFrontmost() then
    kitty:hide()
  else
    local space = spaces.activeSpace()
    local mainScreen = hs.screen.find(spaces.mainScreenUUID())
    if kitty == nil and hs.application.launchOrFocus(APP_NAME) then
      local appWatcher = nil
      print('create app watcher')
      appWatcher = hs.application.watcher.new(function(name, event, app)
        print(name)
        print(event)
        if event == hs.application.watcher.launched and name == APP_NAME then
          app:hide()
          moveWindow(app, space, mainScreen)
          appWatcher:stop()
        end
      end)
      print('start watcher')
      appWatcher:start()
    end
    if kitty ~= nil then
      moveWindow(kitty, space, mainScreen)
    end
  end
end)

-- Hide kitty if not in focus
-- hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
  -- local kitty = hs.application.get('kitty')
  -- if kitty ~= nil then
     -- kitty:hide()
  -- end
-- end)
